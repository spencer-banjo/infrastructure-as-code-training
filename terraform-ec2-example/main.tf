# Configure the AWS Provider
provider "aws" {
  region = var.region
}

data "aws_security_group" "selected" {
  name = var.security_group_name
}


data "external" "user" {
  program = ["./get_user_json.sh"]

  working_dir = path.module
}

data "aws_subnet" "selected" {
  filter {
    name = "tag:Name"
    values = [var.subnet_name]
  }
}


//resource "aws_security_group_rule" "my_ip" {
//  type = "ingress"
//  from_port = 22
//  # SSH
//  to_port = 22
//  protocol = 6
//  # TCP
//  cidr_blocks = [
//    "${data.external.user.result.ip}/32"
//  ]
//  security_group_id = data.aws_security_group.selected.id
//  description = data.external.user.result.name
//}

resource "aws_eip" "example_eip" {
  instance = aws_instance.example.id
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.selected.id
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  key_name = var.key_name

  tags = {
    Name = var.name
    "created-with" = "terraform"
    "team:name" = var.team_name
    "created-by" = data.external.user.result.name
  }
}
