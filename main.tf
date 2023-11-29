data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  partition  = data.aws_partition.current.partition
  dns_suffix = data.aws_partition.current.dns_suffix

  name_condition = var.name != null ? var.name : "${var.name}*"
}

################################################################################
# IAM Role Trust Policy
################################################################################

data "aws_iam_policy_document" "assume" {
  count = var.create ? 1 : 0

  dynamic "statement" {
    # https://aws.amazon.com/blogs/security/announcing-an-update-to-iam-role-trust-policy-behavior/
    for_each = var.enable_role_self_assume ? [1] : []

    content {
      sid     = "ExplicitSelfRoleAssumption"
      effect  = "Allow"
      actions = ["sts:AssumeRole"]

      principals {
        type        = "AWS"
        identifiers = ["*"]
      }

      condition {
        test     = "ArnLike"
        variable = "aws:PrincipalArn"
        values   = ["arn:${local.partition}:iam::${local.account_id}:role${var.path}${local.name_condition}"]
      }
    }
  }

  dynamic "statement" {
    for_each = { for k, v in var.oidc_providers : k => v if var.enable_irsa }

    content {
      effect  = "Allow"
      actions = ["sts:AssumeRoleWithWebIdentity"]

      principals {
        type        = "Federated"
        identifiers = [statement.value.provider_arn]
      }

      condition {
        test     = var.assume_role_condition_test
        variable = "${replace(statement.value.provider_arn, "/^(.*provider/)/", "")}:sub"
        values   = [for sa in statement.value.namespace_service_accounts : "system:serviceaccount:${sa}"]
      }

      # https://aws.amazon.com/premiumsupport/knowledge-center/eks-troubleshoot-oidc-and-irsa/?nc1=h_ls
      condition {
        test     = var.assume_role_condition_test
        variable = "${replace(statement.value.provider_arn, "/^(.*provider/)/", "")}:aud"
        values   = ["sts.amazonaws.com"]
      }

    }
  }

  dynamic "statement" {
    for_each = var.enable_pod_identity ? [1] : []

    content {
      effect = "Allow"
      actions = [
        "sts:AssumeRole",
        "sts:TagSession",
      ]

      principals {
        type        = "Service"
        identifiers = ["pods.eks.amazonaws.com"]
      }
    }
  }
}

################################################################################
# IAM Role
################################################################################

resource "aws_iam_role" "this" {
  count = var.create ? 1 : 0

  name        = var.use_name_prefix ? null : var.name
  name_prefix = var.use_name_prefix ? "${var.name}-" : null
  path        = var.path
  description = var.description

  assume_role_policy    = data.aws_iam_policy_document.assume[0].json
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary_arn
  force_detach_policies = true

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = { for k, v in var.additional_policy_arns : k => v if var.create }

  role       = aws_iam_role.this[0].name
  policy_arn = each.value
}
