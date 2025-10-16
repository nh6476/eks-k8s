module "nk-eks-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.4.0"
  name = "nk-eks-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]
  private_subnets = ["10.0.21.0/24", "10.0.22.0/24"]
  map_public_ip_on_launch = true
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false



  # 公有网段 TagName
  public_subnet_tags = {
    "Name" = "nk-eks-public-subnets"
  }
  # 私有网段 TagName
  private_subnet_tags = {
    "Name" = "nk-eks-private-subnets"
  }

  # 共同标签
  tags = {
    Owner = "NK-AWS"
    Env   = "dev"
  }
  vpc_tags = {
    Name = "nk-eks-vpc"
  }
  enable_dns_hostnames = true
  enable_dns_support   = true
  
}












