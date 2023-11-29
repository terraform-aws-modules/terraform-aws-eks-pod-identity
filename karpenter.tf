################################################################################
# Karpenter Controller Policy
################################################################################

# https://github.com/aws/karpenter/blob/v0.32.2/website/content/en/docs/upgrading/v1beta1-controller-policy.json

data "aws_iam_policy_document" "karpenter" {
  count = var.create && var.attach_karpenter_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    sid = "AllowScopedEC2InstanceActions"
    resources = [
      "arn:${local.partition}:ec2:*::image/*",
      "arn:${local.partition}:ec2:*::snapshot/*",
      "arn:${local.partition}:ec2:*:*:spot-instances-request/*",
      "arn:${local.partition}:ec2:*:*:security-group/*",
      "arn:${local.partition}:ec2:*:*:subnet/*",
      "arn:${local.partition}:ec2:*:*:launch-template/*",
    ]

    actions = [
      "ec2:RunInstances",
      "ec2:CreateFleet"
    ]
  }

  statement {
    sid = "AllowScopedEC2InstanceActionsWithTags"
    resources = [
      "arn:${local.partition}:ec2:*:*:fleet/*",
      "arn:${local.partition}:ec2:*:*:instance/*",
      "arn:${local.partition}:ec2:*:*:volume/*",
      "arn:${local.partition}:ec2:*:*:network-interface/*",
      "arn:${local.partition}:ec2:*:*:launch-template/*",
    ]
    actions = [
      "ec2:RunInstances",
      "ec2:CreateFleet",
      "ec2:CreateLaunchTemplate"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:RequestTag/eks-cluster-arn"
      values   = ["$${aws:PrincipalTag/eks-cluster-arn}"]
    }

    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/karpenter.sh/nodepool"
      values   = ["*"]
    }
  }

  statement {
    sid = "AllowScopedResourceCreationTagging"
    resources = [
      "arn:${local.partition}:ec2:*:*:fleet/*",
      "arn:${local.partition}:ec2:*:*:instance/*",
      "arn:${local.partition}:ec2:*:*:volume/*",
      "arn:${local.partition}:ec2:*:*:network-interface/*",
      "arn:${local.partition}:ec2:*:*:launch-template/*",
    ]
    actions = ["ec2:CreateTags"]

    condition {
      test     = "StringEquals"
      variable = "aws:RequestTag/eks-cluster-arn"
      values   = ["$${aws:PrincipalTag/eks-cluster-arn}"]
    }

    condition {
      test     = "StringEquals"
      variable = "ec2:CreateAction"
      values   = ["owned"]
    }

    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/karpenter.sh/nodepool"
      values = [
        "RunInstances",
        "CreateFleet",
        "CreateLaunchTemplate",
      ]
    }
  }

  statement {
    sid       = "AllowScopedResourceTagging"
    resources = ["arn:${local.partition}:ec2:*:*:instance/*"]
    actions   = ["ec2:CreateTags"]

    condition {
      test     = "StringEquals"
      variable = "aws:RequestTag/eks-cluster-arn"
      values   = ["$${aws:PrincipalTag/eks-cluster-arn}"]
    }

    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/karpenter.sh/nodepool"
      values   = ["*"]
    }

    condition {
      test     = "ForAllValues:StringEquals"
      variable = "aws:TagKeys"
      values = [
        "karpenter.sh/nodeclaim",
        "Name",
      ]
    }
  }

  statement {
    sid = "AllowScopedDeletion"
    resources = [
      "arn:${local.partition}:ec2:*:*:instance/*",
      "arn:${local.partition}:ec2:*:*:launch-template/*"
    ]

    actions = [
      "ec2:TerminateInstances",
      "ec2:DeleteLaunchTemplate"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:RequestTag/eks-cluster-arn"
      values   = ["$${aws:PrincipalTag/eks-cluster-arn}"]
    }

    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/karpenter.sh/nodepool"
      values   = ["*"]
    }
  }

  statement {
    sid       = "AllowDescribeActions"
    resources = ["*"]
    actions = [
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeImages",
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceTypeOfferings",
      "ec2:DescribeInstanceTypes",
      "ec2:DescribeLaunchTemplates",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSpotPriceHistory",
      "ec2:DescribeSubnets"
    ]
  }

  statement {
    sid       = "AllowSSMReadActions"
    resources = coalescelist(var.karpenter_ami_ssm_parameter_arns, ["arn:${local.partition}:ssm:*:*:parameter/aws/service/*"])
    actions   = ["ssm:GetParameter"]
  }

  statement {
    sid       = "AllowPricingReadActions"
    resources = ["*"]
    actions   = ["pricing:GetProducts"]
  }

  statement {
    sid       = "AllowInterruptionQueueActions"
    resources = coalescelist(var.karpenter_sqs_arns, ["arn:${local.partition}:sqs:*:${local.account_id}:*"])
    actions = [
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ReceiveMessage"
    ]
  }

  statement {
    sid       = "AllowPassingInstanceRole"
    resources = coalescelist(var.karpenter_node_iam_role_arns, ["arn:${local.partition}:iam::*:role/*"])
    actions   = ["iam:PassRole"]

    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["ec2.amazonaws.com"]
    }
  }

  statement {
    sid       = "AllowScopedInstanceProfileCreationActions"
    resources = ["*"]
    actions   = ["iam:CreateInstanceProfile"]

    condition {
      test     = "StringEquals"
      variable = "aws:RequestTag/eks-cluster-arn"
      values   = ["$${aws:PrincipalTag/eks-cluster-arn}"]
    }
  }

  statement {
    sid       = "AllowScopedInstanceProfileTagActions"
    resources = ["*"]
    actions   = ["iam:TagInstanceProfile"]

    condition {
      test     = "StringEquals"
      variable = "aws:ResourceTag/eks-cluster-arn"
      values   = ["$${aws:PrincipalTag/eks-cluster-arn}"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:RequestTag/eks-cluster-arn"
      values   = ["$${aws:PrincipalTag/eks-cluster-arn}"]
    }

    condition {
      test     = "StringLike"
      variable = "aws:ResourceTag/karpenter.k8s.aws/ec2nodeclass"
      values   = ["*"]
    }

    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/karpenter.k8s.aws/ec2nodeclass"
      values   = ["*"]
    }
  }

  statement {
    sid       = "AllowScopedInstanceProfileActions"
    resources = ["*"]
    actions = [
      "iam:AddRoleToInstanceProfile",
      "iam:RemoveRoleFromInstanceProfile",
      "iam:DeleteInstanceProfile"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:ResourceTag/eks-cluster-arn"
      values   = ["$${aws:PrincipalTag/eks-cluster-arn}"]
    }

    condition {
      test     = "StringLike"
      variable = "aws:ResourceTag/karpenter.k8s.aws/ec2nodeclass"
      values   = ["*"]
    }
  }

  statement {
    sid       = "AllowInstanceProfileReadActions"
    resources = ["*"]
    actions   = ["iam:GetInstanceProfile"]
  }

  statement {
    sid       = "AllowAPIServerEndpointDiscovery"
    resources = ["arn:${local.partition}:eks:*:${local.account_id}:cluster/*"]
    actions   = ["eks:DescribeCluster"]
  }
}

locals {
  karpenter_policy_name = coalesce(var.karpenter_policy_name, "${var.policy_name_prefix}KarpenterController")
}

resource "aws_iam_policy" "karpenter" {
  count = var.create && var.attach_karpenter_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.karpenter_policy_name
  name_prefix = var.use_name_prefix ? "${local.karpenter_policy_name}-" : null
  path        = var.path
  description = "Permissions for Karpenter controller"
  policy      = data.aws_iam_policy_document.karpenter[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "karpenter" {
  count = var.create && var.attach_karpenter_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.karpenter[0].arn
}
