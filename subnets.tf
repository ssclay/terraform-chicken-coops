# Make subnets 
#Two AZs with a Private and Public in each.
resource "aws_subnet" "PrivateA" {
  vpc_id            = aws_vpc.Hutch1.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = "172.32.0.0/20"
  tags = {
    Name = "PrivateA"
  }
}

resource "aws_subnet" "PrivateB" {
  vpc_id            = aws_vpc.Hutch1.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = "172.32.16.0/20"
  tags = {
    Name = "PrivateB"
  }
}

resource "aws_subnet" "PublicA" {
  vpc_id            = aws_vpc.Hutch1.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = "172.32.32.0/20"
  tags = {
    Name = "PublicA"
  }
}

resource "aws_subnet" "PublicB" {
  vpc_id            = aws_vpc.Hutch1.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = "172.32.48.0/20"
  tags = {
    Name = "PublicB"
  }
}
