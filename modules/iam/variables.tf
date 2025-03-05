variable "eks_role_name" {
  description = "IAM role for EKS cluster"
  type        = string
}

variable "worker_role_name" {
  description = "IAM role for EKS worker nodes"
  type        = string
}
