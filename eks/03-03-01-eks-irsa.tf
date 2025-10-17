# AWS 分区数据
data "aws_partition" "current" {}

# AWS IAM Open ID Connect Provider
resource "aws_iam_openid_connect_provider" "oidc_provider" {
  # client_id_list  = ["sts.amazonaws.com"]
  client_id_list = ["sts.${data.aws_partition.current.dns_suffix}"]
  # https://aws.amazon.com/cn/premiumsupport/knowledge-center/eks-error-invalid-identity-token/
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  # 集群OIDC-URL
  url             = aws_eks_cluster.nk_eks_cluster.identity[0].oidc[0].issuer

  tags = {
    Name = "eks-irsa"
  }
}

# 输出: AWS OIDC ARN
output "aws_iam_openid_connect_provider_arn" {
  description = "AWS IAM Open ID Connect Provider ARN"
  value       = aws_iam_openid_connect_provider.oidc_provider.arn
}

locals {
  aws_iam_oidc_connect_provider_extract_from_arn = element(split("oidc-provider/", "${aws_iam_openid_connect_provider.oidc_provider.arn}"), 1)
}
output "aws_iam_openid_connect_provider_extract_from_arn" {
  description = "AWS IAM Open ID Connect Provider extract from ARN"
  value       = local.aws_iam_oidc_connect_provider_extract_from_arn
}
