################################################################################
# Mountpoint S3 CSI Driver Policy
################################################################################

# https://github.com/awslabs/mountpoint-s3/blob/main/doc/CONFIGURATION.md#iam-permissions

data "aws_iam_policy_document" "mountpoint_s3_csi" {
  count = var.create && var.attach_mountpoint_s3_csi_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    sid       = "MountpointFullBucketAccess"
    actions   = ["s3:ListBucket"]
    resources = coalescelist(var.mountpoint_s3_csi_bucket_arns, ["arn:${local.partition}:s3:::*"])
  }

  statement {
    sid = "MountpointFullObjectAccess"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:AbortMultipartUpload",
      "s3:DeleteObject"
    ]
    resources = var.mountpoint_s3_csi_bucket_path_arns
  }
}

locals {
  mountpoint_s3_csi_policy_name = coalesce(var.mountpoint_s3_csi_policy_name, "${var.policy_name_prefix}MountpointS3_CSI")
}

resource "aws_iam_policy" "mountpoint_s3_csi" {
  count = var.create && var.attach_mountpoint_s3_csi_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.mountpoint_s3_csi_policy_name
  name_prefix = var.use_name_prefix ? "${local.mountpoint_s3_csi_policy_name}-" : null
  path        = var.path
  description = "Permissions for Mountpoint S3 CSI Driver"
  policy      = data.aws_iam_policy_document.mountpoint_s3_csi[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "mountpoint_s3_csi" {
  count = var.create && var.attach_mountpoint_s3_csi_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.mountpoint_s3_csi[0].arn
}
