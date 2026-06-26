output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.app_alb.dns_name
}

output "alb_arn" {
  description = "ARN of the ALB (used by WAF association)"
  value       = aws_lb.app_alb.arn
}
