variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be deployed."
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs where the EKS cluster will be deployed."
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use for the EKS cluster."
  type        = string
}

variable "worker_min_size" {
  description = "Minimum number of nodes for the worker group."
  type        = number
}

variable "worker_max_size" {
  description = "Maximum number of nodes for the worker group."
  type        = number
}

variable "worker_desired_capacity" {
  description = "Desired number of nodes for the worker group."
  type        = number
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "The CIDR blocks for public access to the EKS cluster endpoint"
  type        = list(string)
}
