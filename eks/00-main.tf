terraform {
 required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  required_version = ">= 1.5.6"

  backend "s3" {
    bucket         = "eks-backend-bucket-2025-10-15"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "eks-terraform-locks"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


###########################################################
# resource "aws_s3_bucket" "eks-backend-bucket" {
#   bucket = "eks-backend-bucket-2025-10-15"
#   acl = "private"
#   versioning {
#         enabled = true
#     }
# }
###########################################################
# resource "aws_s3_bucket" "k8s-backend-bucket" {
#   bucket = "k8s-backend-bucket-2025-10-15"
#   acl = "private"
#   versioning {
#         enabled = true
#     }
# }
###########################################################
# resource "aws_dynamodb_table" "eks-terraform-locks" {
#   name         = "eks-terraform-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }
###########################################################
# resource "aws_dynamodb_table" "k8s-terraform-locks" {
#   name         = "k8s-terraform-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }