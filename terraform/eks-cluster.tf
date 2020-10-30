module "eks" {
  source = "github.com/terraform-aws-modules/terraform-aws-eks"
  cluster_name = local.cluster_name
  cluster_version = "1.18"
  subnets = module.vpc.private_subnets

  tags = {
    Environment = "test"
  }

  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      name = "worker-group-1"
      instance_type = "INSTANCE_TYPE"
      asg_desired_capacity = "ASG_DESIRED_CAPACITY"
      asg_max_size = "ASG_MAX_SIZE"
      asg_min_size = "ASG_MIN_SIZE"
      additional_security_group_ids = [
        aws_security_group.worker_group_mgmt.id
      ]
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
