
################################################################################
# VPC CNI Policy
################################################################################

data "aws_iam_policy_document" "vpc_cni" {
  count = var.create && var.attach_vpc_cni_policy ? 1 : 0

  # arn:${local.partition}:iam::aws:policy/AmazonEKS_CNI_Policy
  dynamic "statement" {
    for_each = var.vpc_cni_enable_ipv4 ? [1] : []
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
    for_each = var.vpc_cni_enable_ipv6 ? [1] : []
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

resource "aws_iam_policy" "vpc_cni" {
  count = var.create && var.attach_vpc_cni_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}CNI_Policy-"
  path        = var.path
  description = "Provides the Amazon VPC CNI Plugin (amazon-vpc-cni-k8s) the permissions it requires to modify the IPv4/IPv6 address configuration on your EKS worker nodes"
  policy      = data.aws_iam_policy_document.vpc_cni[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "vpc_cni" {
  count = var.create && var.attach_vpc_cni_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.vpc_cni[0].arn
}
