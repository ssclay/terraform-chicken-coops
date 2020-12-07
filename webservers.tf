#Create WebServers in Private Subnets Debian 10 t2.micro
resource "aws_instance" "WebServerA" {
  ami                    = data.aws_ami.debian10.id
  instance_type          = var.instance_size
  availability_zone      = data.aws_availability_zones.available.names[0]
  subnet_id              = aws_subnet.PrivateA.id
  vpc_security_group_ids = [aws_security_group.EC2SG.id]
  user_data              = <<-USER_DATA
                              #!/bin/bash
                              apt-get update -y
                              apt-get install nginx -y
                              USER_DATA
  key_name               = var.key_name

  tags = {
    Name = "${var.vpc_name}-WebServerA"
  }

}

resource "aws_instance" "WebServerB" {
  ami                    = data.aws_ami.debian10.id
  instance_type          = var.instance_size
  availability_zone      = data.aws_availability_zones.available.names[1]
  subnet_id              = aws_subnet.PrivateB.id
  vpc_security_group_ids = [aws_security_group.EC2SG.id]
  user_data              = <<-USER_DATA
                              #!/bin/bash
                              apt-get update -y
                              apt-get install nginx -y
                              USER_DATA
  key_name               = var.key_name

  tags = {
    Name = "${var.vpc_name}-WebServerB"
  }

}

#Add Webserver Instances to Target Groups
resource "aws_lb_target_group_attachment" "WSTargetA" {
  target_group_arn = aws_lb_target_group.WebServers.arn
  target_id        = aws_instance.WebServerA.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "WSTargetB" {
  target_group_arn = aws_lb_target_group.WebServers.arn
  target_id        = aws_instance.WebServerB.id
  port             = 80
}
