# # Install EBS CSI Driver using HELM
# # Resource: Helm Release 
# resource "helm_release" "ebs_csi_driver" {
#   name = "terraform-eks-aws-ebs-csi-driver"
#   repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
#   chart      = "aws-ebs-csi-driver"
#   namespace = "kube-system"
  
#   set = [
#     {
#     name = "image.repository"
#     value = "public.ecr.aws/ebs-csi-driver/aws-ebs-csi-driver"
#     },
#     # 建立 K8S 服务账号
#     {
#       name  = "controller.serviceAccount.create"
#       value = "true"
#     },
#     # 服务账号: ebs-csi-controller-sa
#     {
#       name  = "controller.serviceAccount.name"
#       value = "ebs-csi-controller-sa"
#     },
#     # 链接服务账号到 IAM 角色
#     {
#       name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#       value = data.terraform_remote_state.eks.outputs.ebs_csi_iam_role_arn
#     }
#   ]
# }


# # 输出 EBS CSI
# output "ebs_csi_helm_metadata" {
#   description = "Metadata Block outlining status of the deployed release."
#   value       = helm_release.ebs_csi_driver.metadata
# }
