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
