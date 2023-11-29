# AWS EKS Pod Identity Terraform module

Terraform module which creates AWS EKS Pod Identity roles.

## Usage

See [`examples`](https://github.com/clowdhaus/terraform-aws-eks-pod-identity/tree/main/examples) directory for working examples to reference:

```hcl
module "eks_pod_identity" {
  source = "clowdhaus/eks-pod-identity/aws"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## Examples

Examples codified under the [`examples`](https://github.com/clowdhaus/terraform-aws-eks-pod-identity/tree/main/examples) are intended to give users references for how to use the module(s) as well as testing/validating changes to the source code of the module. If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow maintainers to test your changes and to keep the examples up to date for users. Thank you!

- [Complete](https://github.com/clowdhaus/terraform-aws-eks-pod-identity/tree/main/examples/complete)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.amazon_managed_service_prometheus](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.appmesh_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.appmesh_envoy_proxy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.aws_gateway_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.aws_privateca_issuer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cert_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.ebs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.efs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.external_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.fsx_lustre_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.karpenter_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.load_balancer_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.load_balancer_controller_targetgroup_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.node_termination_handler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
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
| [aws_iam_role_policy_attachment.ebs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.efs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.external_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.fsx_lustre_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.karpenter_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.load_balancer_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.load_balancer_controller_targetgroup_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node_termination_handler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
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
| [aws_iam_policy_document.cert_manager](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ebs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.efs_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.external_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.external_secrets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.fsx_lustre_csi](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.karpenter_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.load_balancer_controller](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.load_balancer_controller_targetgroup_only](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.node_termination_handler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vpc_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_policy_arns"></a> [additional\_policy\_arns](#input\_additional\_policy\_arns) | ARNs of additional policies to attach to the IAM role | `map(string)` | `{}` | no |
| <a name="input_amazon_managed_service_prometheus_policy_name"></a> [amazon\_managed\_service\_prometheus\_policy\_name](#input\_amazon\_managed\_service\_prometheus\_policy\_name) | Custom name of the Amazon Managed Service for Prometheus IAM policy | `string` | `null` | no |
| <a name="input_amazon_managed_service_prometheus_workspace_arns"></a> [amazon\_managed\_service\_prometheus\_workspace\_arns](#input\_amazon\_managed\_service\_prometheus\_workspace\_arns) | List of AMP Workspace ARNs to read and write metrics | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_appmesh_controller_policy_name"></a> [appmesh\_controller\_policy\_name](#input\_appmesh\_controller\_policy\_name) | Custom name of the AppMesh Controller IAM policy | `string` | `null` | no |
| <a name="input_appmesh_envoy_proxy_policy_name"></a> [appmesh\_envoy\_proxy\_policy\_name](#input\_appmesh\_envoy\_proxy\_policy\_name) | Custom name of the AppMesh Envoy Proxy IAM policy | `string` | `null` | no |
| <a name="input_assume_role_condition_test"></a> [assume\_role\_condition\_test](#input\_assume\_role\_condition\_test) | Name of the [IAM condition operator](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition_operators.html) to evaluate when assuming the role | `string` | `"StringEquals"` | no |
| <a name="input_attach_amazon_managed_service_prometheus_policy"></a> [attach\_amazon\_managed\_service\_prometheus\_policy](#input\_attach\_amazon\_managed\_service\_prometheus\_policy) | Determines whether to attach the Amazon Managed Service for Prometheus IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_appmesh_controller_policy"></a> [attach\_aws\_appmesh\_controller\_policy](#input\_attach\_aws\_appmesh\_controller\_policy) | Determines whether to attach the AppMesh Controller policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_appmesh_envoy_proxy_policy"></a> [attach\_aws\_appmesh\_envoy\_proxy\_policy](#input\_attach\_aws\_appmesh\_envoy\_proxy\_policy) | Determines whether to attach the AppMesh Envoy Proxy policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_cloudwatch_observability_policy"></a> [attach\_aws\_cloudwatch\_observability\_policy](#input\_attach\_aws\_cloudwatch\_observability\_policy) | Determines whether to attach the AWS Cloudwatch Observability IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_ebs_csi_policy"></a> [attach\_aws\_ebs\_csi\_policy](#input\_attach\_aws\_ebs\_csi\_policy) | Determines whether to attach the EBS CSI IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_efs_csi_policy"></a> [attach\_aws\_efs\_csi\_policy](#input\_attach\_aws\_efs\_csi\_policy) | Determines whether to attach the EFS CSI IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_fsx_lustre_csi_policy"></a> [attach\_aws\_fsx\_lustre\_csi\_policy](#input\_attach\_aws\_fsx\_lustre\_csi\_policy) | Determines whether to attach the FSx for Lustre CSI Driver IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_gateway_controller_policy"></a> [attach\_aws\_gateway\_controller\_policy](#input\_attach\_aws\_gateway\_controller\_policy) | Determines whether to attach the AWS Gateway Controller IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_load_balancer_controller_policy"></a> [attach\_aws\_load\_balancer\_controller\_policy](#input\_attach\_aws\_load\_balancer\_controller\_policy) | Determines whether to attach the AWS Load Balancer Controller policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_load_balancer_controller_targetgroup_binding_only_policy"></a> [attach\_aws\_load\_balancer\_controller\_targetgroup\_binding\_only\_policy](#input\_attach\_aws\_load\_balancer\_controller\_targetgroup\_binding\_only\_policy) | Determines whether to attach the AWS Load Balancer Controller policy for the TargetGroupBinding only | `bool` | `false` | no |
| <a name="input_attach_aws_node_termination_handler_policy"></a> [attach\_aws\_node\_termination\_handler\_policy](#input\_attach\_aws\_node\_termination\_handler\_policy) | Determines whether to attach the Node Termination Handler policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_privateca_issuer_policy"></a> [attach\_aws\_privateca\_issuer\_policy](#input\_attach\_aws\_privateca\_issuer\_policy) | Determines whether to attach the AWS Private CA Issuer IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_aws_vpc_cni_policy"></a> [attach\_aws\_vpc\_cni\_policy](#input\_attach\_aws\_vpc\_cni\_policy) | Determines whether to attach the VPC CNI IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_cert_manager_policy"></a> [attach\_cert\_manager\_policy](#input\_attach\_cert\_manager\_policy) | Determines whether to attach the Cert Manager IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_cluster_autoscaler_policy"></a> [attach\_cluster\_autoscaler\_policy](#input\_attach\_cluster\_autoscaler\_policy) | Determines whether to attach the Cluster Autoscaler IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_external_dns_policy"></a> [attach\_external\_dns\_policy](#input\_attach\_external\_dns\_policy) | Determines whether to attach the External DNS IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_external_secrets_policy"></a> [attach\_external\_secrets\_policy](#input\_attach\_external\_secrets\_policy) | Determines whether to attach the External Secrets policy to the role | `bool` | `false` | no |
| <a name="input_attach_karpenter_controller_policy"></a> [attach\_karpenter\_controller\_policy](#input\_attach\_karpenter\_controller\_policy) | Determines whether to attach the Karpenter Controller policy to the role | `bool` | `false` | no |
| <a name="input_attach_velero_policy"></a> [attach\_velero\_policy](#input\_attach\_velero\_policy) | Determines whether to attach the Velero IAM policy to the role | `bool` | `false` | no |
| <a name="input_aws_ebs_csi_kms_cmk_ids"></a> [aws\_ebs\_csi\_kms\_cmk\_ids](#input\_aws\_ebs\_csi\_kms\_cmk\_ids) | KMS CMK IDs to allow EBS CSI to manage encrypted volumes | `list(string)` | `[]` | no |
| <a name="input_aws_ebs_csi_policy_name"></a> [aws\_ebs\_csi\_policy\_name](#input\_aws\_ebs\_csi\_policy\_name) | Custom name of the EBS CSI IAM policy | `string` | `null` | no |
| <a name="input_aws_efs_csi_policy_name"></a> [aws\_efs\_csi\_policy\_name](#input\_aws\_efs\_csi\_policy\_name) | Custom name of the EFS CSI IAM policy | `string` | `null` | no |
| <a name="input_aws_fsx_lustre_csi_policy_name"></a> [aws\_fsx\_lustre\_csi\_policy\_name](#input\_aws\_fsx\_lustre\_csi\_policy\_name) | Custom name of the FSx for Lustre CSI Driver IAM policy | `string` | `null` | no |
| <a name="input_aws_fsx_lustre_csi_service_role_arns"></a> [aws\_fsx\_lustre\_csi\_service\_role\_arns](#input\_aws\_fsx\_lustre\_csi\_service\_role\_arns) | Service role ARNs to allow FSx for Lustre CSI create and manage FSX for Lustre service linked roles | `list(string)` | <pre>[<br>  "arn:aws:iam::*:role/aws-service-role/s3.data-source.lustre.fsx.amazonaws.com/*"<br>]</pre> | no |
| <a name="input_aws_gateway_controller_policy_name"></a> [aws\_gateway\_controller\_policy\_name](#input\_aws\_gateway\_controller\_policy\_name) | Custom name of the AWS Gateway Controller IAM policy | `string` | `null` | no |
| <a name="input_aws_load_balancer_controller_policy_name"></a> [aws\_load\_balancer\_controller\_policy\_name](#input\_aws\_load\_balancer\_controller\_policy\_name) | Custom name of the AWS Load Balancer Controller IAM policy | `string` | `null` | no |
| <a name="input_aws_load_balancer_controller_targetgroup_arns"></a> [aws\_load\_balancer\_controller\_targetgroup\_arns](#input\_aws\_load\_balancer\_controller\_targetgroup\_arns) | List of Target groups ARNs using Load Balancer Controller | `list(string)` | <pre>[<br>  "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"<br>]</pre> | no |
| <a name="input_aws_load_balancer_controller_targetgroup_only_policy_name"></a> [aws\_load\_balancer\_controller\_targetgroup\_only\_policy\_name](#input\_aws\_load\_balancer\_controller\_targetgroup\_only\_policy\_name) | Custom name of the AWS Load Balancer Controller IAM policy for the TargetGroupBinding only | `string` | `null` | no |
| <a name="input_aws_node_termination_handler_policy_name"></a> [aws\_node\_termination\_handler\_policy\_name](#input\_aws\_node\_termination\_handler\_policy\_name) | Custom name of the Node Termination Handler IAM policy | `string` | `null` | no |
| <a name="input_aws_nodetermination_handler_sqs_queue_arns"></a> [aws\_nodetermination\_handler\_sqs\_queue\_arns](#input\_aws\_nodetermination\_handler\_sqs\_queue\_arns) | List of SQS ARNs that contain node termination events | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_aws_privateca_issuer_acmca_arns"></a> [aws\_privateca\_issuer\_acmca\_arns](#input\_aws\_privateca\_issuer\_acmca\_arns) | List of ACM Private CA ARNs to issue certificates from | `list(string)` | <pre>[<br>  "arn:aws:acm-pca:*:*:certificate-authority/*"<br>]</pre> | no |
| <a name="input_aws_privateca_issuer_policy_name"></a> [aws\_privateca\_issuer\_policy\_name](#input\_aws\_privateca\_issuer\_policy\_name) | Custom name of the AWS Private CA Issuer IAM policy | `string` | `null` | no |
| <a name="input_aws_vpc_cni_enable_ipv4"></a> [aws\_vpc\_cni\_enable\_ipv4](#input\_aws\_vpc\_cni\_enable\_ipv4) | Determines whether to enable IPv4 permissions for VPC CNI policy | `bool` | `false` | no |
| <a name="input_aws_vpc_cni_enable_ipv6"></a> [aws\_vpc\_cni\_enable\_ipv6](#input\_aws\_vpc\_cni\_enable\_ipv6) | Determines whether to enable IPv6 permissions for VPC CNI policy | `bool` | `false` | no |
| <a name="input_aws_vpc_cni_policy_name"></a> [aws\_vpc\_cni\_policy\_name](#input\_aws\_vpc\_cni\_policy\_name) | Custom name of the VPC CNI IAM policy | `string` | `null` | no |
| <a name="input_cert_manager_hosted_zone_arns"></a> [cert\_manager\_hosted\_zone\_arns](#input\_cert\_manager\_hosted\_zone\_arns) | Route53 hosted zone ARNs to allow Cert manager to manage records | `list(string)` | <pre>[<br>  "arn:aws:route53:::hostedzone/*"<br>]</pre> | no |
| <a name="input_cert_manager_policy_name"></a> [cert\_manager\_policy\_name](#input\_cert\_manager\_policy\_name) | Custom name of the Cert Manager IAM policy | `string` | `null` | no |
| <a name="input_cluster_autoscaler_cluster_names"></a> [cluster\_autoscaler\_cluster\_names](#input\_cluster\_autoscaler\_cluster\_names) | List of cluster names to appropriately scope permissions within the Cluster Autoscaler IAM policy | `list(string)` | `[]` | no |
| <a name="input_cluster_autoscaler_policy_name"></a> [cluster\_autoscaler\_policy\_name](#input\_cluster\_autoscaler\_policy\_name) | Custom name of the Cluster Autoscaler IAM policy | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster | `string` | `""` | no |
| <a name="input_create"></a> [create](#input\_create) | Determines whether resources will be created (affects all resources) | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | IAM Role description | `string` | `null` | no |
| <a name="input_enable_irsa"></a> [enable\_irsa](#input\_enable\_irsa) | Determines whether to enable IAM Roles for Service Accounts (IRSA). One or more `oidc_providers` is required when `true` | `bool` | `false` | no |
| <a name="input_enable_pod_identity"></a> [enable\_pod\_identity](#input\_enable\_pod\_identity) | Determines whether to enable Pod Identity | `bool` | `true` | no |
| <a name="input_enable_role_self_assume"></a> [enable\_role\_self\_assume](#input\_enable\_role\_self\_assume) | Determines whether to allow the role to be [assume itself](https://aws.amazon.com/blogs/security/announcing-an-update-to-iam-role-trust-policy-behavior/) | `bool` | `false` | no |
| <a name="input_external_dns_hosted_zone_arns"></a> [external\_dns\_hosted\_zone\_arns](#input\_external\_dns\_hosted\_zone\_arns) | Route53 hosted zone ARNs to allow External DNS to manage records | `list(string)` | <pre>[<br>  "arn:aws:route53:::hostedzone/*"<br>]</pre> | no |
| <a name="input_external_dns_policy_name"></a> [external\_dns\_policy\_name](#input\_external\_dns\_policy\_name) | Custom name of the External DNS IAM policy | `string` | `null` | no |
| <a name="input_external_secrets_kms_key_arns"></a> [external\_secrets\_kms\_key\_arns](#input\_external\_secrets\_kms\_key\_arns) | List of KMS Key ARNs that are used by Secrets Manager that contain secrets to mount using External Secrets | `list(string)` | <pre>[<br>  "arn:aws:kms:*:*:key/*"<br>]</pre> | no |
| <a name="input_external_secrets_policy_name"></a> [external\_secrets\_policy\_name](#input\_external\_secrets\_policy\_name) | Custom name of the External Secrets IAM policy | `string` | `null` | no |
| <a name="input_external_secrets_secrets_manager_arns"></a> [external\_secrets\_secrets\_manager\_arns](#input\_external\_secrets\_secrets\_manager\_arns) | List of Secrets Manager ARNs that contain secrets to mount using External Secrets | `list(string)` | <pre>[<br>  "arn:aws:secretsmanager:*:*:secret:*"<br>]</pre> | no |
| <a name="input_external_secrets_secrets_manager_create_permission"></a> [external\_secrets\_secrets\_manager\_create\_permission](#input\_external\_secrets\_secrets\_manager\_create\_permission) | Determins whether External Secrets may use secretsmanager:CreateSecret | `bool` | `false` | no |
| <a name="input_external_secrets_ssm_parameter_arns"></a> [external\_secrets\_ssm\_parameter\_arns](#input\_external\_secrets\_ssm\_parameter\_arns) | List of Systems Manager Parameter ARNs that contain secrets to mount using External Secrets | `list(string)` | <pre>[<br>  "arn:aws:ssm:*:*:parameter/*"<br>]</pre> | no |
| <a name="input_karpenter_ami_ssm_parameter_arns"></a> [karpenter\_ami\_ssm\_parameter\_arns](#input\_karpenter\_ami\_ssm\_parameter\_arns) | List of SSM Parameter ARNs that contain AMI IDs launched by Karpenter | `list(string)` | <pre>[<br>  "arn:aws:ssm:*:*:parameter/aws/service/*"<br>]</pre> | no |
| <a name="input_karpenter_controller_policy_name"></a> [karpenter\_controller\_policy\_name](#input\_karpenter\_controller\_policy\_name) | Custom name of the Karpenter Controller IAM policy | `string` | `null` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum CLI/API session duration in seconds between 3600 and 43200 | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of IAM role | `string` | `null` | no |
| <a name="input_oidc_providers"></a> [oidc\_providers](#input\_oidc\_providers) | Map of OIDC providers where each provider map should contain the `provider`, `provider_arn`, and `namespace_service_accounts` | `any` | `{}` | no |
| <a name="input_override_policy_documents"></a> [override\_policy\_documents](#input\_override\_policy\_documents) | List of IAM policy documents that are merged together into the exported document | `list(string)` | `[]` | no |
| <a name="input_path"></a> [path](#input\_path) | Path of IAM role | `string` | `"/"` | no |
| <a name="input_permissions_boundary_arn"></a> [permissions\_boundary\_arn](#input\_permissions\_boundary\_arn) | Permissions boundary ARN to use for IAM role | `string` | `null` | no |
| <a name="input_policy_name_prefix"></a> [policy\_name\_prefix](#input\_policy\_name\_prefix) | IAM policy name prefix | `string` | `"AmazonEKS_"` | no |
| <a name="input_source_policy_documents"></a> [source\_policy\_documents](#input\_source\_policy\_documents) | List of IAM policy documents that are merged together into the exported document | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_use_name_prefix"></a> [use\_name\_prefix](#input\_use\_name\_prefix) | Determines whether the role name and policy name(s) are used as a prefix | `string` | `true` | no |
| <a name="input_velero_policy_name"></a> [velero\_policy\_name](#input\_velero\_policy\_name) | Custom name of the Velero IAM policy | `string` | `null` | no |
| <a name="input_velero_s3_bucket_arns"></a> [velero\_s3\_bucket\_arns](#input\_velero\_s3\_bucket\_arns) | List of S3 Bucket ARNs that Velero needs access to in order to backup and restore cluster resources | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | Name of IAM role |
| <a name="output_iam_role_path"></a> [iam\_role\_path](#output\_iam\_role\_path) | Path of IAM role |
| <a name="output_iam_role_unique_id"></a> [iam\_role\_unique\_id](#output\_iam\_role\_unique\_id) | Unique ID of IAM role |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

Apache-2.0 Licensed. See [LICENSE](https://github.com/clowdhaus/terraform-aws-eks-pod-identity/blob/main/LICENSE).
