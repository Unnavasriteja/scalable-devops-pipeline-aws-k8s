variable "log_retention_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 30
}

variable "cloudwatch_alarm_arn" {
  description = "ARN for CloudWatch Alarm notifications"
  type        = string
}
