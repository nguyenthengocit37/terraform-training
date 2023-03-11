variable "cidr_block" {
  description = "CIDR block"
  type = string
  default = "192.14.0.0/16"
}

variable "vpc_tags" {
    description = "Vpc tag"
    type = map(any)
    default = {
      Name = "Zigvy-Vpc"
    }
  
}