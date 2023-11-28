################################################################################
# FSx for Lustre CSI Driver Policy
################################################################################

# https://github.com/kubernetes-sigs/aws-fsx-csi-driver/blob/master/docs/README.md
data "aws_iam_policy_document" "fsx_lustre_csi" {
  count = var.create && var.attach_fsx_lustre_csi_policy ? 1 : 0

  statement {
    actions = [
      "iam:CreateServiceLinkedRole",
      "iam:AttachRolePolicy",
      "iam:PutRolePolicy"
    ]
    resources = var.fsx_lustre_csi_service_role_arns
  }

  statement {
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["*"]

    condition {
      test     = "StringLike"
      variable = "iam:AWSServiceName"
      values   = ["fsx.${local.dns_suffix}"]
    }
  }

  statement {
    actions = [
      "s3:ListBucket",
      "fsx:CreateFileSystem",
      "fsx:DeleteFileSystem",
      "fsx:DescribeFileSystems",
      "fsx:TagResource",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "fsx_lustre_csi" {
  count = var.create && var.attach_fsx_lustre_csi_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}AWSFSxForLustreCSI-"
  path        = var.path
  description = "Permissions to manage FSx Lustre volumes via the container storage interface (CSI) driver"
  policy      = data.aws_iam_policy_document.fsx_lustre_csi[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "fsx_lustre_csi" {
  count = var.create && var.attach_fsx_lustre_csi_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.fsx_lustre_csi[0].arn
}
