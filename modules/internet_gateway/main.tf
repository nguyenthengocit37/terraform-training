resource "aws_internet_gateway" "gate_way" {
  vpc_id = var.vpc_id

  tags = var.gate_way_name
}