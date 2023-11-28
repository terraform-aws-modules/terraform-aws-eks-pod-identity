################################################################################
# Karpenter Controller Policy
################################################################################

locals {
  # TODO - remove this at next breaking change
  karpenter_controller_cluster_name = var.karpenter_controller_cluster_name != "*" ? var.karpenter_controller_cluster_name : var.karpenter_controller_cluster_id
}

# https://github.com/aws/karpenter/blob/502d275cc330fb0f2435b124935c49632146d945/website/content/en/v0.19.0/getting-started/getting-started-with-eksctl/cloudformation.yaml#L34
data "aws_iam_policy_document" "karpenter_controller" {
  count = var.create && var.attach_karpenter_controller_policy ? 1 : 0

  statement {
    actions = [
      "ec2:CreateFleet",
      "ec2:CreateLaunchTemplate",
      "ec2:CreateTags",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeImages",
      "ec2:DescribeImages",
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceTypeOfferings",
      "ec2:DescribeInstanceTypes",
      "ec2:DescribeLaunchTemplates",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSpotPriceHistory",
      "ec2:DescribeSubnets",
      "pricing:GetProducts",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "ec2:TerminateInstances",
      "ec2:DeleteLaunchTemplate",
    ]
    resources = ["*"]

    condition {
      test     = "StringEquals"
      variable = "ec2:ResourceTag/${var.karpenter_tag_key}"
      values   = [local.karpenter_controller_cluster_name]
    }
  }

  statement {
    actions = ["ec2:RunInstances"]
    resources = [
      "arn:${local.partition}:ec2:*:${local.account_id}:launch-template/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "ec2:ResourceTag/${var.karpenter_tag_key}"
      values   = [local.karpenter_controller_cluster_name]
    }
  }

  statement {
    actions = ["ec2:RunInstances"]
    resources = [
      "arn:${local.partition}:ec2:*::image/*",
      "arn:${local.partition}:ec2:*:${local.account_id}:instance/*",
      "arn:${local.partition}:ec2:*:${local.account_id}:spot-instances-request/*",
      "arn:${local.partition}:ec2:*:${local.account_id}:security-group/*",
      "arn:${local.partition}:ec2:*:${local.account_id}:volume/*",
      "arn:${local.partition}:ec2:*:${local.account_id}:network-interface/*",
      "arn:${local.partition}:ec2:*:${coalesce(var.karpenter_subnet_account_id, local.account_id)}:subnet/*",
    ]
  }

  statement {
    actions   = ["ssm:GetParameter"]
    resources = var.karpenter_controller_ssm_parameter_arns
  }

  statement {
    actions   = ["iam:PassRole"]
    resources = var.karpenter_controller_node_iam_role_arns
  }

  dynamic "statement" {
    for_each = var.enable_karpenter_instance_profile_creation ? [1] : []

    content {
      actions = [
        "iam:AddRoleToInstanceProfile",
        "iam:CreateInstanceProfile",
        "iam:DeleteInstanceProfile",
        "iam:GetInstanceProfile",
        "iam:RemoveRoleFromInstanceProfile",
        "iam:TagInstanceProfile",
      ]
      resources = ["*"]
    }
  }

  statement {
    actions   = ["eks:DescribeCluster"]
    resources = ["arn:${local.partition}:eks:${local.region}:${local.account_id}:cluster/${local.karpenter_controller_cluster_name}"]
  }

  dynamic "statement" {
    for_each = var.karpenter_sqs_queue_arn != null ? [1] : []

    content {
      actions = [
        "sqs:DeleteMessage",
        "sqs:GetQueueAttributes",
        "sqs:GetQueueUrl",
        "sqs:ReceiveMessage",
      ]
      resources = [var.karpenter_sqs_queue_arn]
    }
  }
}

resource "aws_iam_policy" "karpenter_controller" {
  count = var.create && var.attach_karpenter_controller_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}Karpenter_Controller_Policy-"
  path        = var.role_path
  description = "Provides permissions to handle node termination events via the Node Termination Handler"
  policy      = data.aws_iam_policy_document.karpenter_controller[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "karpenter_controller" {
  count = var.create && var.attach_karpenter_controller_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.karpenter_controller[0].arn
}
