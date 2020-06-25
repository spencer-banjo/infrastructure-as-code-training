# Overhead and tagging vars
variable "region" {
  description = "AWS Region resource context"
  type        = string
}
variable "team_name" {
  description = "Acceptable team name according to: https://banjoinc.atlassian.net/wiki/spaces/THT/pages/1308656081/Sandbox+AWS+Account#Mandatory-Tags"
  type        = string
}

# EC2 & networking resource vars
variable "ami" {
  description = "A region-specific AMI identifier that is supported by your instance type declaration - i.e. 'ami-*'"
  type        = string
}

variable "instance_type" {
  description = "Instance type declaration - i.e. 'g4dn.xlarge'"
  type        = string
}
variable "subnet_name" {
  description = "Subnet name to filter by within specified non-default VPC"
  type        = string
}

variable "security_group_name" {
  description = "Security group name to filter by for non-default VPC-backed security group"
  type        = string
}

variable "ec2_username" {
  description = "Default username for EC2 instance/AMI"
  default     = "ubuntu"
  type        = string
}

# AWS key pair resource vars
variable "key_name" {
  description = "Reference to EXISTING key pair name in respective AWS account and region context"
  type        = string
}

variable "name" {
  description = "The name of the EC2 instance"
  default     = "terraform-ec2"
  type        = string
}

variable "root_device_volume_size" {
  description = "The amount of GiB of Volume Size to allocate for the EC2 instance root device storage"
  type        = string
}