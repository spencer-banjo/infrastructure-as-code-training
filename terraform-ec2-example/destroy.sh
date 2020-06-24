#!/bin/bash
terraform destroy -var "created_by=$(id -un)" -var "name=$1"