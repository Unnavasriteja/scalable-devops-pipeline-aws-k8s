variable "alb_arn" {
  description = "ARN of the ALB to associate the WAF WebACL with"
  type        = string
}

variable "waf_log_group_arn" {
  description = "CloudWatch log group ARN for WAF logs (must start with aws-waf-logs-)"
  type        = string
}
