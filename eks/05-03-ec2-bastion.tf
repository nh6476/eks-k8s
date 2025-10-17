

# module "ec2-instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "6.1.2"
#   name                   = "EKS-BastionHost"
#   ami                    = "ami-0341d95f75f311023"
#   instance_type          = "c7i-flex.large"
#   key_name               = "nk_key"
#   subnet_id              = module.nk-eks-vpc.public_subnets[0]
#   vpc_security_group_ids = [module.eks_bastion_host_sg.security_group_id]
#   iam_instance_profile   = aws_iam_instance_profile.eks_bastion_host_profile.name
#   user_data              = file("${path.module}/05-ec2-bastion.sh")
#   tags = {
#     Name = "Nk-EKS-BastionHost"
#   }
# }


resource "aws_instance" "bastion" {
  ami                    = "ami-0341d95f75f311023"
  instance_type          = "c7i-flex.large"
  key_name               = "nk_key"
  subnet_id              = module.nk-eks-vpc.public_subnets[0]
  vpc_security_group_ids = [module.eks_bastion_host_sg.security_group_id]
  iam_instance_profile   = aws_iam_instance_profile.eks_bastion_host_profile.name
  user_data              = file("${path.module}/05-03-ec2-bastion.sh")
  tags = {
    Name = "Nk-EKS-BastionHost"
  }

  lifecycle {
    prevent_destroy = true
  }
}
