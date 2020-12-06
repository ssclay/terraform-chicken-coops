#Need to make NATGWs so instances in private subnet
#Can reach the outside world to download packages

#Create Elastic IP for each NATGW
resource "aws_eip" "EIPNATGWA" {
  vpc = true
}

resource "aws_eip" "EIPNATGWB" {
  vpc = true
}

#Create NATGWs
resource "aws_nat_gateway" "NATGWA" {
  allocation_id = aws_eip.EIPNATGWA.id
  subnet_id     = aws_subnet.PublicA.id

  tags = {
    Name = "NATGWA"
  }

  depends_on = [aws_internet_gateway.IGW]

}

resource "aws_nat_gateway" "NATGWB" {
  allocation_id = aws_eip.EIPNATGWB.id
  subnet_id     = aws_subnet.PublicB.id

  tags = {
    Name = "NATGWB"
  }

  depends_on = [aws_internet_gateway.IGW]

}
