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
  default     = "db.t3.small"  # Optimized for cost while keeping HA
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
  default     = 50  # Reduced to 50GB for cost savings
}

variable "db_max_allocated_storage" {
  description = "Maximum allocated storage in GB"
  type        = number
  default     = 200  # Allows auto-scaling to 200GB
}

variable "db_backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 3  # Reduced from 7 to 3 days
}

variable "db_identifier" {
  description = "RDS Database Identifier"
  type        = string
  default     = "my-rds-instance"
}

variable "db_monitoring_interval" {
  description = "Monitoring interval in seconds (0 to disable)"
  type        = number
  default     = 0  # Disabled enhanced monitoring to save costs
}

variable "cloudwatch_alarm_arn" {
  description = "ARN for CloudWatch Alarm notifications"
  type        = string
}
