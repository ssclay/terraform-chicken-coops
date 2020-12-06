resource "aws_instance" "WebServerA" {
  ami                    = "ami-0cf5095664e10bcb5"
  instance_type          = "t2.micro"
  availability_zone      = "us-west-2a"
  subnet_id              = aws_subnet.PrivateA.id
  vpc_security_group_ids = [aws_security_group.EC2SG.id]
  tags = {
    Name = "WebServerA"
  }

}

resource "aws_instance" "WebServerB" {
  ami                    = "ami-0cf5095664e10bcb5"
  instance_type          = "t2.micro"
  availability_zone      = "us-west-2b"
  subnet_id              = aws_subnet.PrivateB.id
  vpc_security_group_ids = [aws_security_group.EC2SG.id]
  tags = {
    Name = "WebServerB"
  }

}

