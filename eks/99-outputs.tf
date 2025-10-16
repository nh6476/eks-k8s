output "aws_region" {
  # AWS 区域
  value = var.aws_region
}

# EKS 集群输出
output "cluster_id" {
  description = "Cluster ID"
  value       = aws_eks_cluster.nk_eks_cluster.id
}
output "cluster_arn" {
  description = "Cluster ARN"
  value       = aws_eks_cluster.nk_eks_cluster.arn
}
output "cluster_endpoint" {
  description = "Cluster endpoint"
  value       = aws_eks_cluster.nk_eks_cluster.endpoint
}
output "cluster_certificate_authority_data" {
  description = "Cluster certificate-authority-data"
  value       = aws_eks_cluster.nk_eks_cluster.certificate_authority[0].data
}
output "cluster_version" {
  description = "Cluster version"
  value       = aws_eks_cluster.nk_eks_cluster.version



}


