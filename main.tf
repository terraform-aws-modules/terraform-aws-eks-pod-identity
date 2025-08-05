data "aws_partition" "current" {}

locals {
  partition = data.aws_partition.current.partition
}

################################################################################
# IAM Role Trust Policy
################################################################################

data "aws_iam_policy_document" "assume" {
  count = var.create ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    principals {
      type        = "Service"
      identifiers = ["pods.eks.amazonaws.com"]
    }

    dynamic "condition" {
      for_each = var.trust_policy_conditions

      content {
        test     = condition.value.test
        values   = condition.value.values
        variable = condition.value.variable
      }
    }
  }

  dynamic "statement" {
    for_each = var.trust_policy_statements != null ? var.trust_policy_statements : []

    content {
      sid           = statement.value.sid
      actions       = statement.value.actions
      not_actions   = statement.value.not_actions
      effect        = statement.value.effect
      resources     = statement.value.resources
      not_resources = statement.value.not_resources

      dynamic "principals" {
        for_each = statement.value.principals != null ? statement.value.principals : []

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = statement.value.not_principals != null ? statement.value.not_principals : []

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = statement.value.condition != null ? statement.value.condition : []

        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
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

################################################################################
# Base IAM Policy Document
################################################################################

data "aws_iam_policy_document" "base" {
  count = var.create ? 1 : 0

  source_policy_documents = var.source_policy_documents
  # Override will happen on each final document
  # Here, it is only applicable for the custom policy document to avoid duplicate statements
  override_policy_documents = var.attach_custom_policy ? var.override_policy_documents : []

  dynamic "statement" {
    for_each = var.policy_statements != null ? var.policy_statements : []

    content {
      sid           = statement.value.sid
      actions       = statement.value.actions
      not_actions   = statement.value.not_actions
      effect        = statement.value.effect
      resources     = statement.value.resources
      not_resources = statement.value.not_resources

      dynamic "principals" {
        for_each = statement.value.principals != null ? statement.value.principals : []

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = statement.value.not_principals != null ? statement.value.not_principals : []

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = statement.value.condition != null ? statement.value.condition : []

        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
    }
  }
}

################################################################################
# Custom IAM Policy
################################################################################

resource "aws_iam_policy" "custom" {
  count = var.create && var.attach_custom_policy ? 1 : 0

  name        = var.use_name_prefix ? null : var.name
  name_prefix = var.use_name_prefix ? "${var.name}-" : null
  path        = var.path
  description = var.custom_policy_description
  policy      = data.aws_iam_policy_document.base[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "custom" {
  count = var.create && var.attach_custom_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.custom[0].arn
}

################################################################################
# Pod Identity Association
################################################################################

resource "aws_eks_pod_identity_association" "this" {
  for_each = { for k, v in var.associations : k => v if var.create }

  region = var.region

  cluster_name         = try(coalesce(each.value.cluster_name, var.association_defaults.cluster_name))
  disable_session_tags = try(coalesce(each.value.disable_session_tags, var.association_defaults.disable_session_tags), null)
  namespace            = try(coalesce(each.value.namespace, var.association_defaults.namespace))
  role_arn             = aws_iam_role.this[0].arn
  service_account      = try(coalesce(each.value.service_account, var.association_defaults.service_account))
  target_role_arn      = try(coalesce(each.value.target_role_arn, var.association_defaults.target_role_arn), null)

  tags = merge(
    var.tags,
    each.value.tags,
    var.association_defaults.tags,
  )
}
