################################################################################
# AWS AppMesh Controller
################################################################################

# https://github.com/aws/eks-charts/tree/master/stable/appmesh-controller#prerequisites
# https://raw.githubusercontent.com/aws/aws-app-mesh-controller-for-k8s/master/config/iam/controller-iam-policy.json

data "aws_iam_policy_document" "appmesh_controller" {
  count = var.create && var.attach_appmesh_controller_policy ? 1 : 0

  statement {
    actions = [
      "appmesh:ListVirtualRouters",
      "appmesh:ListVirtualServices",
      "appmesh:ListRoutes",
      "appmesh:ListGatewayRoutes",
      "appmesh:ListMeshes",
      "appmesh:ListVirtualNodes",
      "appmesh:ListVirtualGateways",
      "appmesh:DescribeMesh",
      "appmesh:DescribeVirtualRouter",
      "appmesh:DescribeRoute",
      "appmesh:DescribeVirtualNode",
      "appmesh:DescribeVirtualGateway",
      "appmesh:DescribeGatewayRoute",
      "appmesh:DescribeVirtualService",
      "appmesh:CreateMesh",
      "appmesh:CreateVirtualRouter",
      "appmesh:CreateVirtualGateway",
      "appmesh:CreateVirtualService",
      "appmesh:CreateGatewayRoute",
      "appmesh:CreateRoute",
      "appmesh:CreateVirtualNode",
      "appmesh:UpdateMesh",
      "appmesh:UpdateRoute",
      "appmesh:UpdateVirtualGateway",
      "appmesh:UpdateVirtualRouter",
      "appmesh:UpdateGatewayRoute",
      "appmesh:UpdateVirtualService",
      "appmesh:UpdateVirtualNode",
      "appmesh:DeleteMesh",
      "appmesh:DeleteRoute",
      "appmesh:DeleteVirtualRouter",
      "appmesh:DeleteGatewayRoute",
      "appmesh:DeleteVirtualService",
      "appmesh:DeleteVirtualNode",
      "appmesh:DeleteVirtualGateway"
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "iam:CreateServiceLinkedRole"
    ]
    resources = ["arn:${local.partition}:iam::*:role/aws-service-role/appmesh.${local.dns_suffix}/AWSServiceRoleForAppMesh"]
    condition {
      test     = "StringLike"
      variable = "iam:AWSServiceName"
      values   = ["appmesh.${local.dns_suffix}"]
    }
  }

  statement {
    actions = [
      "acm:ListCertificates",
      "acm:DescribeCertificate",
      "acm-pca:DescribeCertificateAuthority",
      "acm-pca:ListCertificateAuthorities"
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "servicediscovery:CreateService",
      "servicediscovery:DeleteService",
      "servicediscovery:GetService",
      "servicediscovery:GetInstance",
      "servicediscovery:RegisterInstance",
      "servicediscovery:DeregisterInstance",
      "servicediscovery:ListInstances",
      "servicediscovery:ListNamespaces",
      "servicediscovery:ListServices",
      "servicediscovery:GetInstancesHealthStatus",
      "servicediscovery:UpdateInstanceCustomHealthStatus",
      "servicediscovery:GetOperation",
      "route53:GetHealthCheck",
      "route53:CreateHealthCheck",
      "route53:UpdateHealthCheck",
      "route53:ChangeResourceRecordSets",
      "route53:DeleteHealthCheck"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "appmesh_controller" {
  count = var.create && var.attach_appmesh_controller_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}AWSAppMeshController-"
  path        = var.path
  description = "Permissions for AppMesh Controller"
  policy      = data.aws_iam_policy_document.appmesh_controller[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "appmesh_controller" {
  count = var.create && var.attach_appmesh_controller_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.appmesh_controller[0].arn
}

################################################################################
# AWS AppMesh Envoy Proxy
################################################################################

# https://github.com/aws/aws-app-mesh-controller-for-k8s/blob/f4a551399c4a4428d31692d0e6d944c2b78f2753/config/helm/appmesh-controller/README.md#with-irsa
# https://raw.githubusercontent.com/aws/aws-app-mesh-controller-for-k8s/master/config/iam/envoy-iam-policy.json

data "aws_iam_policy_document" "appmesh_envoy_proxy" {
  count = var.create && var.attach_appmesh_envoy_proxy_policy ? 1 : 0

  statement {
    actions = [
      "appmesh:StreamAggregatedResources"
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "acm:ExportCertificate",
      "acm-pca:GetCertificateAuthorityCertificate"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "appmesh_envoy_proxy" {
  count = var.create && var.attach_appmesh_envoy_proxy_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}AppMesh_Envoy_Proxy-"
  path        = var.path
  description = "Permissions for AppMesh Envoy Proxy"
  policy      = data.aws_iam_policy_document.appmesh_envoy_proxy[0].json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "appmesh_envoy_proxy" {
  count = var.create && var.attach_appmesh_envoy_proxy_policy ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.appmesh_envoy_proxy[0].arn
}
