################################################################################
# Cert Manager Policy
################################################################################

# https://cert-manager.io/docs/configuration/acme/dns01/route53/#set-up-an-iam-role
data "aws_iam_policy_document" "cert_manager" {
  count = var.create && var.attach_cert_manager_policy ? 1 : 0

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

resource "aws_iam_policy" "cert_manager" {
  count = var.create && var.attach_cert_manager_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}Cert_Manager_Policy-"
  path        = var.role_path
  description = "Cert Manager policy to allow management of Route53 hosted zone records"
  policy      = data.aws_iam_policy_document.cert_manager[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "cert_manager" {
  count = var.create && var.attach_cert_manager_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.cert_manager[0].arn
}
