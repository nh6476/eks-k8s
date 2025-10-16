# Terraform Remote State Datasource
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket         = "eks-backend-bucket-2025-10-15"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    profile        = "default"
  }
}

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}


