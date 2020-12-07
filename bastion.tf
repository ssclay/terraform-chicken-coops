#Create Bastion Instance
resource "aws_instance" "Bastion" {
  ami                         = data.aws_ami.debian10.id
  instance_type               = var.instance_size
  availability_zone           = data.aws_availability_zones.available.names[0]
  subnet_id                   = aws_subnet.PublicA.id
  vpc_security_group_ids      = [aws_security_group.BastionSG.id]
  associate_public_ip_address = true
  key_name                    = var.key_name
  tags = {
    Name = "Bastion"
  }

}
