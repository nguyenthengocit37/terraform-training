resource "aws_instance" "zigvy" {
  ami = "ami-03f6a11788f8e319e"
  instance_type = "t2.micro"

  subnet_id=var.subnet_id

  vpc_security_group_ids=var.vpc_security_group_ids
}