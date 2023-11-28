################################################################################
# AWS CloudWatch Observability
################################################################################

resource "aws_iam_role_policy_attachment" "aws_cloudwatch_observability" {
  count = var.create && var.attach_aws_cloudwatch_observability_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = "arn:${local.partition}:iam::aws:policy/CloudWatchAgentServerPolicy"
}
