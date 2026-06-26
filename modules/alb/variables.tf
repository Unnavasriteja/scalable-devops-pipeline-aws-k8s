variable "vpc_id" {
  description = "VPC ID where ALB is deployed"
  type        = string
}

variable "public_subnets" {
  description = "Public subnets for ALB"
  type        = list(string)
}
