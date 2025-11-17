################################################################################
# AWS CloudWatch Observability
################################################################################

resource "aws_iam_role_policy_attachment" "aws_cloudwatch_observability" {
  for_each = var.create && var.attach_aws_cloudwatch_observability_policy ? {
    CloudWatchAgentServerPolicy = "arn:${local.partition}:iam::aws:policy/CloudWatchAgentServerPolicy"
    AWSXrayWriteOnlyAccess      = "arn:${local.partition}:iam::aws:policy/AWSXrayWriteOnlyAccess"
  } : {}

  role       = aws_iam_role.this[0].name
  policy_arn = each.value
}
