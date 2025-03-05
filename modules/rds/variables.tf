variable "vpc_id" {
  type        = string
  description = "VPC ID where RDS will be deployed"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets for RDS"
}
