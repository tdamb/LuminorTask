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

variable "private_subnets" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  default     = "1.30"
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
  description = "A map of tags to add to resources"
  type        = map(string)
  default     = {}
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
