################################################################################
# Amazon Managed Service for Prometheus Policy
################################################################################

locals {
  amazon_managed_service_prometheus_policy_name = coalesce(var.amazon_managed_service_prometheus_policy_name, "${var.policy_name_prefix}ManagedServiceForPrometheus")
}

# https://docs.aws.amazon.com/prometheus/latest/userguide/set-up-irsa.html
data "aws_iam_policy_document" "amazon_managed_service_prometheus" {
  count = var.create && var.attach_amazon_managed_service_prometheus_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    actions = [
      "aps:RemoteWrite",
      "aps:QueryMetrics",
      "aps:GetSeries",
      "aps:GetLabels",
      "aps:GetMetricMetadata",
    ]

    resources = var.amazon_managed_service_prometheus_workspace_arns
  }
}

resource "aws_iam_policy" "amazon_managed_service_prometheus" {
  count = var.create && var.attach_amazon_managed_service_prometheus_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.amazon_managed_service_prometheus_policy_name
  name_prefix = var.use_name_prefix ? "${local.amazon_managed_service_prometheus_policy_name}-" : null
  path        = var.path
  description = "Permissions for Amazon Managed Service for Prometheus"
  policy      = data.aws_iam_policy_document.amazon_managed_service_prometheus[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "amazon_managed_service_prometheus" {
  count = var.create && var.attach_amazon_managed_service_prometheus_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.amazon_managed_service_prometheus[0].arn
}
