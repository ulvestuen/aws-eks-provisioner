#!/bin/bash
cd terraform
sed -i "s/TF_API_TOKEN/$TF_API_TOKEN/g" .terraformrc
mv .terraformrc $HOME
terraform init
terraform apply -auto-approve
