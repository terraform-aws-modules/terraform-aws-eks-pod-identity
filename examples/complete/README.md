# Complete AWS Eks Pod Identity Example

Configuration in this directory creates various EKS Pod Identity roles with their respective IAM policy(s) attached.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which will incur monetary charges on your AWS bill. Run `terraform destroy` when you no longer need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.30 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.30 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_amazon_managed_service_prometheus_pod_identity"></a> [amazon\_managed\_service\_prometheus\_pod\_identity](#module\_amazon\_managed\_service\_prometheus\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_appmesh_controller_pod_identity"></a> [aws\_appmesh\_controller\_pod\_identity](#module\_aws\_appmesh\_controller\_pod\_identity) | ../../ | n/a |
| <a name="module_aws_appmesh_envoy_proxy_pod_identity"></a> [aws\_appmesh\_envoy\_proxy\_pod\_identity](#module\_aws\_appmesh\_envoy\_proxy\_pod\_identity) | ../../ | n/a |
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
| <a name="module_external_dns_pod_identity"></a> [external\_dns\_pod\_identity](#module\_external\_dns\_pod\_identity) | ../../ | n/a |
| <a name="module_external_secrets_pod_identity"></a> [external\_secrets\_pod\_identity](#module\_external\_secrets\_pod\_identity) | ../../ | n/a |
| <a name="module_velero_pod_identity"></a> [velero\_pod\_identity](#module\_velero\_pod\_identity) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_document.override](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_pod_identity_iam_role_arn"></a> [custom\_pod\_identity\_iam\_role\_arn](#output\_custom\_pod\_identity\_iam\_role\_arn) | ARN of IAM role |
| <a name="output_custom_pod_identity_iam_role_name"></a> [custom\_pod\_identity\_iam\_role\_name](#output\_custom\_pod\_identity\_iam\_role\_name) | Name of IAM role |
| <a name="output_custom_pod_identity_iam_role_path"></a> [custom\_pod\_identity\_iam\_role\_path](#output\_custom\_pod\_identity\_iam\_role\_path) | Path of IAM role |
| <a name="output_custom_pod_identity_iam_role_unique_id"></a> [custom\_pod\_identity\_iam\_role\_unique\_id](#output\_custom\_pod\_identity\_iam\_role\_unique\_id) | Unique ID of IAM role |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Apache-2.0 Licensed. See [LICENSE](https://github.com/clowdhaus/terraform-aws-eks-pod-identity/blob/main/LICENSE).
