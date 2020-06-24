#!/bin/bash
terraform plan -var "created_by=$(id -un)" -var "name=$1"
