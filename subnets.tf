# Make subnets 
#Two AZs with a Private and Public in each.
resource "aws_subnet" "PrivateA" {
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = var.subnet_cidrs[0]
  tags = {
    Name = "${var.vpc_name}-PrivateA"
  }
}

resource "aws_subnet" "PrivateB" {
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = var.subnet_cidrs[1]
  tags = {
    Name = "${var.vpc_name}-PrivateB"
  }
}

resource "aws_subnet" "PublicA" {
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = var.subnet_cidrs[2]
  tags = {
    Name = "${var.vpc_name}-PublicA"
  }
}

resource "aws_subnet" "PublicB" {
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = var.subnet_cidrs[3]
  tags = {
    Name = "${var.vpc_name}-PublicB"
  }
}
