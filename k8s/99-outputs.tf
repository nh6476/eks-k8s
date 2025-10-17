output "irsa-role-arn" {
  description = "irsa-role-arn"
  value       = data.terraform_remote_state.eks.outputs.irsa_iam_role_arn
}


