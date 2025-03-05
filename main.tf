module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "eks" {
  source          = "./modules/eks"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  eks_cluster_name = "my-eks-cluster"
}

module "rds" {
  source          = "./modules/rds"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  cloudwatch_alarm_arn = module.cloudwatch.cloudwatch_alarm_arn
}

module "iam" {
  source         = "./modules/iam"
  eks_role_name  = "eks-cluster-role"
  worker_role_name = "eks-worker-role"
}

module "s3" {
  source       = "./modules/s3"
  bucket_name  = "my-app-logs"
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "cloudwatch" {
  source              = "./modules/cloudwatch"
  log_retention_days  = 30
}

module "elasticache" {
  source                 = "./modules/elasticache"
  elasticache_cluster_id = "redis-cluster"
}

module "efs" {
  source         = "./modules/efs"
  private_subnet = module.vpc.private_subnets[0]
}

output "eks_cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "alb_dns" {
  value = module.alb.alb_dns_name
}
