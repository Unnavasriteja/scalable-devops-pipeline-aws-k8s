output "cloudwatch_log_group" {
  description = "CloudWatch log group name"
  value       = aws_cloudwatch_log_group.eks_logs.name
}

output "high_cpu_alarm" {
  description = "CloudWatch alarm for high CPU usage"
  value       = aws_cloudwatch_metric_alarm.high_cpu_alarm.arn
}
