variable "aws_region" {
  description = "allocation of region to deploy"
  type = string 
  default = "ap-south-1"
}
variable "instance_type" {
  description = "allocation of instance type"
  type = string 
  default = "t2.micro"
}
variable "ami_id" {
description = "allocation of ami id"
  type = string 
}
variable "key_name" {
  description = "attaching key pair"
  type = string
}
variable "vpc_github_action" {
  description = "cidr block for vpc"
  type = string
}
variable "gitaction_subnet" {
  description = "cidr block for subnet"
  type = string
}

  
