output "eks_role_arn" {
  description = "IAM Role ARN for EKS"
  value       = aws_iam_role.eks_role.arn
}

output "worker_role_arn" {
  description = "IAM Role ARN for EKS Worker Nodes"
  value       = aws_iam_role.worker_role.arn
}
