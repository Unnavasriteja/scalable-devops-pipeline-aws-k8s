variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "private_subnets" {
  description = "Private subnets for internal resources"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnets for ALB and NAT Gateway"
  type        = list(string)
}
