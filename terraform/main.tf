module "vpc" {
  source = "./vpc"

  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  tags               = var.tags
}


module "iam" {
  source = "./iam"

  eks_admin_role_name    = var.eks_admin_role_name
  eks_readonly_role_name = var.eks_readonly_role_name
}

module "eks_auth" {
  source  = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version = "~> 20.0"

  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = module.iam.eks_admin_role_arn
      username = "eks-admin"
      groups   = ["system:masters"]
    },
    {
      rolearn  = module.iam.eks_readonly_role_arn
      username = "eks-readonly"
      groups   = ["system:aggregate-to-view"]
    }
  ]

  depends_on = [module.eks, module.iam]
}


module "eks" {
  source = "./eks"

  vpc_id                               = module.vpc.vpc_id
  subnet_ids                           = module.vpc.subnet_ids
  cluster_name                         = var.cluster_name
  kubernetes_version                   = var.kubernetes_version
  worker_min_size                      = var.worker_min_size
  worker_max_size                      = var.worker_max_size
  worker_desired_capacity              = var.worker_desired_capacity
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  tags                                 = var.tags
}

module "atlantis" {
  source = "./atlantis"

  github_user           = var.github_user
  github_token          = var.github_token
  github_webhook_secret = var.github_webhook_secret
  namespace             = var.namespace

  providers = {
    kubernetes = kubernetes

  }
  depends_on = [module.eks]

}
