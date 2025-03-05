resource "aws_cloudwatch_log_group" "eks_logs" {
  name = "/eks/cluster"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "app_logs" {
  name = "/app/logs"
  retention_in_days = 30
}
