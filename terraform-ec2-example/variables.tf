variable "region" {}
variable "team_name" {}

# EC2 & networking resource vars
variable "ami" {}
variable "instance_type" {}
variable "subnet_name" {}
variable "security_group_name" {}
variable "ec2_username" {}

# AWS key pair resource vars
variable "key_name" {}

variable "name" {
  description = "The name of the EC2 instance"
  default     = "terraform-ec2"
}