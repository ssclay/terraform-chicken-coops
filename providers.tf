terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Where the keys should go.
provider "aws" {
  region = var.region

}
