variable "vpc_id" {
  type = string
}

variable "private_subnet_cidrs" {
  type=list(string)
}
variable "public_subnet_cidrs" {
  type=list(string)
}