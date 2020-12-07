#Create ACL for Private Subnet
resource "aws_network_acl" "ACLPrivate" {
  vpc_id = aws_vpc.myvpc.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.myvpc.cidr_block
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = aws_vpc.myvpc.cidr_block
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = aws_vpc.myvpc.cidr_block
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name = "${var.vpc_name}-ACLPrivate"
  }

}

#Create ACL for Public Subnet
resource "aws_network_acl" "ACLPublic" {
  vpc_id = aws_vpc.myvpc.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name = "${var.vpc_name}-ACLPublic"
  }

}

