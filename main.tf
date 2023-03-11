terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

locals {
  cidr_block = "172.16.0.0/16"
}

module "ngoc_vpc" {
  source     = "./modules/vpc"
  cidr_block = local.cidr_block
}

module "ngoc_igw" {
  source = "./modules/internet_gateway"
  vpc_id = module.ngoc_vpc.vpc_id
  gate_way_name = {
    Name = "ngoc_igw"
  }
}


module "ngoc_subnet" {
  source               = "./modules/subnet"
  public_subnet_cidrs  = ["172.16.1.0/24"]
  private_subnet_cidrs = ["172.16.16.0/24"]
  vpc_id               = module.ngoc_vpc.vpc_id
}

module "ngoc_ngw" {
  source    = "./modules/nat_gateway"
  subnet_id = tolist(module.ngoc_subnet.private_subnet_ids)[0]
  nat_gateway_name = {
    Name = "ngoc_ngw"
  }
}

module "ngoc_security" {
  source              = "./modules/security_group"
  vpc_id              = module.ngoc_vpc.vpc_id
  public_cidr_blocks  = ["172.16.1.0/24"]
  private_cidr_blocks = ["172.16.16.0/24"]
}

module "app" {
  source                    = "./modules/instance"
  subnet_id                 = tolist(module.ngoc_subnet.public_subnet_ids)[0]
  vpc_security_group_ids = [module.ngoc_security.public_security_group_id]
}