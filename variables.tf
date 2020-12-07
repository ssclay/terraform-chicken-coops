variable "region" {
  type    = string
  default = "us-west-2"
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type    = string
  default = "hutch"
}

variable "subnet_cidrs" {
  type = list(string)
}

variable "ami_name" {
  type = string
}

variable "instance_size" {
  type = string
}

variable "key_name" {
  type = string
}
