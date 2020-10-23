#!/bin/bash
cd terraform
sed -i "s/TF_API_TOKEN/$1/g" .terraformrc
mv .terraformrc $HOME
terraform init
terraform apply -auto-approve
