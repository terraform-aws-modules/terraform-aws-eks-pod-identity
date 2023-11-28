################################################################################
# AWS Load Balancer Controller Policy
################################################################################

# https://github.com/kubernetes-sigs/aws-load-balancer-controller/blob/main/docs/install/iam_policy.json
data "aws_iam_policy_document" "load_balancer_controller" {
  count = var.create && var.attach_load_balancer_controller_policy ? 1 : 0

  statement {
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["*"]

    condition {
      test     = "StringEquals"
      variable = "iam:AWSServiceName"
      values   = ["elasticloadbalancing.${local.dns_suffix}"]
    }
  }

  statement {
    actions = [
      "ec2:DescribeAccountAttributes",
      "ec2:DescribeAddresses",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeInternetGateways",
      "ec2:DescribeVpcs",
      "ec2:DescribeVpcPeeringConnections",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeInstances",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeTags",
      "ec2:GetCoipPoolUsage",
      "ec2:DescribeCoipPools",
      "elasticloadbalancing:DescribeLoadBalancers",
      "elasticloadbalancing:DescribeLoadBalancerAttributes",
      "elasticloadbalancing:DescribeListeners",
      "elasticloadbalancing:DescribeListenerCertificates",
      "elasticloadbalancing:DescribeSSLPolicies",
      "elasticloadbalancing:DescribeRules",
      "elasticloadbalancing:DescribeTargetGroups",
      "elasticloadbalancing:DescribeTargetGroupAttributes",
      "elasticloadbalancing:DescribeTargetHealth",
      "elasticloadbalancing:DescribeTags",
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "cognito-idp:DescribeUserPoolClient",
      "acm:ListCertificates",
      "acm:DescribeCertificate",
      "iam:ListServerCertificates",
      "iam:GetServerCertificate",
      "waf-regional:GetWebACL",
      "waf-regional:GetWebACLForResource",
      "waf-regional:AssociateWebACL",
      "waf-regional:DisassociateWebACL",
      "wafv2:GetWebACL",
      "wafv2:GetWebACLForResource",
      "wafv2:AssociateWebACL",
      "wafv2:DisassociateWebACL",
      "shield:GetSubscriptionState",
      "shield:DescribeProtection",
      "shield:CreateProtection",
      "shield:DeleteProtection",
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:CreateSecurityGroup",
    ]
    resources = ["*"]
  }

  statement {
    actions   = ["ec2:CreateTags"]
    resources = ["arn:${local.partition}:ec2:*:*:security-group/*"]

    condition {
      test     = "StringEquals"
      variable = "ec2:CreateAction"
      values   = ["CreateSecurityGroup"]
    }

    condition {
      test     = "Null"
      variable = "aws:RequestTag/elbv2.k8s.aws/cluster"
      values   = ["false"]
    }
  }

  statement {
    actions = [
      "ec2:CreateTags",
      "ec2:DeleteTags",
    ]
    resources = ["arn:${local.partition}:ec2:*:*:security-group/*"]

    condition {
      test     = "Null"
      variable = "aws:RequestTag/elbv2.k8s.aws/cluster"
      values   = ["true"]
    }

    condition {
      test     = "Null"
      variable = "aws:ResourceTag/elbv2.k8s.aws/cluster"
      values   = ["false"]
    }
  }

  statement {
    actions = [
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:DeleteSecurityGroup",
    ]
    resources = ["*"]

    condition {
      test     = "Null"
      variable = "aws:ResourceTag/elbv2.k8s.aws/cluster"
      values   = ["false"]
    }
  }

  statement {
    actions = [
      "elasticloadbalancing:AddTags",
      "elasticloadbalancing:CreateLoadBalancer",
      "elasticloadbalancing:CreateTargetGroup",
    ]
    resources = ["*"]

    condition {
      test     = "Null"
      variable = "aws:RequestTag/elbv2.k8s.aws/cluster"
      values   = ["false"]
    }
  }

  statement {
    actions = [
      "elasticloadbalancing:AddTags",
      "elasticloadbalancing:CreateListener",
      "elasticloadbalancing:DeleteListener",
      "elasticloadbalancing:CreateRule",
      "elasticloadbalancing:DeleteRule",
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "elasticloadbalancing:AddTags",
      "elasticloadbalancing:RemoveTags",
    ]
    resources = [
      "arn:${local.partition}:elasticloadbalancing:*:*:targetgroup/*/*",
      "arn:${local.partition}:elasticloadbalancing:*:*:loadbalancer/net/*/*",
      "arn:${local.partition}:elasticloadbalancing:*:*:loadbalancer/app/*/*",
    ]

    condition {
      test     = "Null"
      variable = "aws:RequestTag/elbv2.k8s.aws/cluster"
      values   = ["true"]
    }

    condition {
      test     = "Null"
      variable = "aws:ResourceTag/elbv2.k8s.aws/cluster"
      values   = ["false"]
    }
  }

  statement {
    actions = [
      "elasticloadbalancing:AddTags",
      "elasticloadbalancing:RemoveTags",
    ]
    resources = [
      "arn:${local.partition}:elasticloadbalancing:*:*:listener/net/*/*/*",
      "arn:${local.partition}:elasticloadbalancing:*:*:listener/app/*/*/*",
      "arn:${local.partition}:elasticloadbalancing:*:*:listener-rule/net/*/*/*",
      "arn:${local.partition}:elasticloadbalancing:*:*:listener-rule/app/*/*/*",
    ]
  }

  statement {
    actions = [
      "elasticloadbalancing:ModifyLoadBalancerAttributes",
      "elasticloadbalancing:SetIpAddressType",
      "elasticloadbalancing:SetSecurityGroups",
      "elasticloadbalancing:SetSubnets",
      "elasticloadbalancing:DeleteLoadBalancer",
      "elasticloadbalancing:ModifyTargetGroup",
      "elasticloadbalancing:ModifyTargetGroupAttributes",
      "elasticloadbalancing:DeleteTargetGroup",
    ]
    resources = ["*"]

    condition {
      test     = "Null"
      variable = "aws:ResourceTag/elbv2.k8s.aws/cluster"
      values   = ["false"]
    }
  }

  statement {
    actions = [
      "elasticloadbalancing:AddTags"
    ]
    resources = [
      "arn:${local.partition}:elasticloadbalancing:*:*:targetgroup/*/*",
      "arn:${local.partition}:elasticloadbalancing:*:*:loadbalancer/net/*/*",
      "arn:${local.partition}:elasticloadbalancing:*:*:loadbalancer/app/*/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "elasticloadbalancing:CreateAction"
      values = [
        "CreateTargetGroup",
        "CreateLoadBalancer",
      ]
    }

    condition {
      test     = "Null"
      variable = "aws:RequestTag/elbv2.k8s.aws/cluster"
      values   = ["false"]
    }
  }

  statement {
    actions = [
      "elasticloadbalancing:RegisterTargets",
      "elasticloadbalancing:DeregisterTargets",
    ]
    resources = ["arn:${local.partition}:elasticloadbalancing:*:*:targetgroup/*/*"]
  }

  statement {
    actions = [
      "elasticloadbalancing:SetWebAcl",
      "elasticloadbalancing:ModifyListener",
      "elasticloadbalancing:AddListenerCertificates",
      "elasticloadbalancing:RemoveListenerCertificates",
      "elasticloadbalancing:ModifyRule",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "load_balancer_controller" {
  count = var.create && var.attach_load_balancer_controller_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}AWSLoadBalancerController-"
  path        = var.path
  description = "Permissions for AWS Load Balancer Controller"
  policy      = data.aws_iam_policy_document.load_balancer_controller[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "load_balancer_controller" {
  count = var.create && var.attach_load_balancer_controller_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.load_balancer_controller[0].arn
}

################################################################################
# AWS Load Balancer Controller TargetGroup Binding Only Policy
################################################################################

# https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.4/guide/targetgroupbinding/targetgroupbinding/#reference
# https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.4/deploy/installation/#setup-iam-manually
data "aws_iam_policy_document" "load_balancer_controller_targetgroup_only" {
  count = var.create && var.attach_load_balancer_controller_targetgroup_binding_only_policy ? 1 : 0

  statement {
    actions = [
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeInstances",
      "ec2:DescribeVpcs",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupIngress",
      "elasticloadbalancing:DescribeTargetGroups",
      "elasticloadbalancing:DescribeTargetHealth",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "elasticloadbalancing:ModifyTargetGroup",
      "elasticloadbalancing:ModifyTargetGroupAttributes",
      "elasticloadbalancing:RegisterTargets",
      "elasticloadbalancing:DeregisterTargets",
    ]

    resources = var.load_balancer_controller_targetgroup_arns
  }
}

resource "aws_iam_policy" "load_balancer_controller_targetgroup_only" {
  count = var.create && var.attach_load_balancer_controller_targetgroup_binding_only_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}AWSLoadBalancerControllerTargetGroupOnly-"
  path        = var.path
  description = "Permissions for AWS Load Balancer Controller with TargetGroup binding only"
  policy      = data.aws_iam_policy_document.load_balancer_controller_targetgroup_only[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "load_balancer_controller_targetgroup_only" {
  count = var.create && var.attach_load_balancer_controller_targetgroup_binding_only_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.load_balancer_controller_targetgroup_only[0].arn
}
