# terraform-ec2-example

### See `terraform.tfvars` for NVIDIA Docker-supported GPU launch var values

### Streamlined Terraform commands
```
terraform init # make sure you have Terraform installed properly and are inside your AWS env
./plan.sh ${INSTANCE_NAME}
./apply.sh ${INSTANCE_NAME}
./destroy.sh ${INSTANCE_NAME}
```

Each `bash` executable will leverage your local machine's current username and external IP address to tag the creation 
name and whitelist your IP under the corresponding inbound rules for SSH/TCP for your specified
security group (`name` value passed through `terraform.tfvars`)


After, you need to use your .pem file to access the running instance
```
ssh -i '/path/to/your/${key_name}.pem' ${ec2-user}@${elastic_ipv4}
```
