# AWS EKS Pod Identity Terraform module

Terraform module which creates [Amazon EKS Pod Identity roles](https://docs.aws.amazon.com/eks/latest/userguide/pod-identities.html).

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

## Usage

See [`examples`](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/tree/master/examples) directory for working examples to reference:

### Custom IAM Role

You can attach custom permissions/policies in a number of different ways:

```hcl
module "custom_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "custom"

  trust_policy_conditions = [
    {
      test     = "StringEquals"
      variable = "aws:PrincipalOrgID"
      values   = ["o-1234567890"]
    }
  ]

  trust_policy_statements = [
    {
      sid       = "Test"
      actions   = ["sts:AssumeRole"]
      resources = ["arn:aws:iam::1234567890:role/Test*"]
    }
  ]

  attach_custom_policy      = true
  source_policy_documents   = [data.aws_iam_policy_document.source.json]
  override_policy_documents = [data.aws_iam_policy_document.override.json]

  policy_statements = [
    {
      sid       = "S3"
      actions   = ["s3:List*"]
      resources = ["*"]
    }
  ]

  additional_policy_arns = {
    AmazonEKS_CNI_Policy = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    additional           = aws_iam_policy.additional.arn
  }

  associations = {
    custom-association = {
      cluster_name    = "custom-cluster"
      namespace       = "custom-namespace"
      service_account = "custom-service-account"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS Gateway Controller](https://github.com/aws/aws-application-networking-k8s)

```hcl
module "aws_gateway_controller_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-gateway-controller"

  attach_aws_gateway_controller_policy = true

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "aws-application-networking-system"
      service_account = "gateway-api-controller"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [Cert Manager](https://github.com/cert-manager/cert-manager)

```hcl
module "cert_manager_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "cert-manager"

  attach_cert_manager_policy    = true
  cert_manager_hosted_zone_arns = ["arn:aws:route53:::hostedzone/IClearlyMadeThisUp"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "cert-manager"
      service_account = "cert-manager"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS CloudWatch Observability](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/install-CloudWatch-Observability-EKS-addon.html)

```hcl
module "aws_cloudwatch_observability_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-cloudwatch-observability"

  attach_aws_cloudwatch_observability_policy = true

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "amazon-cloudwatch"
      service_account = "cloudwatch-agent"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [Cluster Autoscaler](https://github.com/kubernetes/autoscaler)

```hcl
module "cluster_autoscaler_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "cluster-autoscaler"

  attach_cluster_autoscaler_policy = true
  cluster_autoscaler_cluster_names = ["foo"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "kube-system"
      service_account = "cluster-autoscaler-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS EBS CSI Driver](https://github.com/kubernetes-sigs/aws-ebs-csi-driver)

```hcl
module "aws_ebs_csi_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-ebs-csi"

  attach_aws_ebs_csi_policy = true
  aws_ebs_csi_kms_arns      = ["arn:aws:kms:*:*:key/1234abcd-12ab-34cd-56ef-1234567890ab"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "kube-system"
      service_account = "ebs-csi-controller-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS EFS CSI Driver](https://github.com/kubernetes-sigs/aws-efs-csi-driver)

```hcl
module "aws_efs_csi_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-efs-csi"

  attach_aws_efs_csi_policy = true

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "kube-system"
      service_account = "efs-csi-controller-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [External DNS](https://github.com/kubernetes-sigs/external-dns)

```hcl
module "external_dns_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "external-dns"

  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = ["arn:aws:route53:::hostedzone/IClearlyMadeThisUp"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "external-dns"
      service_account = "external-dns-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [External Secrets](https://github.com/external-secrets/external-secrets)

```hcl
module "external_secrets_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "external-secrets"

  attach_external_secrets_policy        = true
  external_secrets_ssm_parameter_arns   = ["arn:aws:ssm:*:*:parameter/foo"]
  external_secrets_secrets_manager_arns = ["arn:aws:secretsmanager:*:*:secret:bar"]
  external_secrets_kms_key_arns         = ["arn:aws:kms:*:*:key/1234abcd-12ab-34cd-56ef-1234567890ab"]
  external_secrets_create_permission    = true

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "external-secrets"
      service_account = "external-secrets-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS FSx for Lustre CSI Driver](https://github.com/kubernetes-sigs/aws-fsx-csi-driver)

```hcl
module "aws_fsx_lustre_csi_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-fsx-lustre-csi"

  attach_aws_fsx_lustre_csi_policy     = true
  aws_fsx_lustre_csi_service_role_arns = ["arn:aws:iam::*:role/aws-service-role/s3.data-source.lustre.fsx.amazonaws.com/*"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "kube-system"
      service_account = "fsx-csi-controller-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS Load Balancer Controller](https://github.com/kubernetes-sigs/aws-load-balancer-controller)

```hcl
module "aws_lb_controller_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-lbc"

  attach_aws_lb_controller_policy = true

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "kube-system"
      service_account = "aws-load-balancer-controller-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS Load Balancer Controller - Target Group Binding Only](https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.6/deploy/installation/#option-b-attach-iam-policies-to-nodes)

```hcl
module "aws_lb_controller_targetgroup_binding_only_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-lbc-targetgroup-binding-only"

  attach_aws_lb_controller_targetgroup_binding_only_policy = true
  aws_lb_controller_targetgroup_arns                       = ["arn:aws:elasticloadbalancing:*:*:targetgroup/foo/bar"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "kube-system"
      service_account = "aws-load-balancer-controller-tgb-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AwS AppMesh Controller](https://github.com/aws/aws-app-mesh-controller-for-k8s)

```hcl
module "aws_appmesh_controller_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-appmesh-controller"

  attach_aws_appmesh_controller_policy = true

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "appmesh-system"
      service_account = "appmesh-controller"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AwS AppMesh Envoy Proxy](https://github.com/aws/aws-app-mesh-controller-for-k8s)

```hcl
module "aws_appmesh_envoy_proxy_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-appmesh-envoy-proxy"

  attach_aws_appmesh_envoy_proxy_policy = true

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "appmesh-system"
      service_account = "envoy-proxy"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [Amazon Managed Service for Prometheus](https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-collector-how-to.html)

```hcl
module "amazon_managed_service_prometheus_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "amazon-managed-service-prometheus"

  attach_amazon_managed_service_prometheus_policy  = true
  amazon_managed_service_prometheus_workspace_arns = ["arn:aws:prometheus:*:*:workspace/foo"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "prometheus"
      service_account = "prometheus"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [Mountpoint S3 CSI Driver](https://github.com/awslabs/mountpoint-s3)

```hcl
module "mountpoint_s3_csi_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "mountpoint-s3-csi"

  attach_mountpoint_s3_csi_policy    = true
  mountpoint_s3_csi_bucket_arns      = ["arn:aws:s3:::mountpoint-s3"]
  mountpoint_s3_csi_bucket_path_arns = ["arn:aws:s3:::mountpoint-s3/example/*"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "kube-system"
      service_account = "s3-csi-driver-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS Node Termination Handler](https://github.com/aws/aws-node-termination-handler)

```hcl
module "aws_node_termination_handler_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-node-termination-handler"

  attach_aws_node_termination_handler_policy  = true
  aws_node_termination_handler_sqs_queue_arns = ["arn:aws:sqs:*:*:eks-node-termination-handler"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "aws-node-termination-handler"
      service_account = "aws-node-termination-handler-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS Private CA Issuer](https://github.com/cert-manager/aws-privateca-issuer)

```hcl
module "aws_privateca_issuer_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-privateca-issuer"

  attach_aws_privateca_issuer_policy = true
  aws_privateca_issuer_acmca_arns    = ["arn:aws:acm-pca:*:*:certificate-authority/foo"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "cert-manager"
      service_account = "aws-privateca-issuer-sa"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [PGAnalyze](https://pganalyze.com/)

```hcl
module "pganalyze_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "pganalyze"

  attach_pganalyze_pod_identity_policy = true

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "default"
      service_account = "pganalyze-service-account"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [Velero](https://github.com/vmware-tanzu/velero)

```hcl
module "velero_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "velero"

  attach_velero_policy       = true
  velero_s3_bucket_arns      = ["arn:aws:s3:::velero-backups"]
  velero_s3_bucket_path_arns = ["arn:aws:s3:::velero-backups/example/*"]

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "velero"
      service_account = "velero-server"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS VPC CNI - IPv4](https://github.com/aws/amazon-vpc-cni-k8s)

```hcl
module "aws_vpc_cni_ipv4_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-vpc-cni-ipv4"

  attach_aws_vpc_cni_policy = true
  aws_vpc_cni_enable_ipv4   = true

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "kube-system"
      service_account = "aws-node"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

### [AWS VPC CNI - IPv6](https://github.com/aws/amazon-vpc-cni-k8s)

```hcl
module "aws_vpc_cni_ipv6_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "aws-vpc-cni-ipv6"

  attach_aws_vpc_cni_policy = true
  aws_vpc_cni_enable_ipv6   = true

  associations = {
    this = {
      cluster_name    = "example"
      namespace       = "kube-system"
      service_account = "aws-node"
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

## Examples

Examples codified under the [`examples`](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/tree/master/examples) are intended to give users references for how to use the module(s) as well as testing/validating changes to the source code of the module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow maintainers to test your changes and to keep the examples up to date for users. Thank you!

- [Complete](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/tree/master/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.28 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 6.28 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_pod_identity_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_pod_identity_association) | resource |
| [aws_iam_policy.amazon_managed_service_prometheus](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.appmesh_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.appmesh_envoy_proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.aws_gateway_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.aws_privateca_issuer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cert_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ebs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.efs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.fsx_lustre_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.lb_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.lb_controller_targetgroup_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.mountpoint_s3_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.node_termination_handler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.pganalyze](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.vpc_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.amazon_managed_service_prometheus](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.appmesh_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.appmesh_envoy_proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.aws_cloudwatch_observability](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.aws_gateway_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.aws_privateca_issuer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cert_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ebs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.efs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.fsx_lustre_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lb_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lb_controller_targetgroup_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.mountpoint_s3_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node_termination_handler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.pganalyze](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.vpc_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.amazon_managed_service_prometheus](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.appmesh_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.appmesh_envoy_proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_gateway_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_privateca_issuer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.base](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cert_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ebs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.efs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.external_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.fsx_lustre_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lb_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lb_controller_targetgroup_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.mountpoint_s3_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.node_termination_handler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.pganalyze](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vpc_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_policy_arns"></a> [additional\_policy\_arns](#input\_additional\_policy\_arns) | ARNs of additional policies to attach to the IAM role | `map(string)` | `{}` | no |
| <a name="input_amazon_managed_service_prometheus_policy_name"></a> [amazon\_managed\_service\_prometheus\_policy\_name](#input\_amazon\_managed\_service\_prometheus\_policy\_name) | Custom name of the Amazon Managed Service for Prometheus IAM policy | `string` | `null` | no |
| <a name="input_amazon_managed_service_prometheus_workspace_arns"></a> [amazon\_managed\_service\_prometheus\_workspace\_arns](#input\_amazon\_managed\_service\_prometheus\_workspace\_arns) | List of AMP Workspace ARNs to read and write metrics | `list(string)` | `[]` | no |
| <a name="input_appmesh_controller_policy_name"></a> [appmesh\_controller\_policy\_name](#input\_appmesh\_controller\_policy\_name) | Custom name of the AppMesh Controller IAM policy | `string` | `null` | no |
| <a name="input_appmesh_envoy_proxy_policy_name"></a> [appmesh\_envoy\_proxy\_policy\_name](#input\_appmesh\_envoy\_proxy\_policy\_name) | Custom name of the AppMesh Envoy Proxy IAM policy | `string` | `null` | no |
| <a name="input_association_defaults"></a> [association\_defaults](#input\_association\_defaults) | Default values used across all Pod Identity associations created unless a more specific value is provided | <pre>object({<br/>    cluster_name         = optional(string)<br/>    disable_session_tags = optional(bool)<br/>    namespace            = optional(string)<br/>    service_account      = optional(string)<br/>    role_arn             = optional(string)<br/>    target_role_arn      = optional(string)<br/>    tags                 = optional(map(string), {})<br/>  })</pre> | `{}` | no |
| <a name="input_associations"></a> [associations](#input\_associations) | Map of Pod Identity associations to be created (map of maps) | <pre>map(object({<br/>    cluster_name         = optional(string)<br/>    disable_session_tags = optional(bool)<br/>    namespace            = optional(string)<br/>    service_account      = optional(string)<br/>    role_arn             = optional(string)<br/>    target_role_arn      = optional(string)<br/>    tags                 = optional(map(string), {})<br/>  }))</pre> | `{}` | no |
| <a name="input_attach_amazon_managed_service_prometheus_policy"></a> [attach\_amazon\_managed\_service\_prometheus\_policy](#input\_attach\_amazon\_managed\_service\_prometheus\_policy) | Determines whether to attach the Amazon Managed Service for Prometheus IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_appmesh_controller_policy"></a> [attach\_aws\_appmesh\_controller\_policy](#input\_attach\_aws\_appmesh\_controller\_policy) | Determines whether to attach the AppMesh Controller policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_appmesh_envoy_proxy_policy"></a> [attach\_aws\_appmesh\_envoy\_proxy\_policy](#input\_attach\_aws\_appmesh\_envoy\_proxy\_policy) | Determines whether to attach the AppMesh Envoy Proxy policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_cloudwatch_observability_policy"></a> [attach\_aws\_cloudwatch\_observability\_policy](#input\_attach\_aws\_cloudwatch\_observability\_policy) | Determines whether to attach the AWS Cloudwatch Observability IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_ebs_csi_policy"></a> [attach\_aws\_ebs\_csi\_policy](#input\_attach\_aws\_ebs\_csi\_policy) | Determines whether to attach the EBS CSI IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_efs_csi_policy"></a> [attach\_aws\_efs\_csi\_policy](#input\_attach\_aws\_efs\_csi\_policy) | Determines whether to attach the EFS CSI IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_fsx_lustre_csi_policy"></a> [attach\_aws\_fsx\_lustre\_csi\_policy](#input\_attach\_aws\_fsx\_lustre\_csi\_policy) | Determines whether to attach the FSx for Lustre CSI Driver IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_gateway_controller_policy"></a> [attach\_aws\_gateway\_controller\_policy](#input\_attach\_aws\_gateway\_controller\_policy) | Determines whether to attach the AWS Gateway Controller IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_lb_controller_policy"></a> [attach\_aws\_lb\_controller\_policy](#input\_attach\_aws\_lb\_controller\_policy) | Determines whether to attach the AWS Load Balancer Controller policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_lb_controller_targetgroup_binding_only_policy"></a> [attach\_aws\_lb\_controller\_targetgroup\_binding\_only\_policy](#input\_attach\_aws\_lb\_controller\_targetgroup\_binding\_only\_policy) | Determines whether to attach the AWS Load Balancer Controller policy for the TargetGroupBinding only | `bool` | `false` | no |
| <a name="input_attach_aws_node_termination_handler_policy"></a> [attach\_aws\_node\_termination\_handler\_policy](#input\_attach\_aws\_node\_termination\_handler\_policy) | Determines whether to attach the Node Termination Handler policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_privateca_issuer_policy"></a> [attach\_aws\_privateca\_issuer\_policy](#input\_attach\_aws\_privateca\_issuer\_policy) | Determines whether to attach the AWS Private CA Issuer IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_vpc_cni_policy"></a> [attach\_aws\_vpc\_cni\_policy](#input\_attach\_aws\_vpc\_cni\_policy) | Determines whether to attach the VPC CNI IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_cert_manager_policy"></a> [attach\_cert\_manager\_policy](#input\_attach\_cert\_manager\_policy) | Determines whether to attach the Cert Manager IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_cluster_autoscaler_policy"></a> [attach\_cluster\_autoscaler\_policy](#input\_attach\_cluster\_autoscaler\_policy) | Determines whether to attach the Cluster Autoscaler IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_custom_policy"></a> [attach\_custom\_policy](#input\_attach\_custom\_policy) | Determines whether to attach the custom IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_external_dns_policy"></a> [attach\_external\_dns\_policy](#input\_attach\_external\_dns\_policy) | Determines whether to attach the External DNS IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_external_secrets_policy"></a> [attach\_external\_secrets\_policy](#input\_attach\_external\_secrets\_policy) | Determines whether to attach the External Secrets policy to the role | `bool` | `false` | no |
| <a name="input_attach_mountpoint_s3_csi_policy"></a> [attach\_mountpoint\_s3\_csi\_policy](#input\_attach\_mountpoint\_s3\_csi\_policy) | Determines whether to attach the Mountpoint S3 CSI IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_pganalyze_policy"></a> [attach\_pganalyze\_policy](#input\_attach\_pganalyze\_policy) | Determines whether to attach the PGAnalyze IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_velero_policy"></a> [attach\_velero\_policy](#input\_attach\_velero\_policy) | Determines whether to attach the Velero IAM policy to the role | `bool` | `false` | no |
| <a name="input_aws_ebs_csi_kms_arns"></a> [aws\_ebs\_csi\_kms\_arns](#input\_aws\_ebs\_csi\_kms\_arns) | KMS key ARNs to allow EBS CSI to manage encrypted volumes | `list(string)` | `[]` | no |
| <a name="input_aws_ebs_csi_policy_name"></a> [aws\_ebs\_csi\_policy\_name](#input\_aws\_ebs\_csi\_policy\_name) | Custom name of the EBS CSI IAM policy | `string` | `null` | no |
| <a name="input_aws_efs_csi_policy_name"></a> [aws\_efs\_csi\_policy\_name](#input\_aws\_efs\_csi\_policy\_name) | Custom name of the EFS CSI IAM policy | `string` | `null` | no |
| <a name="input_aws_fsx_lustre_csi_policy_name"></a> [aws\_fsx\_lustre\_csi\_policy\_name](#input\_aws\_fsx\_lustre\_csi\_policy\_name) | Custom name of the FSx for Lustre CSI Driver IAM policy | `string` | `null` | no |
| <a name="input_aws_fsx_lustre_csi_service_role_arns"></a> [aws\_fsx\_lustre\_csi\_service\_role\_arns](#input\_aws\_fsx\_lustre\_csi\_service\_role\_arns) | Service role ARNs to allow FSx for Lustre CSI create and manage FSX for Lustre service linked roles | `list(string)` | `[]` | no |
| <a name="input_aws_gateway_controller_policy_name"></a> [aws\_gateway\_controller\_policy\_name](#input\_aws\_gateway\_controller\_policy\_name) | Custom name of the AWS Gateway Controller IAM policy | `string` | `null` | no |
| <a name="input_aws_lb_controller_policy_name"></a> [aws\_lb\_controller\_policy\_name](#input\_aws\_lb\_controller\_policy\_name) | Custom name of the AWS Load Balancer Controller IAM policy | `string` | `null` | no |
| <a name="input_aws_lb_controller_targetgroup_arns"></a> [aws\_lb\_controller\_targetgroup\_arns](#input\_aws\_lb\_controller\_targetgroup\_arns) | List of Target groups ARNs using Load Balancer Controller | `list(string)` | `[]` | no |
| <a name="input_aws_lb_controller_targetgroup_only_policy_name"></a> [aws\_lb\_controller\_targetgroup\_only\_policy\_name](#input\_aws\_lb\_controller\_targetgroup\_only\_policy\_name) | Custom name of the AWS Load Balancer Controller IAM policy for the TargetGroupBinding only | `string` | `null` | no |
| <a name="input_aws_node_termination_handler_policy_name"></a> [aws\_node\_termination\_handler\_policy\_name](#input\_aws\_node\_termination\_handler\_policy\_name) | Custom name of the Node Termination Handler IAM policy | `string` | `null` | no |
| <a name="input_aws_node_termination_handler_sqs_queue_arns"></a> [aws\_node\_termination\_handler\_sqs\_queue\_arns](#input\_aws\_node\_termination\_handler\_sqs\_queue\_arns) | List of SQS ARNs that contain node termination events | `list(string)` | `[]` | no |
| <a name="input_aws_privateca_issuer_acmca_arns"></a> [aws\_privateca\_issuer\_acmca\_arns](#input\_aws\_privateca\_issuer\_acmca\_arns) | List of ACM Private CA ARNs to issue certificates from | `list(string)` | `[]` | no |
| <a name="input_aws_privateca_issuer_policy_name"></a> [aws\_privateca\_issuer\_policy\_name](#input\_aws\_privateca\_issuer\_policy\_name) | Custom name of the AWS Private CA Issuer IAM policy | `string` | `null` | no |
| <a name="input_aws_vpc_cni_enable_cloudwatch_logs"></a> [aws\_vpc\_cni\_enable\_cloudwatch\_logs](#input\_aws\_vpc\_cni\_enable\_cloudwatch\_logs) | Determines whether to enable VPC CNI permission to create CloudWatch Log groups and publish network policy events | `bool` | `false` | no |
| <a name="input_aws_vpc_cni_enable_ipv4"></a> [aws\_vpc\_cni\_enable\_ipv4](#input\_aws\_vpc\_cni\_enable\_ipv4) | Determines whether to enable IPv4 permissions for VPC CNI policy | `bool` | `false` | no |
| <a name="input_aws_vpc_cni_enable_ipv6"></a> [aws\_vpc\_cni\_enable\_ipv6](#input\_aws\_vpc\_cni\_enable\_ipv6) | Determines whether to enable IPv6 permissions for VPC CNI policy | `bool` | `false` | no |
| <a name="input_aws_vpc_cni_policy_name"></a> [aws\_vpc\_cni\_policy\_name](#input\_aws\_vpc\_cni\_policy\_name) | Custom name of the VPC CNI IAM policy | `string` | `null` | no |
| <a name="input_cert_manager_hosted_zone_arns"></a> [cert\_manager\_hosted\_zone\_arns](#input\_cert\_manager\_hosted\_zone\_arns) | Route53 hosted zone ARNs to allow Cert manager to manage records | `list(string)` | `[]` | no |
| <a name="input_cert_manager_policy_name"></a> [cert\_manager\_policy\_name](#input\_cert\_manager\_policy\_name) | Custom name of the Cert Manager IAM policy | `string` | `null` | no |
| <a name="input_cluster_autoscaler_cluster_names"></a> [cluster\_autoscaler\_cluster\_names](#input\_cluster\_autoscaler\_cluster\_names) | List of cluster names to appropriately scope permissions within the Cluster Autoscaler IAM policy | `list(string)` | `[]` | no |
| <a name="input_cluster_autoscaler_policy_name"></a> [cluster\_autoscaler\_policy\_name](#input\_cluster\_autoscaler\_policy\_name) | Custom name of the Cluster Autoscaler IAM policy | `string` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Determines whether resources will be created (affects all resources) | `bool` | `true` | no |
| <a name="input_custom_policy_description"></a> [custom\_policy\_description](#input\_custom\_policy\_description) | Description of the custom IAM policy | `string` | `"Custom IAM Policy"` | no |
| <a name="input_description"></a> [description](#input\_description) | IAM Role description | `string` | `null` | no |
| <a name="input_external_dns_hosted_zone_arns"></a> [external\_dns\_hosted\_zone\_arns](#input\_external\_dns\_hosted\_zone\_arns) | Route53 hosted zone ARNs to allow External DNS to manage records | `list(string)` | `[]` | no |
| <a name="input_external_dns_policy_name"></a> [external\_dns\_policy\_name](#input\_external\_dns\_policy\_name) | Custom name of the External DNS IAM policy | `string` | `null` | no |
| <a name="input_external_secrets_create_permission"></a> [external\_secrets\_create\_permission](#input\_external\_secrets\_create\_permission) | Determines whether External Secrets has permission to create/delete secrets | `bool` | `false` | no |
| <a name="input_external_secrets_kms_key_arns"></a> [external\_secrets\_kms\_key\_arns](#input\_external\_secrets\_kms\_key\_arns) | List of KMS Key ARNs that are used by Secrets Manager that contain secrets to mount using External Secrets | `list(string)` | `[]` | no |
| <a name="input_external_secrets_policy_name"></a> [external\_secrets\_policy\_name](#input\_external\_secrets\_policy\_name) | Custom name of the External Secrets IAM policy | `string` | `null` | no |
| <a name="input_external_secrets_secrets_manager_arns"></a> [external\_secrets\_secrets\_manager\_arns](#input\_external\_secrets\_secrets\_manager\_arns) | List of Secrets Manager ARNs that contain secrets to mount using External Secrets | `list(string)` | `[]` | no |
| <a name="input_external_secrets_ssm_parameter_arns"></a> [external\_secrets\_ssm\_parameter\_arns](#input\_external\_secrets\_ssm\_parameter\_arns) | List of Systems Manager Parameter ARNs that contain secrets to mount using External Secrets | `list(string)` | `[]` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum CLI/API session duration in seconds between 3600 and 43200 | `number` | `null` | no |
| <a name="input_mountpoint_s3_csi_bucket_arns"></a> [mountpoint\_s3\_csi\_bucket\_arns](#input\_mountpoint\_s3\_csi\_bucket\_arns) | List of S3 Bucket ARNs that Mountpoint S3 CSI needs access to list | `list(string)` | `[]` | no |
| <a name="input_mountpoint_s3_csi_bucket_path_arns"></a> [mountpoint\_s3\_csi\_bucket\_path\_arns](#input\_mountpoint\_s3\_csi\_bucket\_path\_arns) | S3 path ARNs to allow Mountpoint S3 CSI driver to manage items at the provided path(s). This is required if `attach_mountpoint_s3_csi_policy = true` | `list(string)` | `[]` | no |
| <a name="input_mountpoint_s3_csi_policy_name"></a> [mountpoint\_s3\_csi\_policy\_name](#input\_mountpoint\_s3\_csi\_policy\_name) | Custom name of the Mountpoint S3 CSI IAM policy | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of IAM role | `string` | `""` | no |
| <a name="input_override_policy_documents"></a> [override\_policy\_documents](#input\_override\_policy\_documents) | List of IAM policy documents that are merged together into the exported document | `list(string)` | `[]` | no |
| <a name="input_path"></a> [path](#input\_path) | Path of IAM role | `string` | `"/"` | no |
| <a name="input_permissions_boundary_arn"></a> [permissions\_boundary\_arn](#input\_permissions\_boundary\_arn) | Permissions boundary ARN to use for IAM role | `string` | `null` | no |
| <a name="input_pganalyze_policy_name"></a> [pganalyze\_policy\_name](#input\_pganalyze\_policy\_name) | Custom name of the PGAnalyze IAM policy | `string` | `null` | no |
| <a name="input_policy_name_prefix"></a> [policy\_name\_prefix](#input\_policy\_name\_prefix) | IAM policy name prefix | `string` | `"AmazonEKS_"` | no |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | A list of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage | <pre>list(object({<br/>    sid           = optional(string)<br/>    actions       = optional(list(string))<br/>    not_actions   = optional(list(string))<br/>    effect        = optional(string)<br/>    resources     = optional(list(string))<br/>    not_resources = optional(list(string))<br/>    principals = optional(list(object({<br/>      type        = string<br/>      identifiers = list(string)<br/>    })))<br/>    not_principals = optional(list(object({<br/>      type        = string<br/>      identifiers = list(string)<br/>    })))<br/>    condition = optional(list(object({<br/>      test     = string<br/>      values   = list(string)<br/>      variable = string<br/>    })))<br/>  }))</pre> | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where the resource(s) will be managed. Defaults to the Region set in the provider configuration | `string` | `null` | no |
| <a name="input_source_policy_documents"></a> [source\_policy\_documents](#input\_source\_policy\_documents) | List of IAM policy documents that are merged together into the exported document | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_trust_policy_conditions"></a> [trust\_policy\_conditions](#input\_trust\_policy\_conditions) | A list of conditions to add to the role trust policy | <pre>list(object({<br/>    test     = string<br/>    values   = list(string)<br/>    variable = string<br/>  }))</pre> | `[]` | no |
| <a name="input_trust_policy_statements"></a> [trust\_policy\_statements](#input\_trust\_policy\_statements) | A list of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for the role trust policy | <pre>list(object({<br/>    sid           = optional(string)<br/>    actions       = optional(list(string))<br/>    not_actions   = optional(list(string))<br/>    effect        = optional(string)<br/>    resources     = optional(list(string))<br/>    not_resources = optional(list(string))<br/>    principals = optional(list(object({<br/>      type        = string<br/>      identifiers = list(string)<br/>    })))<br/>    not_principals = optional(list(object({<br/>      type        = string<br/>      identifiers = list(string)<br/>    })))<br/>    condition = optional(list(object({<br/>      test     = string<br/>      values   = list(string)<br/>      variable = string<br/>    })))<br/>  }))</pre> | `null` | no |
| <a name="input_use_name_prefix"></a> [use\_name\_prefix](#input\_use\_name\_prefix) | Determines whether the role name and policy name(s) are used as a prefix | `string` | `true` | no |
| <a name="input_velero_kms_arns"></a> [velero\_kms\_arns](#input\_velero\_kms\_arns) | KMS key ARNs to allow Velero to manage encrypted s3 buckets | `list(string)` | `[]` | no |
| <a name="input_velero_policy_name"></a> [velero\_policy\_name](#input\_velero\_policy\_name) | Custom name of the Velero IAM policy | `string` | `null` | no |
| <a name="input_velero_s3_bucket_arns"></a> [velero\_s3\_bucket\_arns](#input\_velero\_s3\_bucket\_arns) | List of S3 Bucket ARNs that Velero needs access to list | `list(string)` | `[]` | no |
| <a name="input_velero_s3_bucket_path_arns"></a> [velero\_s3\_bucket\_path\_arns](#input\_velero\_s3\_bucket\_path\_arns) | S3 path ARNs to allow Velero to manage items at the provided path(s). This is required if `attach_mountpoint_s3_csi_policy = true` | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_associations"></a> [associations](#output\_associations) | Map of Pod Identity associations created |
| <a name="output_iam_policy_arn"></a> [iam\_policy\_arn](#output\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_iam_policy_id"></a> [iam\_policy\_id](#output\_iam\_policy\_id) | The policy's ID |
| <a name="output_iam_policy_name"></a> [iam\_policy\_name](#output\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | Name of IAM role |
| <a name="output_iam_role_path"></a> [iam\_role\_path](#output\_iam\_role\_path) | Path of IAM role |
| <a name="output_iam_role_unique_id"></a> [iam\_role\_unique\_id](#output\_iam\_role\_unique\_id) | Unique ID of IAM role |
<!-- END_TF_DOCS -->

## License

Apache-2.0 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/blob/master/LICENSE).
