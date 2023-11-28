################################################################################
# Cluster Autoscaler Policy
################################################################################

# https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/README.md
data "aws_iam_policy_document" "cluster_autoscaler" {
  count = var.create && var.attach_cluster_autoscaler_policy ? 1 : 0

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
    # TODO - remove *_ids at next breaking change
    for_each = toset(coalescelist(var.cluster_autoscaler_cluster_ids, var.cluster_autoscaler_cluster_names))
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

resource "aws_iam_policy" "cluster_autoscaler" {
  count = var.create && var.attach_cluster_autoscaler_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}Cluster_Autoscaler_Policy-"
  path        = var.role_path
  description = "Cluster autoscaler policy to allow examination and modification of EC2 Auto Scaling Groups"
  policy      = data.aws_iam_policy_document.cluster_autoscaler[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "cluster_autoscaler" {
  count = var.create && var.attach_cluster_autoscaler_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.cluster_autoscaler[0].arn
}
