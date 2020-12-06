#Create VPC
resource "aws_vpc" "Hutch1" {
  cidr_block = "172.32.0.0/18"
  tags = {
    Name = "hutch1"
  }
}
