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

module "eks_pod_identity" {
  source = "../.."

  create = false

  tags = local.tags
}

module "eks_pod_identity_disabled" {
  source = "../.."

  create = false
}
