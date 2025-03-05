output "eks_role_arn" {
  description = "IAM Role ARN for EKS"
  value       = aws_iam_role.eks_role.arn
}
