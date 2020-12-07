#Create VPC
resource "aws_vpc" "Hutch1" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "hutch1"
  }
}

# #Create an Internet Gateway for the Public Route Tables
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.Hutch1.id
  tags = {
    Name = "Hutch1IGW"
  }
}
