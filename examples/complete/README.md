# Complete AWS EKS Pod Identity Example

Configuration in this directory creates various EKS Pod Identity roles with their respective IAM policy(s) attached.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which will incur monetary charges on your AWS bill. Run `terraform destroy` when you no longer need these resources.

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_amazon_managed_service_prometheus_pod_identity"></a> [amazon\_managed\_service\_prometheus\_pod\_identity](#module\_amazon\_managed\_service\_prometheus\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_appmesh_controller_pod_identity"></a> [aws\_appmesh\_controller\_pod\_identity](#module\_aws\_appmesh\_controller\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_appmesh_envoy_proxy_pod_identity"></a> [aws\_appmesh\_envoy\_proxy\_pod\_identity](#module\_aws\_appmesh\_envoy\_proxy\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_cloudwatch_observability_pod_identity"></a> [aws\_cloudwatch\_observability\_pod\_identity](#module\_aws\_cloudwatch\_observability\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_ebs_csi_pod_identity"></a> [aws\_ebs\_csi\_pod\_identity](#module\_aws\_ebs\_csi\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_efs_csi_pod_identity"></a> [aws\_efs\_csi\_pod\_identity](#module\_aws\_efs\_csi\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_fsx_lustre_csi_pod_identity"></a> [aws\_fsx\_lustre\_csi\_pod\_identity](#module\_aws\_fsx\_lustre\_csi\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_gateway_controller_pod_identity"></a> [aws\_gateway\_controller\_pod\_identity](#module\_aws\_gateway\_controller\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_lb_controller_pod_identity"></a> [aws\_lb\_controller\_pod\_identity](#module\_aws\_lb\_controller\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_lb_controller_targetgroup_binding_only_pod_identity"></a> [aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity](#module\_aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_node_termination_handler_pod_identity"></a> [aws\_node\_termination\_handler\_pod\_identity](#module\_aws\_node\_termination\_handler\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_privateca_issuer_pod_identity"></a> [aws\_privateca\_issuer\_pod\_identity](#module\_aws\_privateca\_issuer\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_vpc_cni_ipv4_pod_identity"></a> [aws\_vpc\_cni\_ipv4\_pod\_identity](#module\_aws\_vpc\_cni\_ipv4\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_vpc_cni_ipv6_pod_identity"></a> [aws\_vpc\_cni\_ipv6\_pod\_identity](#module\_aws\_vpc\_cni\_ipv6\_pod\_identity) | ../../ | n/a |
| <a name="module_cert_manager_pod_identity"></a> [cert\_manager\_pod\_identity](#module\_cert\_manager\_pod\_identity) | ../../ | n/a |
| <a name="module_cluster_autoscaler_pod_identity"></a> [cluster\_autoscaler\_pod\_identity](#module\_cluster\_autoscaler\_pod\_identity) | ../../ | n/a |
| <a name="module_custom_pod_identity"></a> [custom\_pod\_identity](#module\_custom\_pod\_identity) | ../../ | n/a |
| <a name="module_disabled"></a> [disabled](#module\_disabled) | ../../ | n/a |
| <a name="module_eks_one"></a> [eks\_one](#module\_eks\_one) | terraform-aws-modules/eks/aws | ~> 21.0 |
| <a name="module_eks_two"></a> [eks\_two](#module\_eks\_two) | terraform-aws-modules/eks/aws | ~> 21.0 |
| <a name="module_external_dns_pod_identity"></a> [external\_dns\_pod\_identity](#module\_external\_dns\_pod\_identity) | ../../ | n/a |
| <a name="module_external_secrets_pod_identity"></a> [external\_secrets\_pod\_identity](#module\_external\_secrets\_pod\_identity) | ../../ | n/a |
| <a name="module_mountpoint_s3_csi_pod_identity"></a> [mountpoint\_s3\_csi\_pod\_identity](#module\_mountpoint\_s3\_csi\_pod\_identity) | ../../ | n/a |
| <a name="module_pganalyze_pod_identity"></a> [pganalyze\_pod\_identity](#module\_pganalyze\_pod\_identity) | ../../ | n/a |
| <a name="module_velero_pod_identity"></a> [velero\_pod\_identity](#module\_velero\_pod\_identity) | ../../ | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_iam_policy_document.override](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_amazon_managed_service_prometheus_pod_identity_associations"></a> [amazon\_managed\_service\_prometheus\_pod\_identity\_associations](#output\_amazon\_managed\_service\_prometheus\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_amazon_managed_service_prometheus_pod_identity_iam_policy_arn"></a> [amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_policy\_arn](#output\_amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_amazon_managed_service_prometheus_pod_identity_iam_policy_id"></a> [amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_policy\_id](#output\_amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_amazon_managed_service_prometheus_pod_identity_iam_policy_name"></a> [amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_policy\_name](#output\_amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_amazon_managed_service_prometheus_pod_identity_iam_role_arn"></a> [amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_role\_arn](#output\_amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_amazon_managed_service_prometheus_pod_identity_iam_role_name"></a> [amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_role\_name](#output\_amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_amazon_managed_service_prometheus_pod_identity_iam_role_path"></a> [amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_role\_path](#output\_amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_amazon_managed_service_prometheus_pod_identity_iam_role_unique_id"></a> [amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_role\_unique\_id](#output\_amazon\_managed\_service\_prometheus\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_appmesh_controller_pod_identity_associations"></a> [aws\_appmesh\_controller\_pod\_identity\_associations](#output\_aws\_appmesh\_controller\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_appmesh_controller_pod_identity_iam_policy_arn"></a> [aws\_appmesh\_controller\_pod\_identity\_iam\_policy\_arn](#output\_aws\_appmesh\_controller\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_appmesh_controller_pod_identity_iam_policy_id"></a> [aws\_appmesh\_controller\_pod\_identity\_iam\_policy\_id](#output\_aws\_appmesh\_controller\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_appmesh_controller_pod_identity_iam_policy_name"></a> [aws\_appmesh\_controller\_pod\_identity\_iam\_policy\_name](#output\_aws\_appmesh\_controller\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_appmesh_controller_pod_identity_iam_role_arn"></a> [aws\_appmesh\_controller\_pod\_identity\_iam\_role\_arn](#output\_aws\_appmesh\_controller\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_appmesh_controller_pod_identity_iam_role_name"></a> [aws\_appmesh\_controller\_pod\_identity\_iam\_role\_name](#output\_aws\_appmesh\_controller\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_appmesh_controller_pod_identity_iam_role_path"></a> [aws\_appmesh\_controller\_pod\_identity\_iam\_role\_path](#output\_aws\_appmesh\_controller\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_appmesh_controller_pod_identity_iam_role_unique_id"></a> [aws\_appmesh\_controller\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_appmesh\_controller\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_appmesh_envoy_proxy_pod_identity_associations"></a> [aws\_appmesh\_envoy\_proxy\_pod\_identity\_associations](#output\_aws\_appmesh\_envoy\_proxy\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_appmesh_envoy_proxy_pod_identity_iam_policy_arn"></a> [aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_policy\_arn](#output\_aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_appmesh_envoy_proxy_pod_identity_iam_policy_id"></a> [aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_policy\_id](#output\_aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_appmesh_envoy_proxy_pod_identity_iam_policy_name"></a> [aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_policy\_name](#output\_aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_appmesh_envoy_proxy_pod_identity_iam_role_arn"></a> [aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_role\_arn](#output\_aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_appmesh_envoy_proxy_pod_identity_iam_role_name"></a> [aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_role\_name](#output\_aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_appmesh_envoy_proxy_pod_identity_iam_role_path"></a> [aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_role\_path](#output\_aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_appmesh_envoy_proxy_pod_identity_iam_role_unique_id"></a> [aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_appmesh\_envoy\_proxy\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_cloudwatch_observability_pod_identity_associations"></a> [aws\_cloudwatch\_observability\_pod\_identity\_associations](#output\_aws\_cloudwatch\_observability\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_cloudwatch_observability_pod_identity_iam_policy_arn"></a> [aws\_cloudwatch\_observability\_pod\_identity\_iam\_policy\_arn](#output\_aws\_cloudwatch\_observability\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_cloudwatch_observability_pod_identity_iam_policy_id"></a> [aws\_cloudwatch\_observability\_pod\_identity\_iam\_policy\_id](#output\_aws\_cloudwatch\_observability\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_cloudwatch_observability_pod_identity_iam_policy_name"></a> [aws\_cloudwatch\_observability\_pod\_identity\_iam\_policy\_name](#output\_aws\_cloudwatch\_observability\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_cloudwatch_observability_pod_identity_iam_role_arn"></a> [aws\_cloudwatch\_observability\_pod\_identity\_iam\_role\_arn](#output\_aws\_cloudwatch\_observability\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_cloudwatch_observability_pod_identity_iam_role_name"></a> [aws\_cloudwatch\_observability\_pod\_identity\_iam\_role\_name](#output\_aws\_cloudwatch\_observability\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_cloudwatch_observability_pod_identity_iam_role_path"></a> [aws\_cloudwatch\_observability\_pod\_identity\_iam\_role\_path](#output\_aws\_cloudwatch\_observability\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_cloudwatch_observability_pod_identity_iam_role_unique_id"></a> [aws\_cloudwatch\_observability\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_cloudwatch\_observability\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_ebs_csi_pod_identity_associations"></a> [aws\_ebs\_csi\_pod\_identity\_associations](#output\_aws\_ebs\_csi\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_ebs_csi_pod_identity_iam_policy_arn"></a> [aws\_ebs\_csi\_pod\_identity\_iam\_policy\_arn](#output\_aws\_ebs\_csi\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_ebs_csi_pod_identity_iam_policy_id"></a> [aws\_ebs\_csi\_pod\_identity\_iam\_policy\_id](#output\_aws\_ebs\_csi\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_ebs_csi_pod_identity_iam_policy_name"></a> [aws\_ebs\_csi\_pod\_identity\_iam\_policy\_name](#output\_aws\_ebs\_csi\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_ebs_csi_pod_identity_iam_role_arn"></a> [aws\_ebs\_csi\_pod\_identity\_iam\_role\_arn](#output\_aws\_ebs\_csi\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_ebs_csi_pod_identity_iam_role_name"></a> [aws\_ebs\_csi\_pod\_identity\_iam\_role\_name](#output\_aws\_ebs\_csi\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_ebs_csi_pod_identity_iam_role_path"></a> [aws\_ebs\_csi\_pod\_identity\_iam\_role\_path](#output\_aws\_ebs\_csi\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_ebs_csi_pod_identity_iam_role_unique_id"></a> [aws\_ebs\_csi\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_ebs\_csi\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_efs_csi_pod_identity_associations"></a> [aws\_efs\_csi\_pod\_identity\_associations](#output\_aws\_efs\_csi\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_efs_csi_pod_identity_iam_policy_arn"></a> [aws\_efs\_csi\_pod\_identity\_iam\_policy\_arn](#output\_aws\_efs\_csi\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_efs_csi_pod_identity_iam_policy_id"></a> [aws\_efs\_csi\_pod\_identity\_iam\_policy\_id](#output\_aws\_efs\_csi\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_efs_csi_pod_identity_iam_policy_name"></a> [aws\_efs\_csi\_pod\_identity\_iam\_policy\_name](#output\_aws\_efs\_csi\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_efs_csi_pod_identity_iam_role_arn"></a> [aws\_efs\_csi\_pod\_identity\_iam\_role\_arn](#output\_aws\_efs\_csi\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_efs_csi_pod_identity_iam_role_name"></a> [aws\_efs\_csi\_pod\_identity\_iam\_role\_name](#output\_aws\_efs\_csi\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_efs_csi_pod_identity_iam_role_path"></a> [aws\_efs\_csi\_pod\_identity\_iam\_role\_path](#output\_aws\_efs\_csi\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_efs_csi_pod_identity_iam_role_unique_id"></a> [aws\_efs\_csi\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_efs\_csi\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_fsx_lustre_csi_pod_identity_associations"></a> [aws\_fsx\_lustre\_csi\_pod\_identity\_associations](#output\_aws\_fsx\_lustre\_csi\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_fsx_lustre_csi_pod_identity_iam_policy_arn"></a> [aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_policy\_arn](#output\_aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_fsx_lustre_csi_pod_identity_iam_policy_id"></a> [aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_policy\_id](#output\_aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_fsx_lustre_csi_pod_identity_iam_policy_name"></a> [aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_policy\_name](#output\_aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_fsx_lustre_csi_pod_identity_iam_role_arn"></a> [aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_role\_arn](#output\_aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_fsx_lustre_csi_pod_identity_iam_role_name"></a> [aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_role\_name](#output\_aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_fsx_lustre_csi_pod_identity_iam_role_path"></a> [aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_role\_path](#output\_aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_fsx_lustre_csi_pod_identity_iam_role_unique_id"></a> [aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_fsx\_lustre\_csi\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_gateway_controller_pod_identity_associations"></a> [aws\_gateway\_controller\_pod\_identity\_associations](#output\_aws\_gateway\_controller\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_gateway_controller_pod_identity_iam_policy_arn"></a> [aws\_gateway\_controller\_pod\_identity\_iam\_policy\_arn](#output\_aws\_gateway\_controller\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_gateway_controller_pod_identity_iam_policy_id"></a> [aws\_gateway\_controller\_pod\_identity\_iam\_policy\_id](#output\_aws\_gateway\_controller\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_gateway_controller_pod_identity_iam_policy_name"></a> [aws\_gateway\_controller\_pod\_identity\_iam\_policy\_name](#output\_aws\_gateway\_controller\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_gateway_controller_pod_identity_iam_role_arn"></a> [aws\_gateway\_controller\_pod\_identity\_iam\_role\_arn](#output\_aws\_gateway\_controller\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_gateway_controller_pod_identity_iam_role_name"></a> [aws\_gateway\_controller\_pod\_identity\_iam\_role\_name](#output\_aws\_gateway\_controller\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_gateway_controller_pod_identity_iam_role_path"></a> [aws\_gateway\_controller\_pod\_identity\_iam\_role\_path](#output\_aws\_gateway\_controller\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_gateway_controller_pod_identity_iam_role_unique_id"></a> [aws\_gateway\_controller\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_gateway\_controller\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_lb_controller_pod_identity_associations"></a> [aws\_lb\_controller\_pod\_identity\_associations](#output\_aws\_lb\_controller\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_lb_controller_pod_identity_iam_policy_arn"></a> [aws\_lb\_controller\_pod\_identity\_iam\_policy\_arn](#output\_aws\_lb\_controller\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_lb_controller_pod_identity_iam_policy_id"></a> [aws\_lb\_controller\_pod\_identity\_iam\_policy\_id](#output\_aws\_lb\_controller\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_lb_controller_pod_identity_iam_policy_name"></a> [aws\_lb\_controller\_pod\_identity\_iam\_policy\_name](#output\_aws\_lb\_controller\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_lb_controller_pod_identity_iam_role_arn"></a> [aws\_lb\_controller\_pod\_identity\_iam\_role\_arn](#output\_aws\_lb\_controller\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_lb_controller_pod_identity_iam_role_name"></a> [aws\_lb\_controller\_pod\_identity\_iam\_role\_name](#output\_aws\_lb\_controller\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_lb_controller_pod_identity_iam_role_path"></a> [aws\_lb\_controller\_pod\_identity\_iam\_role\_path](#output\_aws\_lb\_controller\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_lb_controller_pod_identity_iam_role_unique_id"></a> [aws\_lb\_controller\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_lb\_controller\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_lb_controller_targetgroup_binding_only_pod_identity_associations"></a> [aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_associations](#output\_aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_lb_controller_targetgroup_binding_only_pod_identity_iam_policy_arn"></a> [aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_policy\_arn](#output\_aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_lb_controller_targetgroup_binding_only_pod_identity_iam_policy_id"></a> [aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_policy\_id](#output\_aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_lb_controller_targetgroup_binding_only_pod_identity_iam_policy_name"></a> [aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_policy\_name](#output\_aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_lb_controller_targetgroup_binding_only_pod_identity_iam_role_arn"></a> [aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_role\_arn](#output\_aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_lb_controller_targetgroup_binding_only_pod_identity_iam_role_name"></a> [aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_role\_name](#output\_aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_lb_controller_targetgroup_binding_only_pod_identity_iam_role_path"></a> [aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_role\_path](#output\_aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_lb_controller_targetgroup_binding_only_pod_identity_iam_role_unique_id"></a> [aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_lb\_controller\_targetgroup\_binding\_only\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_node_termination_handler_pod_identity_associations"></a> [aws\_node\_termination\_handler\_pod\_identity\_associations](#output\_aws\_node\_termination\_handler\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_node_termination_handler_pod_identity_iam_policy_arn"></a> [aws\_node\_termination\_handler\_pod\_identity\_iam\_policy\_arn](#output\_aws\_node\_termination\_handler\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_node_termination_handler_pod_identity_iam_policy_id"></a> [aws\_node\_termination\_handler\_pod\_identity\_iam\_policy\_id](#output\_aws\_node\_termination\_handler\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_node_termination_handler_pod_identity_iam_policy_name"></a> [aws\_node\_termination\_handler\_pod\_identity\_iam\_policy\_name](#output\_aws\_node\_termination\_handler\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_node_termination_handler_pod_identity_iam_role_arn"></a> [aws\_node\_termination\_handler\_pod\_identity\_iam\_role\_arn](#output\_aws\_node\_termination\_handler\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_node_termination_handler_pod_identity_iam_role_name"></a> [aws\_node\_termination\_handler\_pod\_identity\_iam\_role\_name](#output\_aws\_node\_termination\_handler\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_node_termination_handler_pod_identity_iam_role_path"></a> [aws\_node\_termination\_handler\_pod\_identity\_iam\_role\_path](#output\_aws\_node\_termination\_handler\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_node_termination_handler_pod_identity_iam_role_unique_id"></a> [aws\_node\_termination\_handler\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_node\_termination\_handler\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_privateca_issuer_pod_identity_associations"></a> [aws\_privateca\_issuer\_pod\_identity\_associations](#output\_aws\_privateca\_issuer\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_privateca_issuer_pod_identity_iam_policy_arn"></a> [aws\_privateca\_issuer\_pod\_identity\_iam\_policy\_arn](#output\_aws\_privateca\_issuer\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_privateca_issuer_pod_identity_iam_policy_id"></a> [aws\_privateca\_issuer\_pod\_identity\_iam\_policy\_id](#output\_aws\_privateca\_issuer\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_privateca_issuer_pod_identity_iam_policy_name"></a> [aws\_privateca\_issuer\_pod\_identity\_iam\_policy\_name](#output\_aws\_privateca\_issuer\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_privateca_issuer_pod_identity_iam_role_arn"></a> [aws\_privateca\_issuer\_pod\_identity\_iam\_role\_arn](#output\_aws\_privateca\_issuer\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_privateca_issuer_pod_identity_iam_role_name"></a> [aws\_privateca\_issuer\_pod\_identity\_iam\_role\_name](#output\_aws\_privateca\_issuer\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_privateca_issuer_pod_identity_iam_role_path"></a> [aws\_privateca\_issuer\_pod\_identity\_iam\_role\_path](#output\_aws\_privateca\_issuer\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_privateca_issuer_pod_identity_iam_role_unique_id"></a> [aws\_privateca\_issuer\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_privateca\_issuer\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_vpc_cni_ipv4_pod_identity_associations"></a> [aws\_vpc\_cni\_ipv4\_pod\_identity\_associations](#output\_aws\_vpc\_cni\_ipv4\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_vpc_cni_ipv4_pod_identity_iam_policy_arn"></a> [aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_policy\_arn](#output\_aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_vpc_cni_ipv4_pod_identity_iam_policy_id"></a> [aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_policy\_id](#output\_aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_vpc_cni_ipv4_pod_identity_iam_policy_name"></a> [aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_policy\_name](#output\_aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_vpc_cni_ipv4_pod_identity_iam_role_arn"></a> [aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_role\_arn](#output\_aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_vpc_cni_ipv4_pod_identity_iam_role_name"></a> [aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_role\_name](#output\_aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_vpc_cni_ipv4_pod_identity_iam_role_path"></a> [aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_role\_path](#output\_aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_vpc_cni_ipv4_pod_identity_iam_role_unique_id"></a> [aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_vpc\_cni\_ipv4\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_aws_vpc_cni_ipv6_pod_identity_associations"></a> [aws\_vpc\_cni\_ipv6\_pod\_identity\_associations](#output\_aws\_vpc\_cni\_ipv6\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_aws_vpc_cni_ipv6_pod_identity_iam_policy_arn"></a> [aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_policy\_arn](#output\_aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_aws_vpc_cni_ipv6_pod_identity_iam_policy_id"></a> [aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_policy\_id](#output\_aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_aws_vpc_cni_ipv6_pod_identity_iam_policy_name"></a> [aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_policy\_name](#output\_aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_aws_vpc_cni_ipv6_pod_identity_iam_role_arn"></a> [aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_role\_arn](#output\_aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_aws_vpc_cni_ipv6_pod_identity_iam_role_name"></a> [aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_role\_name](#output\_aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_aws_vpc_cni_ipv6_pod_identity_iam_role_path"></a> [aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_role\_path](#output\_aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_aws_vpc_cni_ipv6_pod_identity_iam_role_unique_id"></a> [aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_role\_unique\_id](#output\_aws\_vpc\_cni\_ipv6\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_cert_manager_pod_identity_associations"></a> [cert\_manager\_pod\_identity\_associations](#output\_cert\_manager\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_cert_manager_pod_identity_iam_policy_arn"></a> [cert\_manager\_pod\_identity\_iam\_policy\_arn](#output\_cert\_manager\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_cert_manager_pod_identity_iam_policy_id"></a> [cert\_manager\_pod\_identity\_iam\_policy\_id](#output\_cert\_manager\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_cert_manager_pod_identity_iam_policy_name"></a> [cert\_manager\_pod\_identity\_iam\_policy\_name](#output\_cert\_manager\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_cert_manager_pod_identity_iam_role_arn"></a> [cert\_manager\_pod\_identity\_iam\_role\_arn](#output\_cert\_manager\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_cert_manager_pod_identity_iam_role_name"></a> [cert\_manager\_pod\_identity\_iam\_role\_name](#output\_cert\_manager\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_cert_manager_pod_identity_iam_role_path"></a> [cert\_manager\_pod\_identity\_iam\_role\_path](#output\_cert\_manager\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_cert_manager_pod_identity_iam_role_unique_id"></a> [cert\_manager\_pod\_identity\_iam\_role\_unique\_id](#output\_cert\_manager\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_cluster_autoscaler_pod_identity_associations"></a> [cluster\_autoscaler\_pod\_identity\_associations](#output\_cluster\_autoscaler\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_cluster_autoscaler_pod_identity_iam_policy_arn"></a> [cluster\_autoscaler\_pod\_identity\_iam\_policy\_arn](#output\_cluster\_autoscaler\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_cluster_autoscaler_pod_identity_iam_policy_id"></a> [cluster\_autoscaler\_pod\_identity\_iam\_policy\_id](#output\_cluster\_autoscaler\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_cluster_autoscaler_pod_identity_iam_policy_name"></a> [cluster\_autoscaler\_pod\_identity\_iam\_policy\_name](#output\_cluster\_autoscaler\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_cluster_autoscaler_pod_identity_iam_role_arn"></a> [cluster\_autoscaler\_pod\_identity\_iam\_role\_arn](#output\_cluster\_autoscaler\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_cluster_autoscaler_pod_identity_iam_role_name"></a> [cluster\_autoscaler\_pod\_identity\_iam\_role\_name](#output\_cluster\_autoscaler\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_cluster_autoscaler_pod_identity_iam_role_path"></a> [cluster\_autoscaler\_pod\_identity\_iam\_role\_path](#output\_cluster\_autoscaler\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_cluster_autoscaler_pod_identity_iam_role_unique_id"></a> [cluster\_autoscaler\_pod\_identity\_iam\_role\_unique\_id](#output\_cluster\_autoscaler\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_custom_pod_identity_associations"></a> [custom\_pod\_identity\_associations](#output\_custom\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_custom_pod_identity_iam_policy_arn"></a> [custom\_pod\_identity\_iam\_policy\_arn](#output\_custom\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_custom_pod_identity_iam_policy_id"></a> [custom\_pod\_identity\_iam\_policy\_id](#output\_custom\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_custom_pod_identity_iam_policy_name"></a> [custom\_pod\_identity\_iam\_policy\_name](#output\_custom\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_custom_pod_identity_iam_role_arn"></a> [custom\_pod\_identity\_iam\_role\_arn](#output\_custom\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_custom_pod_identity_iam_role_name"></a> [custom\_pod\_identity\_iam\_role\_name](#output\_custom\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_custom_pod_identity_iam_role_path"></a> [custom\_pod\_identity\_iam\_role\_path](#output\_custom\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_custom_pod_identity_iam_role_unique_id"></a> [custom\_pod\_identity\_iam\_role\_unique\_id](#output\_custom\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_external_dns_pod_identity_associations"></a> [external\_dns\_pod\_identity\_associations](#output\_external\_dns\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_external_dns_pod_identity_iam_policy_arn"></a> [external\_dns\_pod\_identity\_iam\_policy\_arn](#output\_external\_dns\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_external_dns_pod_identity_iam_policy_id"></a> [external\_dns\_pod\_identity\_iam\_policy\_id](#output\_external\_dns\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_external_dns_pod_identity_iam_policy_name"></a> [external\_dns\_pod\_identity\_iam\_policy\_name](#output\_external\_dns\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_external_dns_pod_identity_iam_role_arn"></a> [external\_dns\_pod\_identity\_iam\_role\_arn](#output\_external\_dns\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_external_dns_pod_identity_iam_role_name"></a> [external\_dns\_pod\_identity\_iam\_role\_name](#output\_external\_dns\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_external_dns_pod_identity_iam_role_path"></a> [external\_dns\_pod\_identity\_iam\_role\_path](#output\_external\_dns\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_external_dns_pod_identity_iam_role_unique_id"></a> [external\_dns\_pod\_identity\_iam\_role\_unique\_id](#output\_external\_dns\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_external_secrets_pod_identity_associations"></a> [external\_secrets\_pod\_identity\_associations](#output\_external\_secrets\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_external_secrets_pod_identity_iam_policy_arn"></a> [external\_secrets\_pod\_identity\_iam\_policy\_arn](#output\_external\_secrets\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_external_secrets_pod_identity_iam_policy_id"></a> [external\_secrets\_pod\_identity\_iam\_policy\_id](#output\_external\_secrets\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_external_secrets_pod_identity_iam_policy_name"></a> [external\_secrets\_pod\_identity\_iam\_policy\_name](#output\_external\_secrets\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_external_secrets_pod_identity_iam_role_arn"></a> [external\_secrets\_pod\_identity\_iam\_role\_arn](#output\_external\_secrets\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_external_secrets_pod_identity_iam_role_name"></a> [external\_secrets\_pod\_identity\_iam\_role\_name](#output\_external\_secrets\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_external_secrets_pod_identity_iam_role_path"></a> [external\_secrets\_pod\_identity\_iam\_role\_path](#output\_external\_secrets\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_external_secrets_pod_identity_iam_role_unique_id"></a> [external\_secrets\_pod\_identity\_iam\_role\_unique\_id](#output\_external\_secrets\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_mountpoint_s3_csi_pod_identity_associations"></a> [mountpoint\_s3\_csi\_pod\_identity\_associations](#output\_mountpoint\_s3\_csi\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_mountpoint_s3_csi_pod_identity_iam_policy_arn"></a> [mountpoint\_s3\_csi\_pod\_identity\_iam\_policy\_arn](#output\_mountpoint\_s3\_csi\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_mountpoint_s3_csi_pod_identity_iam_policy_id"></a> [mountpoint\_s3\_csi\_pod\_identity\_iam\_policy\_id](#output\_mountpoint\_s3\_csi\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_mountpoint_s3_csi_pod_identity_iam_policy_name"></a> [mountpoint\_s3\_csi\_pod\_identity\_iam\_policy\_name](#output\_mountpoint\_s3\_csi\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_mountpoint_s3_csi_pod_identity_iam_role_arn"></a> [mountpoint\_s3\_csi\_pod\_identity\_iam\_role\_arn](#output\_mountpoint\_s3\_csi\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_mountpoint_s3_csi_pod_identity_iam_role_name"></a> [mountpoint\_s3\_csi\_pod\_identity\_iam\_role\_name](#output\_mountpoint\_s3\_csi\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_mountpoint_s3_csi_pod_identity_iam_role_path"></a> [mountpoint\_s3\_csi\_pod\_identity\_iam\_role\_path](#output\_mountpoint\_s3\_csi\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_mountpoint_s3_csi_pod_identity_iam_role_unique_id"></a> [mountpoint\_s3\_csi\_pod\_identity\_iam\_role\_unique\_id](#output\_mountpoint\_s3\_csi\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
| <a name="output_velero_pod_identity_associations"></a> [velero\_pod\_identity\_associations](#output\_velero\_pod\_identity\_associations) | Map of Pod Identity associations created |
| <a name="output_velero_pod_identity_iam_policy_arn"></a> [velero\_pod\_identity\_iam\_policy\_arn](#output\_velero\_pod\_identity\_iam\_policy\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_velero_pod_identity_iam_policy_id"></a> [velero\_pod\_identity\_iam\_policy\_id](#output\_velero\_pod\_identity\_iam\_policy\_id) | ID of IAM policy |
| <a name="output_velero_pod_identity_iam_policy_name"></a> [velero\_pod\_identity\_iam\_policy\_name](#output\_velero\_pod\_identity\_iam\_policy\_name) | Name of IAM policy |
| <a name="output_velero_pod_identity_iam_role_arn"></a> [velero\_pod\_identity\_iam\_role\_arn](#output\_velero\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_velero_pod_identity_iam_role_name"></a> [velero\_pod\_identity\_iam\_role\_name](#output\_velero\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_velero_pod_identity_iam_role_path"></a> [velero\_pod\_identity\_iam\_role\_path](#output\_velero\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_velero_pod_identity_iam_role_unique_id"></a> [velero\_pod\_identity\_iam\_role\_unique\_id](#output\_velero\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
<!-- END_TF_DOCS -->

Apache-2.0 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/blob/master/LICENSE).
