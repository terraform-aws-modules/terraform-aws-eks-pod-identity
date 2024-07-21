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
    for_each = var.trust_policy_statements

    content {
      sid           = try(statement.value.sid, null)
      actions       = try(statement.value.actions, null)
      not_actions   = try(statement.value.not_actions, null)
      effect        = try(statement.value.effect, null)
      resources     = try(statement.value.resources, null)
      not_resources = try(statement.value.not_resources, null)

      dynamic "principals" {
        for_each = try(statement.value.principals, [])

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = try(statement.value.not_principals, [])

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = try(statement.value.conditions, [])

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
    for_each = var.policy_statements

    content {
      sid           = try(statement.value.sid, null)
      actions       = try(statement.value.actions, null)
      not_actions   = try(statement.value.not_actions, null)
      effect        = try(statement.value.effect, null)
      resources     = try(statement.value.resources, null)
      not_resources = try(statement.value.not_resources, null)

      dynamic "principals" {
        for_each = try(statement.value.principals, [])

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = try(statement.value.not_principals, [])

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = try(statement.value.conditions, [])

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

  cluster_name    = try(each.value.cluster_name, var.association_defaults.cluster_name)
  namespace       = try(each.value.namespace, var.association_defaults.namespace)
  service_account = try(each.value.service_account, var.association_defaults.service_account)
  role_arn        = aws_iam_role.this[0].arn

  tags = merge(var.tags, try(each.value.tags, var.association_defaults.tags, {}))
}
