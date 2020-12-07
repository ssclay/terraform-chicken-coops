variable "region" {
  type    = string
  default = "us-west-2"
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_cidrs" {
  type = list(string)
}
