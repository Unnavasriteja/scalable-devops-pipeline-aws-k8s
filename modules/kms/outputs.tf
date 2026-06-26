output "rds_key_arn" {
  description = "KMS key ARN for RDS encryption"
  value       = aws_kms_key.rds.arn
}

output "s3_key_arn" {
  description = "KMS key ARN for S3 encryption"
  value       = aws_kms_key.s3.arn
}

output "eks_secrets_key_arn" {
  description = "KMS key ARN for EKS secrets envelope encryption"
  value       = aws_kms_key.eks_secrets.arn
}

output "secrets_manager_key_arn" {
  description = "KMS key ARN for Secrets Manager"
  value       = aws_kms_key.secrets_manager.arn
}
