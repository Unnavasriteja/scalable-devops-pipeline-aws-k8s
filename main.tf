module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source         = "./modules/eks"
  vpc_id         = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "rds" {
  source         = "./modules/rds"
  vpc_id         = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source = "./modules/s3"
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
}

module "elasticache" {
  source = "./modules/elasticache"
}

module "efs" {
  source = "./modules/efs"
  private_subnet = module.vpc.private_subnets[0]
}
