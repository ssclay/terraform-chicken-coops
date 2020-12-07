# #Create Security Group for EC2 WebServer Instances
resource "aws_security_group" "EC2SG" {
  name        = "EC2SG"
  description = "Security Group for the EC2 WebServers in Private Subnet"
  vpc_id      = aws_vpc.Hutch1.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.Hutch1.cidr_block]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.Hutch1.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2SG"
  }

}

#Create Security Group for the ELB
resource "aws_security_group" "ELBSG" {
  name        = "ELBSG"
  description = "Security Group for the ELB in Public Subnet"
  vpc_id      = aws_vpc.Hutch1.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ELBSG"
  }

}

#Create Security Group for Bastion
resource "aws_security_group" "BastionSG" {
  name        = "BastionSG"
  description = "Security Group for the Bastion"
  vpc_id      = aws_vpc.Hutch1.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "BastionSG"
  }

}
