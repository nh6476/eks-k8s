# resource "aws_eip" "eks_bastion_host_eip" {
#   depends_on = [module.eks_bastionhost, module.eks-vpc]
#   instance   = module.eks_bastionhost.id
#   vpc        = true
#   tags = {
#     Name = "EKS-BastionHost-EIP"
#   }
# }
