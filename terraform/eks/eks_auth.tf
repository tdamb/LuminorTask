module "eks_aws_auth" {
  source  = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version = "~> 20.0"

  cluster_name = module.eks_cluster.cluster_id

  map_roles = [
    {
      rolearn  = module.iam.eks_admin_role_arn
      username = "eks-admin"
      groups   = ["system:masters"]
    },
    {
      rolearn  = module.iam.eks_readonly_role_arn
      username = "eks-readonly"
      groups   = ["view"]
    }
  ]
}
