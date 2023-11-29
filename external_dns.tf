################################################################################
# External DNS Policy
################################################################################

# https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/aws.md#iam-policy

data "aws_iam_policy_document" "external_dns" {
  count = var.create && var.attach_external_dns_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    actions   = ["route53:ChangeResourceRecordSets"]
    resources = var.external_dns_hosted_zone_arns
  }

  statement {
    actions = [
      "route53:ListHostedZones",
      "route53:ListResourceRecordSets",
      "route53:ListTagsForResource",
    ]

    resources = ["*"]
  }
}

locals {
  external_dns_policy_name = coalesce(var.external_dns_policy_name, "${var.policy_name_prefix}ExternalDNS")
}

resource "aws_iam_policy" "external_dns" {
  count = var.create && var.attach_external_dns_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.external_dns_policy_name
  name_prefix = var.use_name_prefix ? "${local.external_dns_policy_name}-" : null
  path        = var.path
  description = "Permissions for External DNS"
  policy      = data.aws_iam_policy_document.external_dns[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "external_dns" {
  count = var.create && var.attach_external_dns_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.external_dns[0].arn
}
