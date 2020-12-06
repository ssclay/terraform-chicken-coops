# #Create an Internet Gateway for the Public Route Tables
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.Hutch1.id
  tags = {
    Name = "Hutch1IGW"
  }
}
