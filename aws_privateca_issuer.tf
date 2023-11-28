################################################################################
# AWS Private CA Issuer
################################################################################

data "aws_iam_policy_document" "aws_privateca_issuer" {
  count = var.create && var.attach_aws_privateca_issuer_policy ? 1 : 0

  statement {
    actions = [
      "acm-pca:DescribeCertificateAuthority",
      "acm-pca:GetCertificate",
      "acm-pca:IssueCertificate",
    ]

    resources = var.aws_privateca_issuer_acmca_arns
  }
}

resource "aws_iam_policy" "aws_privateca_issuer" {
  count = var.create && var.attach_aws_privateca_issuer_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}AWSNodeTerminationHandler-"
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
