variable "create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}

variable "region" {
  description = "Region where the resource(s) will be managed. Defaults to the Region set in the provider configuration"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

################################################################################
# IAM Role Trust Policy
################################################################################

variable "trust_policy_conditions" {
  description = "A list of conditions to add to the role trust policy"
  type = list(object({
    test     = string
    values   = list(string)
    variable = string
  }))
  default = []
}

variable "trust_policy_statements" {
  description = "A list of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for the role trust policy"
  type = list(object({
    sid           = optional(string)
    actions       = optional(list(string))
    not_actions   = optional(list(string))
    effect        = optional(string)
    resources     = optional(list(string))
    not_resources = optional(list(string))
    principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    not_principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    condition = optional(list(object({
      test     = string
      values   = list(string)
      variable = string
    })))
  }))
  default = null
}

################################################################################
# IAM Role
################################################################################

variable "name" {
  description = "Name of IAM role"
  type        = string
  default     = ""
}

variable "use_name_prefix" {
  description = "Determines whether the role name and policy name(s) are used as a prefix"
  type        = string
  default     = true
}

variable "path" {
  description = "Path of IAM role"
  type        = string
  default     = "/"
}

variable "description" {
  description = "IAM Role description"
  type        = string
  default     = null
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  type        = number
  default     = null
}

variable "permissions_boundary_arn" {
  description = "Permissions boundary ARN to use for IAM role"
  type        = string
  default     = null
}

variable "additional_policy_arns" {
  description = "ARNs of additional policies to attach to the IAM role"
  type        = map(string)
  default     = {}
}

################################################################################
# Pod Identity Association
################################################################################

variable "association_defaults" {
  description = "Default values used across all Pod Identity associations created unless a more specific value is provided"
  type = object({
    cluster_name         = optional(string)
    disable_session_tags = optional(bool)
    namespace            = optional(string)
    service_account      = optional(string)
    role_arn             = optional(string)
    target_role_arn      = optional(string)
    tags                 = optional(map(string), {})
  })
  default = {}
}

variable "associations" {
  description = "Map of Pod Identity associations to be created (map of maps)"
  type = map(object({
    cluster_name         = optional(string)
    disable_session_tags = optional(bool)
    namespace            = optional(string)
    service_account      = optional(string)
    role_arn             = optional(string)
    target_role_arn      = optional(string)
    tags                 = optional(map(string), {})
  }))
  default = {}
}

################################################################################
# Policies
################################################################################

variable "source_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document"
  type        = list(string)
  default     = []
}

variable "override_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document"
  type        = list(string)
  default     = []
}

variable "policy_statements" {
  description = "A list of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type = list(object({
    sid           = optional(string)
    actions       = optional(list(string))
    not_actions   = optional(list(string))
    effect        = optional(string)
    resources     = optional(list(string))
    not_resources = optional(list(string))
    principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    not_principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    condition = optional(list(object({
      test     = string
      values   = list(string)
      variable = string
    })))
  }))
  default = null
}

variable "policy_name_prefix" {
  description = "IAM policy name prefix"
  type        = string
  default     = "AmazonEKS_"
}

# Custom policy
variable "attach_custom_policy" {
  description = "Determines whether to attach the custom IAM policy to the role"
  type        = bool
  default     = false
}

variable "custom_policy_description" {
  description = "Description of the custom IAM policy"
  type        = string
  default     = "Custom IAM Policy"
}

# Amazon Managed Service for Prometheus
variable "attach_amazon_managed_service_prometheus_policy" {
  description = "Determines whether to attach the Amazon Managed Service for Prometheus IAM policy to the role"
  type        = bool
  default     = false
}

variable "amazon_managed_service_prometheus_policy_name" {
  description = "Custom name of the Amazon Managed Service for Prometheus IAM policy"
  type        = string
  default     = null
}

variable "amazon_managed_service_prometheus_workspace_arns" {
  description = "List of AMP Workspace ARNs to read and write metrics"
  type        = list(string)
  default     = []
}

# AWS Appmesh Controller
variable "attach_aws_appmesh_controller_policy" {
  description = "Determines whether to attach the AppMesh Controller policy to the role"
  type        = bool
  default     = false
}

variable "appmesh_controller_policy_name" {
  description = "Custom name of the AppMesh Controller IAM policy"
  type        = string
  default     = null
}

# AWS Cloudwatch Observability Agent
variable "attach_aws_cloudwatch_observability_policy" {
  description = "Determines whether to attach the AWS Cloudwatch Observability IAM policy to the role"
  type        = bool
  default     = false
}

# AWS Appmesh envoy proxy
variable "attach_aws_appmesh_envoy_proxy_policy" {
  description = "Determines whether to attach the AppMesh Envoy Proxy policy to the role"
  type        = bool
  default     = false
}

variable "appmesh_envoy_proxy_policy_name" {
  description = "Custom name of the AppMesh Envoy Proxy IAM policy"
  type        = string
  default     = null
}

# AWS EBS CSI
variable "attach_aws_ebs_csi_policy" {
  description = "Determines whether to attach the EBS CSI IAM policy to the role"
  type        = bool
  default     = false
}

variable "aws_ebs_csi_policy_name" {
  description = "Custom name of the EBS CSI IAM policy"
  type        = string
  default     = null
}

variable "aws_ebs_csi_kms_arns" {
  description = "KMS key ARNs to allow EBS CSI to manage encrypted volumes"
  type        = list(string)
  default     = []
}

# AWS EFS CSI
variable "attach_aws_efs_csi_policy" {
  description = "Determines whether to attach the EFS CSI IAM policy to the role"
  type        = bool
  default     = false
}

variable "aws_efs_csi_policy_name" {
  description = "Custom name of the EFS CSI IAM policy"
  type        = string
  default     = null
}

# AWS FSx Lustre CSI
variable "attach_aws_fsx_lustre_csi_policy" {
  description = "Determines whether to attach the FSx for Lustre CSI Driver IAM policy to the role"
  type        = bool
  default     = false
}

variable "aws_fsx_lustre_csi_policy_name" {
  description = "Custom name of the FSx for Lustre CSI Driver IAM policy"
  type        = string
  default     = null
}

variable "aws_fsx_lustre_csi_service_role_arns" {
  description = "Service role ARNs to allow FSx for Lustre CSI create and manage FSX for Lustre service linked roles"
  type        = list(string)
  default     = []
}

# AWS Gateway Controller
variable "attach_aws_gateway_controller_policy" {
  description = "Determines whether to attach the AWS Gateway Controller IAM policy to the role"
  type        = bool
  default     = false
}

variable "aws_gateway_controller_policy_name" {
  description = "Custom name of the AWS Gateway Controller IAM policy"
  type        = string
  default     = null
}

# AWS Load Balancer Controller
variable "attach_aws_lb_controller_policy" {
  description = "Determines whether to attach the AWS Load Balancer Controller policy to the role"
  type        = bool
  default     = false
}

variable "aws_lb_controller_policy_name" {
  description = "Custom name of the AWS Load Balancer Controller IAM policy"
  type        = string
  default     = null
}

# AWS Load Balancer Controller TargetGroup Binding Only
variable "attach_aws_lb_controller_targetgroup_binding_only_policy" {
  description = "Determines whether to attach the AWS Load Balancer Controller policy for the TargetGroupBinding only"
  type        = bool
  default     = false
}

variable "aws_lb_controller_targetgroup_only_policy_name" {
  description = "Custom name of the AWS Load Balancer Controller IAM policy for the TargetGroupBinding only"
  type        = string
  default     = null
}

variable "aws_lb_controller_targetgroup_arns" {
  description = "List of Target groups ARNs using Load Balancer Controller"
  type        = list(string)
  default     = []
}

# AWS Node termination handler
variable "attach_aws_node_termination_handler_policy" {
  description = "Determines whether to attach the Node Termination Handler policy to the role"
  type        = bool
  default     = false
}

variable "aws_node_termination_handler_policy_name" {
  description = "Custom name of the Node Termination Handler IAM policy"
  type        = string
  default     = null
}

variable "aws_node_termination_handler_sqs_queue_arns" {
  description = "List of SQS ARNs that contain node termination events"
  type        = list(string)
  default     = []
}

# AWS Private CA Issuer
variable "attach_aws_privateca_issuer_policy" {
  description = "Determines whether to attach the AWS Private CA Issuer IAM policy to the role"
  type        = bool
  default     = false
}

variable "aws_privateca_issuer_policy_name" {
  description = "Custom name of the AWS Private CA Issuer IAM policy"
  type        = string
  default     = null
}

variable "aws_privateca_issuer_acmca_arns" {
  description = "List of ACM Private CA ARNs to issue certificates from"
  type        = list(string)
  default     = []
}

# AWS VPC CNI
variable "attach_aws_vpc_cni_policy" {
  description = "Determines whether to attach the VPC CNI IAM policy to the role"
  type        = bool
  default     = false
}

variable "aws_vpc_cni_policy_name" {
  description = "Custom name of the VPC CNI IAM policy"
  type        = string
  default     = null
}

variable "aws_vpc_cni_enable_cloudwatch_logs" {
  description = "Determines whether to enable VPC CNI permission to create CloudWatch Log groups and publish network policy events"
  type        = bool
  default     = false
}

variable "aws_vpc_cni_enable_ipv4" {
  description = "Determines whether to enable IPv4 permissions for VPC CNI policy"
  type        = bool
  default     = false
}

variable "aws_vpc_cni_enable_ipv6" {
  description = "Determines whether to enable IPv6 permissions for VPC CNI policy"
  type        = bool
  default     = false
}

# Cert Manager
variable "attach_cert_manager_policy" {
  description = "Determines whether to attach the Cert Manager IAM policy to the role"
  type        = bool
  default     = false
}

variable "cert_manager_policy_name" {
  description = "Custom name of the Cert Manager IAM policy"
  type        = string
  default     = null
}

variable "cert_manager_hosted_zone_arns" {
  description = "Route53 hosted zone ARNs to allow Cert manager to manage records"
  type        = list(string)
  default     = []
}

# Cluster autoscaler
variable "attach_cluster_autoscaler_policy" {
  description = "Determines whether to attach the Cluster Autoscaler IAM policy to the role"
  type        = bool
  default     = false
}

variable "cluster_autoscaler_policy_name" {
  description = "Custom name of the Cluster Autoscaler IAM policy"
  type        = string
  default     = null
}

variable "cluster_autoscaler_cluster_names" {
  description = "List of cluster names to appropriately scope permissions within the Cluster Autoscaler IAM policy"
  type        = list(string)
  default     = []
}

# External DNS
variable "attach_external_dns_policy" {
  description = "Determines whether to attach the External DNS IAM policy to the role"
  type        = bool
  default     = false
}

variable "external_dns_policy_name" {
  description = "Custom name of the External DNS IAM policy"
  type        = string
  default     = null
}

variable "external_dns_hosted_zone_arns" {
  description = "Route53 hosted zone ARNs to allow External DNS to manage records"
  type        = list(string)
  default     = []
}

# External Secrets
variable "attach_external_secrets_policy" {
  description = "Determines whether to attach the External Secrets policy to the role"
  type        = bool
  default     = false
}

variable "external_secrets_policy_name" {
  description = "Custom name of the External Secrets IAM policy"
  type        = string
  default     = null
}

variable "external_secrets_ssm_parameter_arns" {
  description = "List of Systems Manager Parameter ARNs that contain secrets to mount using External Secrets"
  type        = list(string)
  default     = []
}

variable "external_secrets_secrets_manager_arns" {
  description = "List of Secrets Manager ARNs that contain secrets to mount using External Secrets"
  type        = list(string)
  default     = []
}

variable "external_secrets_kms_key_arns" {
  description = "List of KMS Key ARNs that are used by Secrets Manager that contain secrets to mount using External Secrets"
  type        = list(string)
  default     = []
}

variable "external_secrets_create_permission" {
  description = "Determines whether External Secrets has permission to create/delete secrets"
  type        = bool
  default     = false
}

# Mountpoint S3 CSI
variable "attach_mountpoint_s3_csi_policy" {
  description = "Determines whether to attach the Mountpoint S3 CSI IAM policy to the role"
  type        = bool
  default     = false
}

variable "mountpoint_s3_csi_policy_name" {
  description = "Custom name of the Mountpoint S3 CSI IAM policy"
  type        = string
  default     = null
}

variable "mountpoint_s3_csi_bucket_arns" {
  description = "List of S3 Bucket ARNs that Mountpoint S3 CSI needs access to list"
  type        = list(string)
  default     = []
}

variable "mountpoint_s3_csi_bucket_path_arns" {
  description = "S3 path ARNs to allow Mountpoint S3 CSI driver to manage items at the provided path(s). This is required if `attach_mountpoint_s3_csi_policy = true`"
  type        = list(string)
  default     = []
}

# Velero
variable "attach_velero_policy" {
  description = "Determines whether to attach the Velero IAM policy to the role"
  type        = bool
  default     = false
}

variable "velero_policy_name" {
  description = "Custom name of the Velero IAM policy"
  type        = string
  default     = null
}

variable "velero_s3_bucket_arns" {
  description = "List of S3 Bucket ARNs that Velero needs access to list"
  type        = list(string)
  default     = []
}

variable "velero_s3_bucket_path_arns" {
  description = "S3 path ARNs to allow Velero to manage items at the provided path(s). This is required if `attach_mountpoint_s3_csi_policy = true`"
  type        = list(string)
  default     = []
}
