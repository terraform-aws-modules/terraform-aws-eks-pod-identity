################################################################################
# Node Termination Handler Policy
################################################################################

# https://github.com/aws/aws-node-termination-handler#5-create-an-iam-role-for-the-pods

data "aws_iam_policy_document" "node_termination_handler" {
  count = var.create && var.attach_node_termination_handler_policy ? 1 : 0

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

    resources = var.node_termination_handler_sqs_queue_arns
  }
}

resource "aws_iam_policy" "node_termination_handler" {
  count = var.create && var.attach_node_termination_handler_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}AWSNodeTerminationHandler-"
  path        = var.path
  description = "Permissions for Node Termination Handler"
  policy      = data.aws_iam_policy_document.node_termination_handler[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "node_termination_handler" {
  count = var.create && var.attach_node_termination_handler_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.node_termination_handler[0].arn
}
