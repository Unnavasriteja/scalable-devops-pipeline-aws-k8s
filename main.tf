module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source = "./modules/eks"
}

module "iam" {
  source = "./modules/iam"
}

module "rds" {
  source = "./modules/rds"
}

module "s3" {
  source = "./modules/s3"
}
