# resource "aws_eip" "eks_bastion_host_eip" {
#   depends_on = [aws_instance.bastion, module.nk-eks-vpc]
#   instance   = aws_instance.bastion.id
#   # vpc        = true
#   tags = {
#     Name = "EKS-BastionHost-EIP"
#   }
# }
