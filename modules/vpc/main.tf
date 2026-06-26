resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = { Name = "main-vpc" }
}

# Create Public & Private Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.public_subnets, count.index)
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.private_subnets, count.index)
}

# NAT Gateway for Private Subnets to Access the Internet
resource "aws_eip" "nat" { vpc = true }
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public[0].id
}

# Route Private Subnets Through NAT Gateway
resource "aws_route_table" "private_rt" { vpc_id = aws_vpc.main.id }
resource "aws_route" "private_nat_route" {
  route_table_id = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
}

output "vpc_id" { value = aws_vpc.main.id }
output "private_subnets" { value = aws_subnet.private[*].id }
output "public_subnets" { value = aws_subnet.public[*].id }
