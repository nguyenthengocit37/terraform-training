variable "public_cidr_blocks" {
  type=list(string)
}
variable "private_cidr_blocks" {
  type=list(string)
}
variable "vpc_id" {
  type=string
}