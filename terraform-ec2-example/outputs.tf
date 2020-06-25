output "public_ip" {
  value = aws_instance.example.public_ip
}

output "ssh_connection" {
  value = "ssh -i ${var.key_name}.pem ${var.ec2_username}@${aws_instance.example.public_ip}"
}
