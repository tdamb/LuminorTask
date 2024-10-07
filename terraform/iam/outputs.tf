output "eks_admin_role_arn" {
  value = aws_iam_role.eks_admin.arn
}

output "eks_readonly_role_arn" {
  value = aws_iam_role.eks_readonly.arn
}
