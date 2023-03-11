resource "aws_nat_gateway" "nat_gateway" {
  subnet_id     = var.subnet_id

  tags = var.nat_gateway_name
}