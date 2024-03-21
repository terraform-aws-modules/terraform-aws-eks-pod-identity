################################################################################
# IAM Role
################################################################################

output "iam_role_arn" {
  description = "ARN of IAM role"
  value       = try(aws_iam_role.this[0].arn, null)
}

output "iam_role_name" {
  description = "Name of IAM role"
  value       = try(aws_iam_role.this[0].name, null)
}

output "iam_role_path" {
  description = "Path of IAM role"
  value       = try(aws_iam_role.this[0].path, null)
}

output "iam_role_unique_id" {
  description = "Unique ID of IAM role"
  value       = try(aws_iam_role.this[0].unique_id, null)
}

################################################################################
# IAM Policy
# Note: The module is designed to create a single IAM role with a single policy;
# therefore, we only output one policy ARN, name, and ID (the first one that resolves)
################################################################################

output "iam_policy_arn" {
  description = "The ARN assigned by AWS to this policy"
  value = try(
    aws_iam_policy.amazon_managed_service_prometheus[0].arn,
    aws_iam_policy.appmesh_controller[0].arn,
    aws_iam_policy.appmesh_envoy_proxy[0].arn,
    aws_iam_policy.aws_gateway_controller[0].arn,
    aws_iam_policy.aws_privateca_issuer[0].arn,
    aws_iam_policy.cert_manager[0].arn,
    aws_iam_policy.cluster_autoscaler[0].arn,
    aws_iam_policy.ebs_csi[0].arn,
    aws_iam_policy.efs_csi[0].arn,
    aws_iam_policy.external_dns[0].arn,
    aws_iam_policy.external_secrets[0].arn,
    aws_iam_policy.fsx_lustre_csi[0].arn,
    aws_iam_policy.lb_controller[0].arn,
    aws_iam_policy.lb_controller_targetgroup_only[0].arn,
    aws_iam_policy.mountpoint_s3_csi[0].arn,
    aws_iam_policy.node_termination_handler[0].arn,
    aws_iam_policy.velero[0].arn,
    aws_iam_policy.vpc_cni[0].arn,
    aws_iam_policy.custom[0].arn,
    null,
  )
}

output "iam_policy_name" {
  description = "Name of IAM policy"
  value = try(
    aws_iam_policy.amazon_managed_service_prometheus[0].name,
    aws_iam_policy.appmesh_controller[0].name,
    aws_iam_policy.appmesh_envoy_proxy[0].name,
    aws_iam_policy.aws_gateway_controller[0].name,
    aws_iam_policy.aws_privateca_issuer[0].name,
    aws_iam_policy.cert_manager[0].name,
    aws_iam_policy.cluster_autoscaler[0].name,
    aws_iam_policy.ebs_csi[0].name,
    aws_iam_policy.efs_csi[0].name,
    aws_iam_policy.external_dns[0].name,
    aws_iam_policy.external_secrets[0].name,
    aws_iam_policy.fsx_lustre_csi[0].name,
    aws_iam_policy.lb_controller[0].name,
    aws_iam_policy.lb_controller_targetgroup_only[0].name,
    aws_iam_policy.mountpoint_s3_csi[0].name,
    aws_iam_policy.node_termination_handler[0].name,
    aws_iam_policy.velero[0].name,
    aws_iam_policy.vpc_cni[0].name,
    aws_iam_policy.custom[0].name,
    null,
  )
}

output "iam_policy_id" {
  description = "The policy's ID"
  value = try(
    aws_iam_policy.amazon_managed_service_prometheus[0].policy_id,
    aws_iam_policy.appmesh_controller[0].policy_id,
    aws_iam_policy.appmesh_envoy_proxy[0].policy_id,
    aws_iam_policy.aws_gateway_controller[0].policy_id,
    aws_iam_policy.aws_privateca_issuer[0].policy_id,
    aws_iam_policy.cert_manager[0].policy_id,
    aws_iam_policy.cluster_autoscaler[0].policy_id,
    aws_iam_policy.ebs_csi[0].policy_id,
    aws_iam_policy.efs_csi[0].policy_id,
    aws_iam_policy.external_dns[0].policy_id,
    aws_iam_policy.external_secrets[0].policy_id,
    aws_iam_policy.fsx_lustre_csi[0].policy_id,
    aws_iam_policy.lb_controller[0].policy_id,
    aws_iam_policy.lb_controller_targetgroup_only[0].policy_id,
    aws_iam_policy.mountpoint_s3_csi[0].policy_id,
    aws_iam_policy.node_termination_handler[0].policy_id,
    aws_iam_policy.velero[0].policy_id,
    aws_iam_policy.vpc_cni[0].policy_id,
    aws_iam_policy.custom[0].policy_id,
    null,
  )
}

################################################################################
# Pod Identity Association
################################################################################

output "associations" {
  description = "Map of Pod Identity associations created"
  value       = aws_eks_pod_identity_association.this
}
