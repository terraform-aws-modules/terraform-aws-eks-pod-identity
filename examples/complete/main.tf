provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
  name   = "eks-pod-identity-ex-${basename(path.cwd)}"

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/clowdhaus/terraform-aws-eks-pod-identity"
  }
}

################################################################################
# EKS Pod Identity Module
################################################################################

module "custom_pod_identity" {
  source = "../../"

  name = local.name

  attach_custom_policy      = true
  source_policy_documents   = [data.aws_iam_policy_document.source.json]
  override_policy_documents = [data.aws_iam_policy_document.override.json]

  additional_policy_arns = {
    AmazonEKS_CNI_Policy = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    additional           = aws_iam_policy.additional.arn
  }

  tags = local.tags
}

module "aws_gateway_controller_pod_identity" {
  source = "../../"

  name = "aws-gateway-controller"

  attach_aws_gateway_controller_policy = true

  tags = local.tags
}

module "cert_manager_pod_identity" {
  source = "../../"

  name = "cert-manager"

  attach_cert_manager_policy    = true
  cert_manager_hosted_zone_arns = ["arn:aws:route53:::hostedzone/IClearlyMadeThisUp"]

  tags = local.tags
}

module "cluster_autoscaler_pod_identity" {
  source = "../../"

  name = "cluster-autoscaler"

  attach_cluster_autoscaler_policy = true

  tags = local.tags
}

module "aws_ebs_csi_pod_identity" {
  source = "../../"

  name = "aws-ebs-csi"

  attach_aws_ebs_csi_policy = true

  tags = local.tags
}

module "aws_efs_csi_pod_identity" {
  source = "../../"

  name = "aws-efs-csi"

  attach_aws_efs_csi_policy = true

  tags = local.tags
}

module "external_dns_pod_identity" {
  source = "../../"

  name = "external-dns"

  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = ["arn:aws:route53:::hostedzone/IClearlyMadeThisUp"]

  tags = local.tags
}

module "external_secrets_pod_identity" {
  source = "../../"

  name = "external-secrets"

  attach_external_secrets_policy                     = true
  external_secrets_ssm_parameter_arns                = ["arn:aws:ssm:*:*:parameter/foo"]
  external_secrets_secrets_manager_arns              = ["arn:aws:secretsmanager:*:*:secret:bar"]
  external_secrets_kms_key_arns                      = ["arn:aws:kms:*:*:key/1234abcd-12ab-34cd-56ef-1234567890ab"]
  external_secrets_secrets_manager_create_permission = false

  tags = local.tags
}

module "aws_fsx_lustre_csi_pod_identity" {
  source = "../../"

  name = "aws-fsx-lustre-csi"

  attach_aws_fsx_lustre_csi_policy = true

  tags = local.tags
}

module "karpenter_pod_identity" {
  source = "../../"

  name = "karpenter"

  attach_karpenter_policy = true

  tags = local.tags
}

module "aws_lb_controller_pod_identity" {
  source = "../../"

  name = "aws-lbc"

  attach_aws_lb_controller_policy = true

  tags = local.tags
}

module "aws_lb_controller_targetgroup_binding_only_pod_identity" {
  source = "../../"

  name = "aws-lbc-targetgroup-binding-only"

  attach_aws_lb_controller_targetgroup_binding_only_policy = true

  tags = local.tags
}

module "aws_appmesh_controller_pod_identity" {
  source = "../../"

  name = "aws-appmesh-controller"

  attach_aws_appmesh_controller_policy = true

  tags = local.tags
}

module "aws_appmesh_envoy_proxy_pod_identity" {
  source = "../../"

  name = "aws-appmesh-envoy-proxy"

  attach_aws_appmesh_envoy_proxy_policy = true

  tags = local.tags
}

module "amazon_managed_service_prometheus_pod_identity" {
  source = "../../"

  name = "amazon-managed-service-prometheus"

  attach_amazon_managed_service_prometheus_policy = true

  tags = local.tags
}

module "aws_node_termination_handler_pod_identity" {
  source = "../../"

  name = "aws-node-termination-handler"

  attach_aws_node_termination_handler_policy = true

  tags = local.tags
}

module "velero_pod_identity" {
  source = "../../"

  name = "velero"

  attach_velero_policy  = true
  velero_s3_bucket_arns = ["arn:aws:s3:::velero-backups"]

  tags = local.tags
}

module "aws_vpc_cni_ipv4_pod_identity" {
  source = "../../"

  name = "aws-vpc-cni-ipv4"

  attach_aws_vpc_cni_policy = true
  aws_vpc_cni_enable_ipv4   = true

  tags = local.tags
}

module "aws_vpc_cni_ipv6_pod_identity" {
  source = "../../"

  name = "aws-vpc-cni-ipv6"

  attach_aws_vpc_cni_policy = true
  aws_vpc_cni_enable_ipv6   = true

  tags = local.tags
}

module "disabled" {
  source = "../../"

  create = false
}

################################################################################
# Supporting Resources
################################################################################

resource "aws_iam_policy" "additional" {
  name        = "${local.name}-additional"
  description = "Additional test policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })

  tags = local.tags
}

data "aws_iam_policy_document" "source" {
  statement {
    actions   = ["s3:GetBucketLocation"]
    resources = ["arn:aws:s3:::*"]
  }
}

data "aws_iam_policy_document" "override" {
  statement {
    effect = "Deny"

    actions   = ["s3:*"]
    resources = ["*"]
  }
}
