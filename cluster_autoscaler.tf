################################################################################
# Cluster Autoscaler Policy
################################################################################

# https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/README.md

data "aws_iam_policy_document" "cluster_autoscaler" {
  count = var.create && var.attach_cluster_autoscaler_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    actions = [
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
      "autoscaling:DescribeScalingActivities",
      "autoscaling:DescribeTags",
      "ec2:DescribeLaunchTemplateVersions",
      "ec2:DescribeInstanceTypes",
      "eks:DescribeNodegroup",
      "ec2:DescribeImages",
      "ec2:GetInstanceTypesFromInstanceRequirements"
    ]

    resources = ["*"]
  }

  dynamic "statement" {
    for_each = toset(var.cluster_autoscaler_cluster_names)

    content {
      actions = [
        "autoscaling:SetDesiredCapacity",
        "autoscaling:TerminateInstanceInAutoScalingGroup"
      ]

      resources = ["*"]

      condition {
        test     = "StringEquals"
        variable = "autoscaling:ResourceTag/kubernetes.io/cluster/${statement.value}"
        values   = ["owned"]
      }
    }
  }
}

locals {
  cluster_autoscaler_policy_name = coalesce(var.cluster_autoscaler_policy_name, "${var.policy_name_prefix}ClusterAutoscaler")
}

resource "aws_iam_policy" "cluster_autoscaler" {
  count = var.create && var.attach_cluster_autoscaler_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.cluster_autoscaler_policy_name
  name_prefix = var.use_name_prefix ? "${local.cluster_autoscaler_policy_name}-" : null
  path        = var.path
  description = "Permissions for Cluster Autoscaler"
  policy      = data.aws_iam_policy_document.cluster_autoscaler[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "cluster_autoscaler" {
  count = var.create && var.attach_cluster_autoscaler_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.cluster_autoscaler[0].arn
}
