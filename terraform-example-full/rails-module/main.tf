# Create an EC2 instance
resource "aws_instance" "example_rails_app" {
  ami             = var.ami
  instance_type   = "t3.micro"
  vpc_security_group_ids = [aws_security_group.example_rails_app.id]
  user_data       = data.template_file.user_data.rendered
  key_name        = var.key_pair_name

  tags = {
    Name = var.name
  }
}

# A User Data script that will run when the EC2 instance boots up and start the Ruby on Rails server
data "template_file" "user_data" {
  template = file("${path.module}/user-data.sh")

  vars = {
    port = var.port
  }
}

# A Security Group that controls what network traffic can go in and out of the EC2 instance
resource "aws_security_group" "example_rails_app" {
  name        = var.name
  description = "A Security Group for ${var.name}"
  vpc_id      = var.vpc_id

  # Inbound HTTP from anywhere
  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound SSH from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound everything
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
