################################################################################
# AWS Gateway Controller Policy
################################################################################

data "aws_iam_policy_document" "aws_gateway_controller" {
  count = var.create && var.attach_aws_gateway_controller_policy ? 1 : 0

  # https://github.com/aws/aws-application-networking-k8s/blob/v1.0.1/examples/recommended-inline-policy.json
  statement {
    actions = [
      "vpc-lattice:*",
      "ec2:DescribeVpcs",
      "ec2:DescribeSubnets",
      "ec2:DescribeTags",
      "ec2:DescribeSecurityGroups",
      "logs:CreateLogDelivery",
      "logs:GetLogDelivery",
      "logs:UpdateLogDelivery",
      "logs:DeleteLogDelivery",
      "logs:ListLogDeliveries",
      "tags:GetResources",
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

resource "aws_iam_policy" "aws_gateway_controller" {
  count = var.create && var.attach_aws_gateway_controller_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}AWSGatewayController-"
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
