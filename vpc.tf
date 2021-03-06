#Create VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# #Create an Internet Gateway for the Public Route Tables
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}
