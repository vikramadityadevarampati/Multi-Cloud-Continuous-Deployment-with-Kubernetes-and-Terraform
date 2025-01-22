# main.tf
provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "multi-cloud-eks"
  cluster_version = "1.24"
  subnets         = ["subnet-xxxxxx", "subnet-yyyyyy"]
  vpc_id          = "vpc-xxxxxx"

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }
}

output "eks_cluster_name" {
  value = module.eks.cluster_id
}
