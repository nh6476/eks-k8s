###########################################################
# Terraform 基本设置
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.12.1"
    }
  }


  backend "s3" {
    bucket         = "k8s-backend-bucket-2025-10-15"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "k8s-terraform-locks"
  }



  required_version = ">= 1.2.5"
}

###########################################################
# 提供商设置(云平台)
provider "aws" {
  profile = "default"
  region  = data.terraform_remote_state.eks.outputs.aws_region
}

provider "kubernetes" {
  # Configuration options
  host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}