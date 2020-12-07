# terraform-chicken-coops
A beginner's adventure through AWS and Terraform referencing chickens, the animal that is owned by many people but not universally treated as a pet.

# Architecture
All infrastructure is built in AWS using terraform.
This repo creates a VPC with 4 subnets (2 Private, 2 Public, spread across 2 availability zones), an ELB, 2 nginx webservers located in the Private subnets, and a Bastion host.

# Setup
1. Install terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli

1. Git clone the repo.

1. terraform init

1. terraform plan -out '<name>.plan'

1. terraform apply '<name>.plan'

1. go to your aws console and check out what gets built.

# TODO
1. Add nice bash script for user_data input.
1. Apply best practices to Access control lists and security groups.
1. Use actual IAM roles
1. Be able to deal with different keys.
1. Setup Management subnet for bastion host.
1. Monitoring.
1. CI/CD to change the nginx webserver.
1. Improve naming conventions.
