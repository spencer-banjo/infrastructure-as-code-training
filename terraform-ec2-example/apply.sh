#!/bin/bash
terraform apply -var "created_by=$(id -un)" -var "name=$1"
