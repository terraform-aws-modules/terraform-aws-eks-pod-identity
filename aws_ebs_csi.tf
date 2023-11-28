################################################################################
# EBS CSI Policy
################################################################################

# https://github.com/kubernetes-sigs/aws-ebs-csi-driver/blob/master/docs/example-iam-policy.json

data "aws_iam_policy_document" "ebs_csi" {
  count = var.create && var.attach_ebs_csi_policy ? 1 : 0

  statement {
    actions = [
      "ec2:CreateSnapshot",
      "ec2:AttachVolume",
      "ec2:DetachVolume",
      "ec2:ModifyVolume",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeInstances",
      "ec2:DescribeSnapshots",
      "ec2:DescribeTags",
      "ec2:DescribeVolumes",
      "ec2:DescribeVolumesModifications",
    ]

    resources = ["*"]
  }

  statement {
    actions = ["ec2:CreateTags"]

    resources = [
      "arn:${local.partition}:ec2:*:*:volume/*",
      "arn:${local.partition}:ec2:*:*:snapshot/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "ec2:CreateAction"
      values = [
        "CreateVolume",
        "CreateSnapshot",
      ]
    }
  }

  statement {
    actions = ["ec2:DeleteTags"]

    resources = [
      "arn:${local.partition}:ec2:*:*:volume/*",
      "arn:${local.partition}:ec2:*:*:snapshot/*",
    ]
  }

  statement {
    actions   = ["ec2:CreateVolume"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/ebs.csi.aws.com/cluster"
      values = [
        true
      ]
    }
  }

  statement {
    actions   = ["ec2:CreateVolume"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/CSIVolumeName"
      values   = ["*"]
    }
  }

  statement {
    actions   = ["ec2:CreateVolume"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "aws:RequestTag/kubernetes.io/cluster/*"
      values   = ["owned"]
    }
  }

  statement {
    actions   = ["ec2:DeleteVolume"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "ec2:ResourceTag/ebs.csi.aws.com/cluster"
      values   = [true]
    }
  }

  statement {
    actions   = ["ec2:DeleteVolume"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "ec2:ResourceTag/CSIVolumeName"
      values   = ["*"]
    }
  }

  statement {
    actions   = ["ec2:DeleteVolume"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "ec2:ResourceTag/kubernetes.io/cluster/*"
      values   = ["owned"]
    }
  }

  statement {
    actions   = ["ec2:DeleteVolume"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "ec2:ResourceTag/kubernetes.io/created-for/pvc/name"
      values   = ["*"]
    }
  }

  statement {
    actions   = ["ec2:DeleteSnapshot"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "ec2:ResourceTag/CSIVolumeSnapshotName"
      values   = ["*"]
    }
  }

  statement {
    actions   = ["ec2:DeleteSnapshot"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "ec2:ResourceTag/ebs.csi.aws.com/cluster"
      values   = [true]
    }
  }

  dynamic "statement" {
    for_each = length(var.ebs_csi_kms_cmk_ids) > 0 ? [1] : []
    content {
      actions = [
        "kms:CreateGrant",
        "kms:ListGrants",
        "kms:RevokeGrant",
      ]

      resources = var.ebs_csi_kms_cmk_ids

      condition {
        test     = "Bool"
        variable = "kms:GrantIsForAWSResource"
        values   = [true]
      }
    }
  }

  dynamic "statement" {
    for_each = length(var.ebs_csi_kms_cmk_ids) > 0 ? [1] : []
    content {
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey",
      ]

      resources = var.ebs_csi_kms_cmk_ids
    }
  }
}

resource "aws_iam_policy" "ebs_csi" {
  count = var.create && var.attach_ebs_csi_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}AWSEBSCSI-"
  path        = var.path
  description = "Permissions to manage EBS volumes via the container storage interface (CSI) driver"
  policy      = data.aws_iam_policy_document.ebs_csi[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "ebs_csi" {
  count = var.create && var.attach_ebs_csi_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.ebs_csi[0].arn
}
