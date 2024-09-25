################################################################################
# FSx for Lustre CSI Driver Policy
################################################################################

# https://github.com/kubernetes-sigs/aws-fsx-csi-driver/blob/master/docs/install.md

data "aws_iam_policy_document" "fsx_lustre_csi" {
  count = var.create && var.attach_aws_fsx_lustre_csi_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    actions = [
      "iam:CreateServiceLinkedRole",
      "iam:AttachRolePolicy",
      "iam:PutRolePolicy"
    ]
    resources = coalescelist(var.aws_fsx_lustre_csi_service_role_arns, ["arn:${local.partition}:iam::*:role/aws-service-role/s3.data-source.lustre.fsx.amazonaws.com/*"])
  }

  statement {
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "iam:AWSServiceName"
      values   = ["fsx.amazonaws.com"]
    }
  }

  statement {
    actions = [
      "s3:ListBucket",
      "fsx:CreateFileSystem",
      "fsx:DeleteFileSystem",
      "fsx:DescribeFileSystems",
      "fsx:TagResource",
      "fsx:UpdateFileSystem",
    ]
    resources = ["*"]
  }
}

locals {
  aws_fsx_lustre_csi_policy_name = coalesce(var.aws_fsx_lustre_csi_policy_name, "${var.policy_name_prefix}FSxForLustre_CSI")
}

resource "aws_iam_policy" "fsx_lustre_csi" {
  count = var.create && var.attach_aws_fsx_lustre_csi_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.aws_fsx_lustre_csi_policy_name
  name_prefix = var.use_name_prefix ? "${local.aws_fsx_lustre_csi_policy_name}-" : null
  path        = var.path
  description = "Permissions to manage FSx Lustre volumes via the container storage interface (CSI) driver"
  policy      = data.aws_iam_policy_document.fsx_lustre_csi[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "fsx_lustre_csi" {
  count = var.create && var.attach_aws_fsx_lustre_csi_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.fsx_lustre_csi[0].arn
}
