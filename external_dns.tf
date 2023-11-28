################################################################################
# External DNS Policy
################################################################################

# https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/aws.md#iam-policy
data "aws_iam_policy_document" "external_dns" {
  count = var.create && var.attach_external_dns_policy ? 1 : 0

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

resource "aws_iam_policy" "external_dns" {
  count = var.create && var.attach_external_dns_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}External_DNS_Policy-"
  path        = var.role_path
  description = "External DNS policy to allow management of Route53 hosted zone records"
  policy      = data.aws_iam_policy_document.external_dns[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "external_dns" {
  count = var.create && var.attach_external_dns_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.external_dns[0].arn
}
