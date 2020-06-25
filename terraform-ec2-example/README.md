# terraform-ec2-example

### See `terraform.tfvars` for NVIDIA Docker-supported GPU launch var values

### Streamlined Terraform commands
```
terraform init 
# make sure you have Terraform installed properly and are inside
# your AWS env
terraform plan -var name="..."
terraform apply -var name="..."

# teardown resources
terraform destroy -var name="..."
```

`get_user_json.sh` should be executable, if not:
```buildoutcfg
chmod a+x ./get_user_json.sh # before running 'terraform (plan | apply)'
```

After, you need to use your .pem file to access the running instance 
according to the `ssh_connection` output value
