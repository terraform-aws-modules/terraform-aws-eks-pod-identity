################################################################################
# AWS Gateway Controller Policy
################################################################################

# https://github.com/aws/aws-application-networking-k8s/blob/main/files/controller-installation/recommended-inline-policy.json

data "aws_iam_policy_document" "aws_gateway_controller" {
  count = var.create && var.attach_aws_gateway_controller_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    actions = [
      "vpc-lattice:*",
      "ec2:DescribeVpcs",
      "ec2:DescribeSubnets",
      "ec2:DescribeTags",
      "ec2:DescribeSecurityGroups",
      "logs:CreateLogDelivery",
      "logs:GetLogDelivery",
      "logs:DescribeLogGroups",
      "logs:PutResourcePolicy",
      "logs:DescribeResourcePolicies",
      "logs:UpdateLogDelivery",
      "logs:DeleteLogDelivery",
      "logs:ListLogDeliveries",
      "tag:GetResources",
      "firehose:TagDeliveryStream",
      "s3:GetBucketPolicy",
      "s3:PutBucketPolicy",
    ]
    resources = ["*"]
  }

  statement {
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["arn:${local.partition}:iam::*:role/aws-service-role/vpc-lattice.amazonaws.com/AWSServiceRoleForVpcLattice"]

    condition {
      test     = "StringLike"
      variable = "iam:AWSServiceName"
      values   = ["vpc-lattice.amazonaws.com"]
    }
  }

  statement {
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["arn:${local.partition}:iam::*:role/aws-service-role/delivery.logs.amazonaws.com/AWSServiceRoleForLogDelivery"]

    condition {
      test     = "StringLike"
      variable = "iam:AWSServiceName"
      values   = ["delivery.logs.amazonaws.com"]
    }
  }
}

locals {
  aws_gateway_controller_policy_name = coalesce(var.aws_gateway_controller_policy_name, "${var.policy_name_prefix}GatewayController")
}

resource "aws_iam_policy" "aws_gateway_controller" {
  count = var.create && var.attach_aws_gateway_controller_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.aws_gateway_controller_policy_name
  name_prefix = var.use_name_prefix ? "${local.aws_gateway_controller_policy_name}-" : null
  path        = var.path
  description = "Permissions for the AWS Gateway Controller"
  policy      = data.aws_iam_policy_document.aws_gateway_controller[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "aws_gateway_controller" {
  count = var.create && var.attach_aws_gateway_controller_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.aws_gateway_controller[0].arn
}
