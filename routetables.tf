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

# #Make route tables for the Private Subnets
# #Empty for now

resource "aws_route_table" "RTPrivateA" {
  vpc_id = aws_vpc.Hutch1.id

  tags = {
    Name = "RTPrivateA"
  }
}

resource "aws_route_table" "RTPrivateB" {
  vpc_id = aws_vpc.Hutch1.id

  tags = {
    Name = "RTPrivateB"
  }

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
