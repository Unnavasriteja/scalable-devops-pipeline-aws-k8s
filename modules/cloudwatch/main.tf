resource "aws_cloudwatch_log_group" "eks_logs" {
  name = "/eks/cluster"
  retention_in_days = var.log_retention_days
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace          = "AWS/EKS"
  period             = 300
  statistic          = "Average"
  threshold          = 80

  dimensions = { ClusterName = aws_eks_cluster.eks.name }
  alarm_actions = [var.cloudwatch_alarm_arn]
}

output "cloudwatch_log_group" { value = aws_cloudwatch_log_group.eks_logs.name }
