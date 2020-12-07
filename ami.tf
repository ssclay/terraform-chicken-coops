data "aws_ami" "debian10" {
  owners = ["aws-marketplace"]

  filter {
    name   = "name"
    values = [var.ami_name]
  }
}
