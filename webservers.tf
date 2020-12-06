#Create WebServers in Private Subnets Debian 10 t2.micro
resource "aws_instance" "WebServerA" {
  ami                    = "ami-0cf5095664e10bcb5"
  instance_type          = "t2.micro"
  availability_zone      = "us-west-2a"
  subnet_id              = aws_subnet.PrivateA.id
  vpc_security_group_ids = [aws_security_group.EC2SG.id]
  user_data              = <<EOF
                            #!/bin/bash
                            apt-get update -y
                            apt-get install nginx -y
                            EOF
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
  user_data              = <<EOF
                            #!/bin/bash
                            apt-get update -y
                            apt-get install nginx -y
                            EOF
  tags = {
    Name = "WebServerB"
  }

}

