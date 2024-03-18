################################################################################
# EFS CSI Driver Policy
################################################################################

# https://github.com/kubernetes-sigs/aws-efs-csi-driver/blob/master/docs/iam-policy-example.json

data "aws_iam_policy_document" "efs_csi" {
  count = var.create && var.attach_aws_efs_csi_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    actions = [
      "ec2:DescribeAvailabilityZones",
      "elasticfilesystem:DescribeAccessPoints",
      "elasticfilesystem:DescribeFileSystems",
      "elasticfilesystem:DescribeMountTargets",
    ]

    resources = ["*"]
  }

  statement {
    actions   = ["elasticfilesystem:CreateAccessPoint"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/efs.csi.aws.com/cluster"
      values   = ["true"]
    }
  }

  statement {
    actions   = ["elasticfilesystem:TagResource"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "aws:ResourceTag/efs.csi.aws.com/cluster"
      values   = ["true"]
    }
  }

  statement {
    actions   = ["elasticfilesystem:DeleteAccessPoint"]
    resources = ["*"]

    condition {
      test     = "StringEquals"
      variable = "aws:ResourceTag/efs.csi.aws.com/cluster"
      values   = ["true"]
    }
  }
}

locals {
  aws_efs_csi_policy_name = coalesce(var.aws_efs_csi_policy_name, "${var.policy_name_prefix}EFS_CSI")
}

resource "aws_iam_policy" "efs_csi" {
  count = var.create && var.attach_aws_efs_csi_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.aws_efs_csi_policy_name
  name_prefix = var.use_name_prefix ? "${local.aws_efs_csi_policy_name}-" : null
  path        = var.path
  description = "Permissions to manage EFS volumes via the container storage interface (CSI) driver"
  policy      = data.aws_iam_policy_document.efs_csi[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "efs_csi" {
  count = var.create && var.attach_aws_efs_csi_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.efs_csi[0].arn
}
