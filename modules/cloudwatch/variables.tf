variable "log_retention_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 30
}

variable "cloudwatch_alarm_arn" {
  description = "ARN for CloudWatch Alarm notifications (e.g. SNS topic)"
  type        = string
}

variable "eks_cluster_name" {
  description = "EKS cluster name for CloudWatch metric alarm dimensions"
  type        = string
}

variable "oidc_provider_arn" {
  description = "OIDC provider ARN for Fluent Bit IRSA"
  type        = string
}

variable "oidc_provider_url" {
  description = "OIDC provider URL (without https://) for Fluent Bit IRSA"
  type        = string
}
