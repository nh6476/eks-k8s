# 使用 EKS Add-Ons 安装 EBS CSI 驱动程序
resource "aws_eks_addon" "eks_addon_csi_driver" {
  cluster_name             = data.terraform_remote_state.eks.outputs.cluster_id
  addon_name               = "aws-ebs-csi-driver"
  service_account_role_arn = data.terraform_remote_state.eks.outputs.ebs_csi_iam_role_arn
}
