################################################################################
# AWS Private CA Issuer
################################################################################

data "aws_iam_policy_document" "aws_privateca_issuer" {
  count = var.create && var.attach_aws_privateca_issuer_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    actions = [
      "acm-pca:DescribeCertificateAuthority",
      "acm-pca:GetCertificate",
      "acm-pca:IssueCertificate",
    ]

    resources = var.aws_privateca_issuer_acmca_arns
  }
}

locals {
  aws_privateca_issuer_policy_name = coalesce(var.aws_privateca_issuer_policy_name, "${var.policy_name_prefix}PrivateCAIssuer")
}

resource "aws_iam_policy" "aws_privateca_issuer" {
  count = var.create && var.attach_aws_privateca_issuer_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.aws_privateca_issuer_policy_name
  name_prefix = var.use_name_prefix ? "${local.aws_privateca_issuer_policy_name}-" : null
  path        = var.path
  description = "Permissions for AWS Private CA Issuer"
  policy      = data.aws_iam_policy_document.aws_privateca_issuer[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "aws_privateca_issuer" {
  count = var.create && var.attach_aws_privateca_issuer_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.aws_privateca_issuer[0].arn
}
