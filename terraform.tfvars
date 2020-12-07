region        = "us-west-2"
vpc_name      = "Hen"
vpc_cidr      = "172.32.0.0/18"
subnet_cidrs  = ["172.32.0.0/20", "172.32.16.0/20", "172.32.32.0/20", "172.32.48.0/20"]
ami_name      = "debian-10-amd64-20200928-407-b737a64d-81d4-4b8c-92c0-25161dfcb706-ami-0fda9f4b1eaa92881.4"
instance_size = "t2.micro"
key_name      = "RR2020-2"