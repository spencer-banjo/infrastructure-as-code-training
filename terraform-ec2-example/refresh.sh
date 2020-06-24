#!/bin/bash
terraform refresh -var "created_by=$(id -un)" -var "name=$1" -var "my_ip=$(curl -s ifconfig.me)"
