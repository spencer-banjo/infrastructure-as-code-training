variable "name" {
  description = "The name used to namespace resources created by this module"
  type        = string
}

variable "ami" {
  description = "The ID of the AMI that has Ruby on Rails installed and contains the code from the example-rails-app"
  type        = string
}

variable "key_pair_name" {
  description = "The name of a Key Pair that you've created in AWS and have saved on your computer. You will be able to use this Key Pair to SSH to the EC2 instance."
  type        = string
}

variable "port" {
  description = "The port the Ruby on Rails app should listen on for HTTP requests"
  type        = number
}

variable "vpc_name" {
  description = "The VPC name for which to attach the security group onto"
  type        = string
}

variable "subnet_name" {
  description = "The Subnet name for which to use in the VPC context"
  type        = string
}

variable "team_name" {
  type        = string
}

variable "created_by" {
  type        = string
}