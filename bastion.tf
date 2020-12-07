#Create Bastion Instance
resource "aws_instance" "Bastion" {
  ami                         = "ami-0cf5095664e10bcb5"
  instance_type               = "t2.micro"
  availability_zone           = data.aws_availability_zones.available.names[0]
  subnet_id                   = aws_subnet.PublicA.id
  vpc_security_group_ids      = [aws_security_group.BastionSG.id]
  associate_public_ip_address = true
  key_name                    = "RR2020-2"
  tags = {
    Name = "Bastion"
  }

}