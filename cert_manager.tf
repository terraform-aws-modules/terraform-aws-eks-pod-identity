################################################################################
# Cert Manager Policy
################################################################################

# https://cert-manager.io/docs/configuration/acme/dns01/route53/#set-up-an-iam-role

data "aws_iam_policy_document" "cert_manager" {
  count = var.create && var.attach_cert_manager_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    actions   = ["route53:GetChange"]
    resources = ["arn:${local.partition}:route53:::change/*"]
  }

  statement {
    actions = [
      "route53:ChangeResourceRecordSets",
      "route53:ListResourceRecordSets"
    ]

    resources = var.cert_manager_hosted_zone_arns
  }

  statement {
    actions   = ["route53:ListHostedZonesByName"]
    resources = ["*"]
  }
}

locals {
  cert_manager_policy_name = coalesce(var.cert_manager_policy_name, "${var.policy_name_prefix}CertManager")
}

resource "aws_iam_policy" "cert_manager" {
  count = var.create && var.attach_cert_manager_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.cert_manager_policy_name
  name_prefix = var.use_name_prefix ? "${local.cert_manager_policy_name}-" : null
  path        = var.path
  description = "Permissions for Cert Manager"
  policy      = data.aws_iam_policy_document.cert_manager[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "cert_manager" {
  count = var.create && var.attach_cert_manager_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.cert_manager[0].arn
}
