variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "eu-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "project_name" {
  description = "The name of the project."
  type        = string
  default     = "eks-atlantis-project"
}


variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "public_subnets" {
  description = "List of public subnet CIDRs."
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}


variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  default     = "1.31"
}

variable "worker_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "worker_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 2
}

variable "worker_desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "EKS-Atlantis"
  }
}


variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
  default     = "my-cluster"
}

variable "eks_admin_role_name" {
  description = "The name of the IAM role for EKS admin access."
  type        = string
  default     = "eks-admin-role"
}

variable "eks_readonly_role_name" {
  description = "The name of the IAM role for EKS read-only access."
  type        = string
  default     = "eks-readonly-role"
}

variable "github_user" {
  description = "GitHub username for Atlantis to authenticate with."
  type        = string
}

variable "github_token" {
  description = "GitHub personal access token for Atlantis."
  type        = string
  sensitive   = true
}

variable "github_webhook_secret" {
  description = "Secret for GitHub webhook authentication."
  type        = string
  sensitive   = true
}

variable "namespace" {
  description = "Namespace"
  type        = string
  default     = "atlantis"
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "The CIDR blocks for public access to the EKS cluster endpoint"
  type        = list(string)
}
