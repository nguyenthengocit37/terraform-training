resource "aws_vpc" "zigvy" {
  cidr_block = var.cidr_block 
  tags = var.vpc_tags
}