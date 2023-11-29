
################################################################################
# VPC CNI Policy
################################################################################

data "aws_iam_policy_document" "vpc_cni" {
  count = var.create && var.attach_aws_vpc_cni_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  # arn:${local.partition}:iam::aws:policy/AmazonEKS_CNI_Policy
  dynamic "statement" {
    for_each = var.aws_vpc_cni_enable_ipv4 ? [1] : []

    content {
      sid = "IPV4"
      actions = [
        "ec2:AssignPrivateIpAddresses",
        "ec2:AttachNetworkInterface",
        "ec2:CreateNetworkInterface",
        "ec2:DeleteNetworkInterface",
        "ec2:DescribeInstances",
        "ec2:DescribeTags",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DescribeInstanceTypes",
        "ec2:DetachNetworkInterface",
        "ec2:ModifyNetworkInterfaceAttribute",
        "ec2:UnassignPrivateIpAddresses",
      ]
      resources = ["*"]
    }
  }

  # https://docs.aws.amazon.com/eks/latest/userguide/cni-iam-role.html#cni-iam-role-create-ipv6-policy
  dynamic "statement" {
    for_each = var.aws_vpc_cni_enable_ipv6 ? [1] : []

    content {
      sid = "IPV6"
      actions = [
        "ec2:AssignIpv6Addresses",
        "ec2:DescribeInstances",
        "ec2:DescribeTags",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DescribeInstanceTypes",
      ]
      resources = ["*"]
    }
  }

  statement {
    sid       = "CreateTags"
    actions   = ["ec2:CreateTags"]
    resources = ["arn:${local.partition}:ec2:*:*:network-interface/*"]
  }
}

locals {
  aws_vpc_cni_policy_name = coalesce(var.aws_vpc_cni_policy_name, "${var.policy_name_prefix}VPC_CNI")
}

resource "aws_iam_policy" "vpc_cni" {
  count = var.create && var.attach_aws_vpc_cni_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.aws_vpc_cni_policy_name
  name_prefix = var.use_name_prefix ? "${local.aws_vpc_cni_policy_name}-" : null
  path        = var.path
  description = "Permissions for Amazon VPC CNI"
  policy      = data.aws_iam_policy_document.vpc_cni[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "vpc_cni" {
  count = var.create && var.attach_aws_vpc_cni_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.vpc_cni[0].arn
}
