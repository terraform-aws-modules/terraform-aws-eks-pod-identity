################################################################################
# Node Termination Handler Policy
################################################################################

# https://github.com/aws/aws-node-termination-handler#5-create-an-iam-role-for-the-pods

data "aws_iam_policy_document" "node_termination_handler" {
  count = var.create && var.attach_aws_node_termination_handler_policy ? 1 : 0

  source_policy_documents   = [data.aws_iam_policy_document.base[0].json]
  override_policy_documents = var.override_policy_documents

  statement {
    actions = [
      "autoscaling:CompleteLifecycleAction",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeTags",
      "ec2:DescribeInstances",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "sqs:DeleteMessage",
      "sqs:ReceiveMessage",
    ]

    resources = var.aws_node_termination_handler_sqs_queue_arns
  }
}

locals {
  aws_node_termination_handler_policy_name = coalesce(var.aws_node_termination_handler_policy_name, "${var.policy_name_prefix}NodeTerminationHandler")
}

resource "aws_iam_policy" "node_termination_handler" {
  count = var.create && var.attach_aws_node_termination_handler_policy ? 1 : 0

  name        = var.use_name_prefix ? null : local.aws_node_termination_handler_policy_name
  name_prefix = var.use_name_prefix ? "${local.aws_node_termination_handler_policy_name}-" : null
  path        = var.path
  description = "Permissions for Node Termination Handler"
  policy      = data.aws_iam_policy_document.node_termination_handler[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "node_termination_handler" {
  count = var.create && var.attach_aws_node_termination_handler_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.node_termination_handler[0].arn
}
