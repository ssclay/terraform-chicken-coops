# #Make route tables for the Public Subnets
resource "aws_route_table" "RTPublicA" {
  vpc_id = aws_vpc.Hutch1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "RTPublicA"
  }
}

resource "aws_route_table" "RTPublicB" {
  vpc_id = aws_vpc.Hutch1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "RTPublicB"
  }

}

#Make route tables for the Private Subnets
#Where the NATGWs go

resource "aws_route_table" "RTPrivateA" {
  vpc_id = aws_vpc.Hutch1.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATGWA.id
  }
  tags = {
    Name = "RTPrivateA"
  }

  depends_on = [aws_nat_gateway.NATGWA]

}

resource "aws_route_table" "RTPrivateB" {
  vpc_id = aws_vpc.Hutch1.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATGWB.id
  }

  tags = {
    Name = "RTPrivateB"
  }

  depends_on = [aws_nat_gateway.NATGWB]

}

# #Associate route tables with their Subnets
resource "aws_route_table_association" "PrivateAA" {
  subnet_id      = aws_subnet.PrivateA.id
  route_table_id = aws_route_table.RTPrivateA.id
}

resource "aws_route_table_association" "PrivateBA" {
  subnet_id      = aws_subnet.PrivateB.id
  route_table_id = aws_route_table.RTPrivateB.id
}

resource "aws_route_table_association" "PublicAA" {
  subnet_id      = aws_subnet.PublicA.id
  route_table_id = aws_route_table.RTPublicA.id
}

resource "aws_route_table_association" "PublicBA" {
  subnet_id      = aws_subnet.PublicB.id
  route_table_id = aws_route_table.RTPublicB.id
}
