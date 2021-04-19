
//creating vpc
resource "aws_vpc" "trf_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "vpc_one"
  }
}

//creating subnet
resource "aws_subnet" "main" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "subnet_one"
  }
}