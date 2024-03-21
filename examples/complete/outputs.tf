################################################################################
# Custom Pod Identity
################################################################################

output "custom_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.custom_pod_identity.iam_role_arn
}

output "custom_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.custom_pod_identity.iam_role_name
}

output "custom_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.custom_pod_identity.iam_role_path
}

output "custom_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.custom_pod_identity.iam_role_unique_id
}

output "custom_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.custom_pod_identity.iam_policy_arn
}

output "custom_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.custom_pod_identity.iam_policy_name
}

output "custom_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.custom_pod_identity.iam_policy_id
}

output "custom_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.custom_pod_identity.associations
}

################################################################################
# AWS Gateway Controller
################################################################################

output "aws_gateway_controller_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_gateway_controller_pod_identity.iam_role_arn
}

output "aws_gateway_controller_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_gateway_controller_pod_identity.iam_role_name
}

output "aws_gateway_controller_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_gateway_controller_pod_identity.iam_role_path
}

output "aws_gateway_controller_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_gateway_controller_pod_identity.iam_role_unique_id
}

output "aws_gateway_controller_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_gateway_controller_pod_identity.iam_policy_arn
}

output "aws_gateway_controller_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_gateway_controller_pod_identity.iam_policy_name
}

output "aws_gateway_controller_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_gateway_controller_pod_identity.iam_policy_id
}

output "aws_gateway_controller_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_gateway_controller_pod_identity.associations
}

################################################################################
# Cert-Manager
################################################################################

output "cert_manager_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.cert_manager_pod_identity.iam_role_arn
}

output "cert_manager_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.cert_manager_pod_identity.iam_role_name
}

output "cert_manager_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.cert_manager_pod_identity.iam_role_path
}

output "cert_manager_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.cert_manager_pod_identity.iam_role_unique_id
}

output "cert_manager_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.cert_manager_pod_identity.iam_policy_arn
}

output "cert_manager_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.cert_manager_pod_identity.iam_policy_name
}

output "cert_manager_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.cert_manager_pod_identity.iam_policy_id
}

output "cert_manager_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.cert_manager_pod_identity.associations
}

################################################################################
# AWS CloudWatch Observability
################################################################################

output "aws_cloudwatch_observability_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_cloudwatch_observability_pod_identity.iam_role_arn
}

output "aws_cloudwatch_observability_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_cloudwatch_observability_pod_identity.iam_role_name
}

output "aws_cloudwatch_observability_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_cloudwatch_observability_pod_identity.iam_role_path
}

output "aws_cloudwatch_observability_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_cloudwatch_observability_pod_identity.iam_role_unique_id
}

output "aws_cloudwatch_observability_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_cloudwatch_observability_pod_identity.iam_policy_arn
}

output "aws_cloudwatch_observability_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_cloudwatch_observability_pod_identity.iam_policy_name
}

output "aws_cloudwatch_observability_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_cloudwatch_observability_pod_identity.iam_policy_id
}

output "aws_cloudwatch_observability_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_cloudwatch_observability_pod_identity.associations
}

################################################################################
# Cluster Autoscaler
################################################################################

output "cluster_autoscaler_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.cluster_autoscaler_pod_identity.iam_role_arn
}

output "cluster_autoscaler_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.cluster_autoscaler_pod_identity.iam_role_name
}

output "cluster_autoscaler_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.cluster_autoscaler_pod_identity.iam_role_path
}

output "cluster_autoscaler_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.cluster_autoscaler_pod_identity.iam_role_unique_id
}

output "cluster_autoscaler_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.cluster_autoscaler_pod_identity.iam_policy_arn
}

output "cluster_autoscaler_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.cluster_autoscaler_pod_identity.iam_policy_name
}

output "cluster_autoscaler_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.cluster_autoscaler_pod_identity.iam_policy_id
}

output "cluster_autoscaler_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.cluster_autoscaler_pod_identity.associations
}

################################################################################
# AWS EBS CSI Driver
################################################################################

output "aws_ebs_csi_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_ebs_csi_pod_identity.iam_role_arn
}

output "aws_ebs_csi_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_ebs_csi_pod_identity.iam_role_name
}

output "aws_ebs_csi_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_ebs_csi_pod_identity.iam_role_path
}

output "aws_ebs_csi_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_ebs_csi_pod_identity.iam_role_unique_id
}

output "aws_ebs_csi_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_ebs_csi_pod_identity.iam_policy_arn
}

output "aws_ebs_csi_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_ebs_csi_pod_identity.iam_policy_name
}

output "aws_ebs_csi_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_ebs_csi_pod_identity.iam_policy_id
}

output "aws_ebs_csi_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_ebs_csi_pod_identity.associations
}

################################################################################
# AWS EFS CSI Driver
################################################################################

output "aws_efs_csi_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_efs_csi_pod_identity.iam_role_arn
}

output "aws_efs_csi_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_efs_csi_pod_identity.iam_role_name
}

output "aws_efs_csi_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_efs_csi_pod_identity.iam_role_path
}

output "aws_efs_csi_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_efs_csi_pod_identity.iam_role_unique_id
}

output "aws_efs_csi_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_efs_csi_pod_identity.iam_policy_arn
}

output "aws_efs_csi_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_efs_csi_pod_identity.iam_policy_name
}

output "aws_efs_csi_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_efs_csi_pod_identity.iam_policy_id
}

output "aws_efs_csi_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_efs_csi_pod_identity.associations
}

################################################################################
# External-DNS
################################################################################

output "external_dns_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.external_dns_pod_identity.iam_role_arn
}

output "external_dns_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.external_dns_pod_identity.iam_role_name
}

output "external_dns_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.external_dns_pod_identity.iam_role_path
}

output "external_dns_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.external_dns_pod_identity.iam_role_unique_id
}

output "external_dns_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.external_dns_pod_identity.iam_policy_arn
}

output "external_dns_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.external_dns_pod_identity.iam_policy_name
}

output "external_dns_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.external_dns_pod_identity.iam_policy_id
}

output "external_dns_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.external_dns_pod_identity.associations
}

################################################################################
# External Secrets
################################################################################

output "external_secrets_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.external_secrets_pod_identity.iam_role_arn
}

output "external_secrets_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.external_secrets_pod_identity.iam_role_name
}

output "external_secrets_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.external_secrets_pod_identity.iam_role_path
}

output "external_secrets_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.external_secrets_pod_identity.iam_role_unique_id
}

output "external_secrets_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.external_secrets_pod_identity.iam_policy_arn
}

output "external_secrets_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.external_secrets_pod_identity.iam_policy_name
}

output "external_secrets_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.external_secrets_pod_identity.iam_policy_id
}

output "external_secrets_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.external_secrets_pod_identity.associations
}

################################################################################
# AWS FSx for Lustre CSI Driver
################################################################################

output "aws_fsx_lustre_csi_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_fsx_lustre_csi_pod_identity.iam_role_arn
}

output "aws_fsx_lustre_csi_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_fsx_lustre_csi_pod_identity.iam_role_name
}

output "aws_fsx_lustre_csi_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_fsx_lustre_csi_pod_identity.iam_role_path
}

output "aws_fsx_lustre_csi_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_fsx_lustre_csi_pod_identity.iam_role_unique_id
}

output "aws_fsx_lustre_csi_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_fsx_lustre_csi_pod_identity.iam_policy_arn
}

output "aws_fsx_lustre_csi_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_fsx_lustre_csi_pod_identity.iam_policy_name
}

output "aws_fsx_lustre_csi_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_fsx_lustre_csi_pod_identity.iam_policy_id
}

output "aws_fsx_lustre_csi_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_fsx_lustre_csi_pod_identity.associations
}

################################################################################
# AWS Load Balancer Controller
################################################################################

output "aws_lb_controller_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_lb_controller_pod_identity.iam_role_arn
}

output "aws_lb_controller_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_lb_controller_pod_identity.iam_role_name
}

output "aws_lb_controller_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_lb_controller_pod_identity.iam_role_path
}

output "aws_lb_controller_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_lb_controller_pod_identity.iam_role_unique_id
}

output "aws_lb_controller_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_lb_controller_pod_identity.iam_policy_arn
}

output "aws_lb_controller_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_lb_controller_pod_identity.iam_policy_name
}

output "aws_lb_controller_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_lb_controller_pod_identity.iam_policy_id
}

output "aws_lb_controller_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_lb_controller_pod_identity.associations
}

################################################################################
# AWS Load Balancer Controller TargetGroup Binding Only
################################################################################

output "aws_lb_controller_targetgroup_binding_only_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_lb_controller_targetgroup_binding_only_pod_identity.iam_role_arn
}

output "aws_lb_controller_targetgroup_binding_only_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_lb_controller_targetgroup_binding_only_pod_identity.iam_role_name
}

output "aws_lb_controller_targetgroup_binding_only_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_lb_controller_targetgroup_binding_only_pod_identity.iam_role_path
}

output "aws_lb_controller_targetgroup_binding_only_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_lb_controller_targetgroup_binding_only_pod_identity.iam_role_unique_id
}

output "aws_lb_controller_targetgroup_binding_only_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_lb_controller_targetgroup_binding_only_pod_identity.iam_policy_arn
}

output "aws_lb_controller_targetgroup_binding_only_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_lb_controller_targetgroup_binding_only_pod_identity.iam_policy_name
}

output "aws_lb_controller_targetgroup_binding_only_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_lb_controller_targetgroup_binding_only_pod_identity.iam_policy_id
}

output "aws_lb_controller_targetgroup_binding_only_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_lb_controller_targetgroup_binding_only_pod_identity.associations
}

################################################################################
# AWS AppMesh Controller
################################################################################

output "aws_appmesh_controller_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_appmesh_controller_pod_identity.iam_role_arn
}

output "aws_appmesh_controller_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_appmesh_controller_pod_identity.iam_role_name
}

output "aws_appmesh_controller_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_appmesh_controller_pod_identity.iam_role_path
}

output "aws_appmesh_controller_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_appmesh_controller_pod_identity.iam_role_unique_id
}

output "aws_appmesh_controller_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_appmesh_controller_pod_identity.iam_policy_arn
}

output "aws_appmesh_controller_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_appmesh_controller_pod_identity.iam_policy_name
}

output "aws_appmesh_controller_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_appmesh_controller_pod_identity.iam_policy_id
}

output "aws_appmesh_controller_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_appmesh_controller_pod_identity.associations
}

################################################################################
# AWS AppMesh Envoy Proxy
################################################################################

output "aws_appmesh_envoy_proxy_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_appmesh_envoy_proxy_pod_identity.iam_role_arn
}

output "aws_appmesh_envoy_proxy_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_appmesh_envoy_proxy_pod_identity.iam_role_name
}

output "aws_appmesh_envoy_proxy_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_appmesh_envoy_proxy_pod_identity.iam_role_path
}

output "aws_appmesh_envoy_proxy_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_appmesh_envoy_proxy_pod_identity.iam_role_unique_id
}

output "aws_appmesh_envoy_proxy_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_appmesh_envoy_proxy_pod_identity.iam_policy_arn
}

output "aws_appmesh_envoy_proxy_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_appmesh_envoy_proxy_pod_identity.iam_policy_name
}

output "aws_appmesh_envoy_proxy_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_appmesh_envoy_proxy_pod_identity.iam_policy_id
}

output "aws_appmesh_envoy_proxy_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_appmesh_envoy_proxy_pod_identity.associations
}

################################################################################
# Amazon Managed Service for Prometheus
################################################################################

output "amazon_managed_service_prometheus_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.amazon_managed_service_prometheus_pod_identity.iam_role_arn
}

output "amazon_managed_service_prometheus_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.amazon_managed_service_prometheus_pod_identity.iam_role_name
}

output "amazon_managed_service_prometheus_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.amazon_managed_service_prometheus_pod_identity.iam_role_path
}

output "amazon_managed_service_prometheus_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.amazon_managed_service_prometheus_pod_identity.iam_role_unique_id
}

output "amazon_managed_service_prometheus_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.amazon_managed_service_prometheus_pod_identity.iam_policy_arn
}

output "amazon_managed_service_prometheus_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.amazon_managed_service_prometheus_pod_identity.iam_policy_name
}

output "amazon_managed_service_prometheus_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.amazon_managed_service_prometheus_pod_identity.iam_policy_id
}

output "amazon_managed_service_prometheus_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.amazon_managed_service_prometheus_pod_identity.associations
}

################################################################################
# Mountpoint S3 CSI Driver
################################################################################

output "mountpoint_s3_csi_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.mountpoint_s3_csi_pod_identity.iam_role_arn
}

output "mountpoint_s3_csi_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.mountpoint_s3_csi_pod_identity.iam_role_name
}

output "mountpoint_s3_csi_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.mountpoint_s3_csi_pod_identity.iam_role_path
}

output "mountpoint_s3_csi_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.mountpoint_s3_csi_pod_identity.iam_role_unique_id
}

output "mountpoint_s3_csi_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.mountpoint_s3_csi_pod_identity.iam_policy_arn
}

output "mountpoint_s3_csi_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.mountpoint_s3_csi_pod_identity.iam_policy_name
}

output "mountpoint_s3_csi_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.mountpoint_s3_csi_pod_identity.iam_policy_id
}

output "mountpoint_s3_csi_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.mountpoint_s3_csi_pod_identity.associations
}

################################################################################
# AWS Node Termination Handler
################################################################################

output "aws_node_termination_handler_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_node_termination_handler_pod_identity.iam_role_arn
}

output "aws_node_termination_handler_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_node_termination_handler_pod_identity.iam_role_name
}

output "aws_node_termination_handler_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_node_termination_handler_pod_identity.iam_role_path
}

output "aws_node_termination_handler_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_node_termination_handler_pod_identity.iam_role_unique_id
}

output "aws_node_termination_handler_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_node_termination_handler_pod_identity.iam_policy_arn
}

output "aws_node_termination_handler_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_node_termination_handler_pod_identity.iam_policy_name
}

output "aws_node_termination_handler_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_node_termination_handler_pod_identity.iam_policy_id
}

output "aws_node_termination_handler_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_node_termination_handler_pod_identity.associations
}

################################################################################
# AWS Private CA Issuer
################################################################################

output "aws_privateca_issuer_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_privateca_issuer_pod_identity.iam_role_arn
}

output "aws_privateca_issuer_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_privateca_issuer_pod_identity.iam_role_name
}

output "aws_privateca_issuer_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_privateca_issuer_pod_identity.iam_role_path
}

output "aws_privateca_issuer_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_privateca_issuer_pod_identity.iam_role_unique_id
}

output "aws_privateca_issuer_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_privateca_issuer_pod_identity.iam_policy_arn
}

output "aws_privateca_issuer_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_privateca_issuer_pod_identity.iam_policy_name
}

output "aws_privateca_issuer_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_privateca_issuer_pod_identity.iam_policy_id
}

output "aws_privateca_issuer_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_privateca_issuer_pod_identity.associations
}

################################################################################
# Velero
################################################################################

output "velero_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.velero_pod_identity.iam_role_arn
}

output "velero_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.velero_pod_identity.iam_role_name
}

output "velero_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.velero_pod_identity.iam_role_path
}

output "velero_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.velero_pod_identity.iam_role_unique_id
}

output "velero_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.velero_pod_identity.iam_policy_arn
}

output "velero_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.velero_pod_identity.iam_policy_name
}

output "velero_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.velero_pod_identity.iam_policy_id
}

output "velero_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.velero_pod_identity.associations
}

################################################################################
# AWS VPC CNI IPv4
################################################################################

output "aws_vpc_cni_ipv4_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_vpc_cni_ipv4_pod_identity.iam_role_arn
}

output "aws_vpc_cni_ipv4_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_vpc_cni_ipv4_pod_identity.iam_role_name
}

output "aws_vpc_cni_ipv4_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_vpc_cni_ipv4_pod_identity.iam_role_path
}

output "aws_vpc_cni_ipv4_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_vpc_cni_ipv4_pod_identity.iam_role_unique_id
}

output "aws_vpc_cni_ipv4_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_vpc_cni_ipv4_pod_identity.iam_policy_arn
}

output "aws_vpc_cni_ipv4_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_vpc_cni_ipv4_pod_identity.iam_policy_name
}

output "aws_vpc_cni_ipv4_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_vpc_cni_ipv4_pod_identity.iam_policy_id
}

output "aws_vpc_cni_ipv4_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_vpc_cni_ipv4_pod_identity.associations
}

################################################################################
# AWS VPC CNI IPv6
################################################################################

output "aws_vpc_cni_ipv6_pod_identity_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.aws_vpc_cni_ipv6_pod_identity.iam_role_arn
}

output "aws_vpc_cni_ipv6_pod_identity_iam_role_name" {
  description = "Name of IAM role"
  value       = module.aws_vpc_cni_ipv6_pod_identity.iam_role_name
}

output "aws_vpc_cni_ipv6_pod_identity_iam_role_path" {
  description = "Path of IAM role"
  value       = module.aws_vpc_cni_ipv6_pod_identity.iam_role_path
}

output "aws_vpc_cni_ipv6_pod_identity_iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = module.aws_vpc_cni_ipv6_pod_identity.iam_role_unique_id
}

output "aws_vpc_cni_ipv6_pod_identity_iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.aws_vpc_cni_ipv6_pod_identity.iam_policy_arn
}

output "aws_vpc_cni_ipv6_pod_identity_iam_policy_name" {
  description = "Name of IAM policy"
  value       = module.aws_vpc_cni_ipv6_pod_identity.iam_policy_name
}

output "aws_vpc_cni_ipv6_pod_identity_iam_policy_id" {
  description = "ID of IAM policy"
  value       = module.aws_vpc_cni_ipv6_pod_identity.iam_policy_id
}

output "aws_vpc_cni_ipv6_pod_identity_associations" {
  description = "Map of Pod Identity associations created"
  value       = module.aws_vpc_cni_ipv6_pod_identity.associations
}
