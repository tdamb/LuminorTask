module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name               = var.project_name
  cidr               = var.vpc_cidr
  azs                = var.availability_zones
  private_subnets    = var.private_subnets
  enable_nat_gateway = true
  tags               = var.tags
}
