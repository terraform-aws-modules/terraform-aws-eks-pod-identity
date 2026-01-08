
################################################################################
# Velero Policy
################################################################################

# https://github.com/vmware-tanzu/velero-plugin-for-aws#set-permissions-for-velero

data "aws_iam_policy_document" "velero" {
  count = var.create && var.attach_velero_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    sid = "Ec2ReadWrite"
    actions = [
      "ec2:DescribeVolumes",
      "ec2:DescribeSnapshots",
      "ec2:CreateTags",
      "ec2:CreateVolume",
      "ec2:CreateSnapshot",
      "ec2:DeleteSnapshot",
    ]
    resources = ["*"]
  }

  statement {
    sid = "S3ReadWrite"
    actions = [
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject",
      "s3:PutObjectTagging",
      "s3:AbortMultipartUpload",
      "s3:ListMultipartUploadParts",
    ]
    resources = var.velero_s3_bucket_path_arns
  }

  statement {
    sid = "S3List"
    actions = [
      "s3:ListBucket",
    ]
    resources = coalescelist(var.velero_s3_bucket_arns, ["arn:${local.partition}:s3:::*"])
  }

  dynamic "statement" {
    for_each = length(var.velero_kms_arns) > 0 ? [1] : []

    content {
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:ReEncrypt*",
        "kms:GenerateDataKey*",
        "kms:DescribeKey",
        "kms:CreateGrant",
        "kms:ListGrants",
        "kms:RevokeGrant",
        "kms:RetireGrant",
        "kms:ListRetirableGrants",
      ]

      resources = var.velero_kms_arns
    }
  }
}

locals {
  velero_policy_name = coalesce(var.velero_policy_name, "${var.policy_name_prefix}Velero")
}

resource "aws_iam_policy" "velero" {
  count = var.create && var.attach_velero_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.velero_policy_name
  name_prefix = var.use_name_prefix ? "${local.velero_policy_name}-" : null
  path        = var.path
  description = "Permissions for Velero"
  policy      = data.aws_iam_policy_document.velero[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "velero" {
  count = var.create && var.attach_velero_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.velero[0].arn
}
