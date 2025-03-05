variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EKS is deployed"
  type        = string
}

variable "private_subnets" {
  description = "Private subnets for EKS worker nodes"
  type        = list(string)
}
