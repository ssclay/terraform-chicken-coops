data "aws_ami" "debian10" {
  owners = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["debian-10-amd64-20200928-407-b737a64d-81d4-4b8c-92c0-25161dfcb706-ami-0fda9f4b1eaa92881.4"]
  }
}
