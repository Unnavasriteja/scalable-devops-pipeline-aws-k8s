resource "aws_cloudwatch_log_group" "eks_logs" {
  name              = "/eks/cluster"
  retention_in_days = var.log_retention_days
}

resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/eks/mern-app/application"
  retention_in_days = var.log_retention_days
}

resource "aws_cloudwatch_log_group" "backend_logs" {
  name              = "/eks/mern-app/backend"
  retention_in_days = var.log_retention_days
}

resource "aws_cloudwatch_log_group" "frontend_logs" {
  name              = "/eks/mern-app/frontend"
  retention_in_days = var.log_retention_days
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EKS"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  dimensions    = { ClusterName = var.eks_cluster_name }
  alarm_actions = [var.cloudwatch_alarm_arn]
}

resource "aws_iam_policy" "fluent_bit_cloudwatch" {
  name        = "FluentBitCloudWatchPolicy"
  description = "Allows Fluent Bit to write logs to CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams",
          "logs:DescribeLogGroups"
        ]
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role" "fluent_bit" {
  name = "fluent-bit-irsa-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = var.oidc_provider_arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "${var.oidc_provider_url}:sub" = "system:serviceaccount:logging:fluent-bit"
          "${var.oidc_provider_url}:aud" = "sts.amazonaws.com"
        }
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "fluent_bit_cloudwatch" {
  role       = aws_iam_role.fluent_bit.name
  policy_arn = aws_iam_policy.fluent_bit_cloudwatch.arn
}

output "cloudwatch_log_group" { value = aws_cloudwatch_log_group.eks_logs.name }
