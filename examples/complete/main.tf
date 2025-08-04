provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

locals {
  region = "eu-west-1"
  name   = "pod-id-ex-${basename(path.cwd)}"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity"
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

  trust_policy_conditions = [
    {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"
      values   = ["o-1234567890"]
    }
  ]

  associations = {
    ex-one = {
      cluster_name    = module.eks_one.cluster_name
      namespace       = "custom"
      service_account = "custom"
    }
    ex-two = {
      cluster_name    = module.eks_two.cluster_name
      namespace       = "custom"
      service_account = "custom"
    }
  }

  tags = local.tags
}

module "aws_gateway_controller_pod_identity" {
  source = "../../"

  name = "aws-gateway-controller"

  attach_aws_gateway_controller_policy = true

  # Pod Identity Associations
  association_defaults = {
    namespace       = "aws-application-networking-system"
    service_account = "gateway-api-controller"
    tags            = { App = "Example" }
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "cert_manager_pod_identity" {
  source = "../../"

  name = "cert-manager"

  attach_cert_manager_policy    = true
  cert_manager_hosted_zone_arns = ["arn:aws:route53:::hostedzone/IClearlyMadeThisUp"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "cert-manager"
    service_account = "cert-manager"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_cloudwatch_observability_pod_identity" {
  source = "../../"

  name = "aws-cloudwatch-observability"

  attach_aws_cloudwatch_observability_policy = true

  # Pod Identity Associations
  association_defaults = {
    namespace       = "amazon-cloudwatch"
    service_account = "cloudwatch-agent"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "cluster_autoscaler_pod_identity" {
  source = "../../"

  name = "cluster-autoscaler"

  attach_cluster_autoscaler_policy = true
  cluster_autoscaler_cluster_names = ["foo"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "kube-system"
    service_account = "cluster-autoscaler-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_ebs_csi_pod_identity" {
  source = "../../"

  name = "aws-ebs-csi"

  attach_aws_ebs_csi_policy = true
  aws_ebs_csi_kms_arns      = ["arn:aws:kms:*:*:key/1234abcd-12ab-34cd-56ef-1234567890ab"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "kube-system"
    service_account = "ebs-csi-controller-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_efs_csi_pod_identity" {
  source = "../../"

  name = "aws-efs-csi"

  attach_aws_efs_csi_policy = true

  # Pod Identity Associations
  association_defaults = {
    namespace       = "kube-system"
    service_account = "efs-csi-controller-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "external_dns_pod_identity" {
  source = "../../"

  name = "external-dns"

  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = ["arn:aws:route53:::hostedzone/IClearlyMadeThisUp"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "external-dns"
    service_account = "external-dns-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "external_secrets_pod_identity" {
  source = "../../"

  name = "external-secrets"

  attach_external_secrets_policy        = true
  external_secrets_ssm_parameter_arns   = ["arn:aws:ssm:*:*:parameter/foo"]
  external_secrets_secrets_manager_arns = ["arn:aws:secretsmanager:*:*:secret:bar"]
  external_secrets_kms_key_arns         = ["arn:aws:kms:*:*:key/1234abcd-12ab-34cd-56ef-1234567890ab"]
  external_secrets_create_permission    = true

  # Pod Identity Associations
  association_defaults = {
    namespace       = "external-secrets"
    service_account = "external-secrets-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_fsx_lustre_csi_pod_identity" {
  source = "../../"

  name = "aws-fsx-lustre-csi"

  attach_aws_fsx_lustre_csi_policy     = true
  aws_fsx_lustre_csi_service_role_arns = ["arn:aws:iam::*:role/aws-service-role/s3.data-source.lustre.fsx.amazonaws.com/*"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "kube-system"
    service_account = "fsx-csi-controller-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_lb_controller_pod_identity" {
  source = "../../"

  name = "aws-lbc"

  attach_aws_lb_controller_policy = true

  # Pod Identity Associations
  association_defaults = {
    namespace       = "kube-system"
    service_account = "aws-load-balancer-controller-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_lb_controller_targetgroup_binding_only_pod_identity" {
  source = "../../"

  name = "aws-lbc-targetgroup-binding-only"

  attach_aws_lb_controller_targetgroup_binding_only_policy = true
  aws_lb_controller_targetgroup_arns                       = ["arn:aws:elasticloadbalancing:*:*:targetgroup/foo/bar"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "kube-system"
    service_account = "aws-load-balancer-controller-tgb-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_appmesh_controller_pod_identity" {
  source = "../../"

  name = "aws-appmesh-controller"

  attach_aws_appmesh_controller_policy = true

  # Pod Identity Associations
  association_defaults = {
    namespace       = "appmesh-system"
    service_account = "appmesh-controller"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_appmesh_envoy_proxy_pod_identity" {
  source = "../../"

  name = "aws-appmesh-envoy-proxy"

  attach_aws_appmesh_envoy_proxy_policy = true

  # Pod Identity Associations
  association_defaults = {
    namespace       = "appmesh-system"
    service_account = "envoy-proxy"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "amazon_managed_service_prometheus_pod_identity" {
  source = "../../"

  name = "amazon-managed-service-prometheus"

  attach_amazon_managed_service_prometheus_policy  = true
  amazon_managed_service_prometheus_workspace_arns = ["arn:aws:prometheus:*:*:workspace/foo"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "prometheus"
    service_account = "prometheus"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "mountpoint_s3_csi_pod_identity" {
  source = "../../"

  name = "mountpoint-s3-csi"

  attach_mountpoint_s3_csi_policy    = true
  mountpoint_s3_csi_bucket_arns      = ["arn:aws:s3:::mountpoint-s3"]
  mountpoint_s3_csi_bucket_path_arns = ["arn:aws:s3:::mountpoint-s3/example/*"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "kube-system"
    service_account = "s3-csi-driver-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_node_termination_handler_pod_identity" {
  source = "../../"

  name = "aws-node-termination-handler"

  attach_aws_node_termination_handler_policy  = true
  aws_node_termination_handler_sqs_queue_arns = ["arn:aws:sqs:*:*:eks-node-termination-handler"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "aws-node-termination-handler"
    service_account = "aws-node-termination-handler-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_privateca_issuer_pod_identity" {
  source = "../../"

  name = "aws-privateca-issuer"

  attach_aws_privateca_issuer_policy = true
  aws_privateca_issuer_acmca_arns    = ["arn:aws:acm-pca:*:*:certificate-authority/foo"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "cert-manager"
    service_account = "aws-privateca-issuer-sa"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "velero_pod_identity" {
  source = "../../"

  name = "velero"

  attach_velero_policy       = true
  velero_s3_bucket_arns      = ["arn:aws:s3:::velero-backups"]
  velero_s3_bucket_path_arns = ["arn:aws:s3:::velero-backups/example/*"]

  # Pod Identity Associations
  association_defaults = {
    namespace       = "velero"
    service_account = "velero-server"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_vpc_cni_ipv4_pod_identity" {
  source = "../../"

  name = "aws-vpc-cni-ipv4"

  attach_aws_vpc_cni_policy = true
  aws_vpc_cni_enable_ipv4   = true

  # Pod Identity Associations
  association_defaults = {
    namespace       = "kube-system"
    service_account = "aws-node"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

  tags = local.tags
}

module "aws_vpc_cni_ipv6_pod_identity" {
  source = "../../"

  name = "aws-vpc-cni-ipv6"

  attach_aws_vpc_cni_policy = true
  aws_vpc_cni_enable_ipv6   = true

  # Pod Identity Associations
  association_defaults = {
    namespace       = "kube-system"
    service_account = "aws-node-ipv6"
  }

  associations = {
    ex-one = {
      cluster_name = module.eks_one.cluster_name
    }
    ex-two = {
      cluster_name = module.eks_two.cluster_name
    }
  }

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

module "eks_one" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name = "${local.name}-one"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = local.tags
}

module "eks_two" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name = "${local.name}-two"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = local.tags
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]

  enable_nat_gateway = false

  tags = local.tags
}
