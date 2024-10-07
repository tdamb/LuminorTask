variable "eks_admin_role_name" {
  description = "The name of the IAM role for EKS admin access."
  type        = string
}

variable "eks_readonly_role_name" {
  description = "The name of the IAM role for EKS read-only access."
  type        = string
}
