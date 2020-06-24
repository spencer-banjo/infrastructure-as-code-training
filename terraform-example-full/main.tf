# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# This shows an example of how to use a Terraform module.

module "example_rails_app_stage" {
  # The source field can be a path on your file system or a Git URL (even a versioned one!)
  source = "./rails-module"

  # Pass parameters to the module
  name          = "Example Rails App (Stage)"
  port          = 3000
  ami           = var.ami
  key_pair_name = var.key_pair_name
  vpc_id        = var.vpc_id
  subnet_id     = var.subnet_id
}

module "example_rails_app_prod" {
  # The source field can be a path on your file system or a Git URL (even a versioned one!)
  source = "./rails-module"

  # Pass parameters to the module
  name          = "Example Rails App"
  port          = 8080
  ami           = var.ami
  key_pair_name = var.key_pair_name
  vpc_id        = ""
  subnet_id     = ""
}
