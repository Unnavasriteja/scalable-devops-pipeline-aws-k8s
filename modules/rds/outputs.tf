output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.rds.endpoint
}

output "rds_arn" {
  description = "RDS ARN"
  value       = aws_db_instance.rds.arn
}

output "rds_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.rds.id
}

output "rds_status" {
  description = "Current status of the RDS instance"
  value       = aws_db_instance.rds.status
}

output "rds_backup_retention_period" {
  description = "Number of days RDS retains automatic backups"
  value       = aws_db_instance.rds.backup_retention_period
}

output "rds_multi_az" {
  description = "Whether RDS is multi-AZ enabled"
  value       = aws_db_instance.rds.multi_az
}

output "rds_storage_size" {
  description = "Current allocated storage size in GB"
  value       = aws_db_instance.rds.allocated_storage
}

output "rds_storage_encryption" {
  description = "Is storage encryption enabled"
  value       = aws_db_instance.rds.storage_encrypted
}
