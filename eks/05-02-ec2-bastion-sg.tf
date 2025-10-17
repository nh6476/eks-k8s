module "eks_bastion_host_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.9.0"

  name        = "eks-bastion-host-sg"
  description = "Security Group with SSH port open for EKS Bastion Host."
  vpc_id      = module.nk-eks-vpc.vpc_id
  # 进站规则
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # 出站规则
  egress_rules = ["all-all"]

  tags = {
    Name = "EKS-BastionHost-SG"
  }
}
