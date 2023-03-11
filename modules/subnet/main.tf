resource "aws_subnet" "private_subnets" {
  count       = length(var.private_subnet_cidrs)
  vpc_id      = var.vpc_id
  cidr_block  = element(var.private_subnet_cidrs,count.index)
  tags        = {
    Name="ngoc_private_subnets"
  }
}

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = var.vpc_id
  cidr_block              = element(var.public_subnet_cidrs,count.index)
  map_public_ip_on_launch = true
   tags        = {
    Name="ngoc_public_subnets"
  }
}