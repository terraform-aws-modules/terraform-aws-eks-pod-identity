################################################################################
# External Secrets Policy
################################################################################

# https://github.com/external-secrets/kubernetes-external-secrets#add-a-secret
data "aws_iam_policy_document" "external_secrets" {
  count = var.create && var.attach_external_secrets_policy ? 1 : 0

  statement {
    actions   = ["ssm:DescribeParameters"]
    resources = ["*"]
  }

  statement {
    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters",
    ]
    resources = var.external_secrets_ssm_parameter_arns
  }

  statement {
    actions   = ["secretsmanager:ListSecrets"]
    resources = ["*"]
  }

  statement {
    actions = [
      "secretsmanager:GetResourcePolicy",
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret",
      "secretsmanager:ListSecretVersionIds",
    ]
    resources = var.external_secrets_secrets_manager_arns
  }

  statement {
    actions   = ["kms:Decrypt"]
    resources = var.external_secrets_kms_key_arns
  }

  dynamic "statement" {
    for_each = var.external_secrets_secrets_manager_create_permission ? [1] : []
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
    for_each = var.external_secrets_secrets_manager_create_permission ? [1] : []
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

resource "aws_iam_policy" "external_secrets" {
  count = var.create && var.attach_external_secrets_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}External_Secrets_Policy-"
  path        = var.role_path
  description = "Provides permissions to for External Secrets to retrieve secrets from AWS SSM and AWS Secrets Manager"
  policy      = data.aws_iam_policy_document.external_secrets[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "external_secrets" {
  count = var.create && var.attach_external_secrets_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.external_secrets[0].arn
}
