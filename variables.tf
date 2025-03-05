variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for networking"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnets for RDS & EKS"
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "db_username" {
  type        = string
}

variable "db_password" {
  type        = string
}

variable "app_cidr" {
  type        = list(string)
}
