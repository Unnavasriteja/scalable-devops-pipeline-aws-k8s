output "cloudwatch_log_group" {
  description = "CloudWatch log group name for EKS cluster"
  value       = aws_cloudwatch_log_group.eks_logs.name
}

output "app_log_group" {
  description = "CloudWatch log group for MERN app (used by Fluent Bit)"
  value       = aws_cloudwatch_log_group.app_logs.name
}

output "high_cpu_alarm" {
  description = "CloudWatch alarm ARN for high CPU usage"
  value       = aws_cloudwatch_metric_alarm.high_cpu_alarm.arn
}

output "cloudwatch_alarm_arn" {
  description = "Alias for high_cpu_alarm ARN (used by RDS module)"
  value       = aws_cloudwatch_metric_alarm.high_cpu_alarm.arn
}

output "fluent_bit_role_arn" {
  description = "IAM role ARN for Fluent Bit IRSA"
  value       = aws_iam_role.fluent_bit.arn
}

output "waf_log_group_arn" {
  description = "CloudWatch log group ARN for WAF logs"
  value       = aws_cloudwatch_log_group.waf_logs.arn
}
