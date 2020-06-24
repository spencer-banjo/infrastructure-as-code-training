variable "region" {}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

variable "team_name" {}
variable "created_by" {}

# EC2 & networking resource vars
variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_name" {}
//variable "my_ip" {}
variable "ec2_username" {}

# AWS key pair resource vars
variable "key_name" {}
//variable "local_key_path" {}

variable "name" {
  description = "The name of the EC2 instance"
  default = "terraform-ec2"
}

data "aws_security_group" "selected" {
  name = var.security_group_name
}


//resource "aws_security_group_rule" "my_ip" {
//  type = "ingress"
//  from_port = 22 # SSH
//  to_port = 22
//  protocol = 6 # TCP
//  cidr_blocks = [
//    "${var.my_ip}/32"
//  ]
//  security_group_id = data.aws_security_group.selected.id
//  description = var.created_by
//}

resource "aws_eip" "example_eip" {
  instance = aws_instance.example.id
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami                     = var.ami
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = [data.aws_security_group.selected.id]
  key_name                = var.key_name

  tags = {
      Name            = var.name
      "created-with"  = "terraform"
      "team:name"     = var.team_name
      "created-by"    = var.created_by
  }
}
