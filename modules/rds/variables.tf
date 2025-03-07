variable "vpc_id" {
  description = "VPC ID where RDS will be deployed"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnets for RDS"
  type        = list(string)
}

variable "db_instance_class" {
  description = "Instance class for primary RDS instance"
  type        = string
  default     = "db.t3.medium"  # Optimized for HA
}

variable "db_instance_class_read_replica" {
  description = "Instance class for Read Replica"
  type        = string
  default     = "db.t3.small"  # Smaller instance for replicas to save cost
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
  description = "Initial allocated storage (GB)"
  type        = number
  default     = 50  # Keeps cost low, allows Auto Scaling
}

variable "db_max_allocated_storage" {
  description = "Maximum storage limit (GB)"
  type        = number
  default     = 200  # Allows Auto Scaling up to 200GB
}

variable "db_backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7  # Increased to 7 for better data retention
}

variable "db_identifier" {
  description = "RDS Database Identifier"
  type        = string
  default     = "my-rds-instance"
}

variable "db_monitoring_interval" {
  description = "Monitoring interval in seconds (0 to disable, 60 for CloudWatch metrics)"
  type        = number
  default     = 60  # Enables CloudWatch basic monitoring
}

variable "cloudwatch_alarm_arn" {
  description = "ARN for CloudWatch Alarm notifications"
  type        = string
}

variable "route53_zone_id" {
  description = "Route 53 hosted zone ID"
  type        = string
}
