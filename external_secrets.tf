################################################################################
# External Secrets Policy
################################################################################

# https://github.com/external-secrets/kubernetes-external-secrets#add-a-secret

data "aws_iam_policy_document" "external_secrets" {
  count = var.create && var.attach_external_secrets_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  dynamic "statement" {
    for_each = length(var.external_secrets_ssm_parameter_arns) > 0 ? [1] : []

    content {
      actions   = ["ssm:DescribeParameters"]
      resources = ["*"]
    }
  }

  dynamic "statement" {
    for_each = length(var.external_secrets_ssm_parameter_arns) > 0 ? [1] : []

    content {
      actions = [
        "ssm:GetParameter",
        "ssm:GetParameters",
        "ssm:GetParametersByPath"
      ]

      resources = var.external_secrets_ssm_parameter_arns
    }
  }

  dynamic "statement" {
    for_each = length(var.external_secrets_secrets_manager_arns) > 0 ? [1] : []

    content {
      actions   = ["secretsmanager:ListSecrets", "secretsmanager:BatchGetSecretValue"]
      resources = ["*"]
    }
  }

  dynamic "statement" {
    for_each = length(var.external_secrets_secrets_manager_arns) > 0 ? [1] : []

    content {
      actions = [
        "secretsmanager:GetResourcePolicy",
        "secretsmanager:GetSecretValue",
        "secretsmanager:DescribeSecret",
        "secretsmanager:ListSecretVersionIds"
      ]

      resources = var.external_secrets_secrets_manager_arns
    }
  }

  statement {
    actions   = ["kms:Decrypt"]
    resources = coalescelist(var.external_secrets_kms_key_arns, ["arn:${local.partition}:kms:*:*:key/*"])
  }

  dynamic "statement" {
    for_each = length(var.external_secrets_secrets_manager_arns) > 0 && var.external_secrets_create_permission ? [1] : []

    content {
      actions = [
        "secretsmanager:CreateSecret",
        "secretsmanager:PutSecretValue",
        "secretsmanager:TagResource",
      ]

      resources = var.external_secrets_secrets_manager_arns
    }
  }

  dynamic "statement" {
    for_each = length(var.external_secrets_secrets_manager_arns) > 0 && var.external_secrets_create_permission ? [1] : []

    content {
      actions   = ["secretsmanager:DeleteSecret"]
      resources = var.external_secrets_secrets_manager_arns

      condition {
        test     = "StringEquals"
        variable = "secretsmanager:ResourceTag/managed-by"
        values   = ["external-secrets"]
      }
    }
  }
}

locals {
  external_secrets_policy_name = coalesce(var.external_secrets_policy_name, "${var.policy_name_prefix}ExternalSecrets")
}

resource "aws_iam_policy" "external_secrets" {
  count = var.create && var.attach_external_secrets_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.external_secrets_policy_name
  name_prefix = var.use_name_prefix ? "${local.external_secrets_policy_name}-" : null
  path        = var.path
  description = "Permissions for External Secrets"
  policy      = data.aws_iam_policy_document.external_secrets[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "external_secrets" {
  count = var.create && var.attach_external_secrets_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.external_secrets[0].arn
}
