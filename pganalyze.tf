################################################################################
# PGAnalyze Policy
################################################################################

# https://pganalyze.com/docs/install/amazon_rds/03_install_collector_eks#set-up-iam-policy

data "aws_iam_policy_document" "pganalyze" {
  count = var.create && var.attach_pganalyze_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    sid       = "CloudwatchGetMetrics"
    actions   = ["cloudwatch:GetMetricStatistics"]
    resources = ["*"]
  }

  statement {
    sid       = "CloudwatchLogEvents"
    actions   = ["logs:GetLogEvents"]
    resources = ["arn:${local.partition}:logs:${local.region}:${local.account_id}:log-group:RDSOSMetrics:log-stream:*"]
  }

  statement {
    sid       = "RDSDescribeParameters"
    actions   = ["rds:DescribeDBParameters"]
    resources = ["arn:${local.partition}:rds:${local.region}:${local.account_id}:pg:*"]
  }

  statement {
    sid = "RDSInstanceDescribe"
    actions = [
      "rds:DescribeDBInstances",
      "rds:DownloadDBLogFilePortion",
      "rds:DescribeDBLogFiles",
    ]
    resources = ["arn:${local.partition}:rds:${local.region}:${local.account_id}:db:*"]
  }

  statement {
    sid       = "RDSClusterDescribe"
    actions   = ["rds:DescribeDBClusters"]
    resources = ["arn:${local.partition}:rds:${local.region}:${local.account_id}:cluster:*"]
  }
}

locals {
  pganalyze_policy_name = coalesce(var.pganalyze_policy_name, "${var.policy_name_prefix}PGAnalyze")
}

resource "aws_iam_policy" "pganalyze" {
  count = var.create && var.attach_pganalyze_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.pganalyze_policy_name
  name_prefix = var.use_name_prefix ? "${local.pganalyze_policy_name}-" : null
  path        = var.path
  description = "Permissions for PGAnalyze"
  policy      = data.aws_iam_policy_document.pganalyze[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "pganalyze" {
  count = var.create && var.attach_pganalyze_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.pganalyze[0].arn
}
