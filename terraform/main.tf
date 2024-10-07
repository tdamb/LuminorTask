module "vpc" {
  source = "./vpc"

  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  private_subnets    = var.private_subnets
  tags               = var.tags
}


module "iam" {
  source = "./iam"

  eks_admin_role_name    = var.eks_admin_role_name
  eks_readonly_role_name = var.eks_readonly_role_name
}

module "eks" {
  source = "./eks"

  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.subnet_ids
  cluster_name            = var.cluster_name
  kubernetes_version      = var.kubernetes_version
  worker_min_size         = var.worker_min_size
  worker_max_size         = var.worker_max_size
  worker_desired_capacity = var.worker_desired_capacity
  tags                    = var.tags
}

module "atlantis" {
  source = "./atlantis"

  depends_on = [module.eks]
}
