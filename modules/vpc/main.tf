resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnets" {
  value = [aws_subnet.private1.id, aws_subnet.private2.id]
}
