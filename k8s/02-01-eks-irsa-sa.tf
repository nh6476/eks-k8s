# Resource: Kubernetes Service Account
resource "kubernetes_service_account_v1" "irsa_eks_sa" {
  metadata {
    name = "irsa-eks-sa"
    annotations = {
      "eks.amazonaws.com/role-arn" = data.terraform_remote_state.eks.outputs.irsa_iam_role_arn
    }
  }
  # automount_service_account_token = false
}
