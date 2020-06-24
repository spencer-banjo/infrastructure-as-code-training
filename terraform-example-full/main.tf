# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

data "external" "user" {
  program = ["./get_user_json.sh"]

  working_dir = path.module
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
  vpc_name      = var.vpc_name
  subnet_name   = var.subnet_name
  created_by    = data.external.user.result.name
  team_name     = var.team_name
}

module "example_rails_app_prod" {
  # The source field can be a path on your file system or a Git URL (even a versioned one!)
  source = "./rails-module"

  # Pass parameters to the module
  name          = "Example Rails App"
  port          = 8080
  ami           = var.ami
  key_pair_name = var.key_pair_name
  vpc_name      = var.vpc_name
  subnet_name   = var.subnet_name
  created_by    = data.external.user.result.name
  team_name     = var.team_name
}
