# terraform-ec2-example

### See `terraform.tfvars` for NVIDIA Docker-supported GPU launch var values

### Streamlined Terraform commands
```
terraform init # make sure you have Terraform installed properly and are inside your AWS env
... plan *
... apply *


After, you need to use your .pem file to access the running instance
```
ssh -i '/path/to/your/${key_name}.pem' ${ec2-user}@${elastic_ipv4}
```
