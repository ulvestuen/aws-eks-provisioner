#!/bin/bash
cd terraform
sed -i "s/TF_API_TOKEN/$TF_API_TOKEN/g" .terraformrc
sed -i "s/INSTANCE_TYPE/$INSTANCE_TYPE/g" eks-cluster.tf
sed -i "s/ASG_DESIRED_CAPACITY/$ASG_DESIRED_CAPACITY/g" eks-cluster.tf
sed -i "s/ASG_MAX_SIZE/$ASG_MAX_SIZE/g" eks-cluster.tf
sed -i "s/ASG_MIN_SIZE/$ASG_MIN_SIZE/g" eks-cluster.tf
mv .terraformrc $HOME
terraform init
terraform apply -auto-approve
echo "::set-output name=region::$(terraform output region)"
echo "::set-output name=cluster_name::$(terraform output cluster_name)"
