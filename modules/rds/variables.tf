variable "vpc_id" {
  description = "VPC ID where RDS will be deployed"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets for RDS"
  type        = list(string)
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.medium"
}

variable "db_engine" {
  description = "The database engine to use"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "15"
}

variable "db_allocated_storage" {
  description = "The allocated storage in GB"
  type        = number
  default     = 100
}

variable "db_max_allocated_storage" {
  description = "Maximum allocated storage in GB"
  type        = number
  default     = 500
}

variable "multi_az" {
  description = "Enable multi-AZ for high availability"
  type        = bool
  default     = true
}

variable "storage_encrypted" {
  description = "Enable encryption for RDS storage"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "skip_final_snapshot" {
  description = "Skip the final snapshot before deletion"
  type        = bool
  default     = false
}

variable "monitoring_interval" {
  description = "Monitoring interval in seconds for enhanced monitoring"
  type        = number
  default     = 60
}

variable "performance_insights_enabled" {
  description = "Enable Performance Insights for RDS"
  type        = bool
  default     = true
}

variable "performance_insights_retention_period" {
  description = "Retention period for Performance Insights (days)"
  type        = number
  default     = 7
}

variable "cloudwatch_alarm_arn" {
  description = "ARN for CloudWatch Alarm notifications"
  type        = string
}

variable "db_identifier" {
  description = "RDS Database Identifier"
  type        = string
  default     = "my-rds-instance"
}
