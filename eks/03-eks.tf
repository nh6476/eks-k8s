# 建立 AWS EKS 集群
resource "aws_eks_cluster" "nk_eks_cluster" {
  # EKS 依赖角色
  depends_on = [
    module.nk-eks-vpc,
    aws_iam_role_policy_attachment.terraform-eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.terraform-eks-AmazonEKSVPCResourceController,
  ]

  name     = "terraform-eks"
  role_arn = aws_iam_role.nk_eks_master_role.arn
  version  = "1.29"

  vpc_config {
    subnet_ids              = module.nk-eks-vpc.public_subnets
    endpoint_private_access = false
    endpoint_public_access  = true          # 启用了 Amazon EKS 公共 API 服务器终端节点
    public_access_cidrs     = ["0.0.0.0/0"] # 公有终端节点允许存取的 IP 范围
  }

  kubernetes_network_config {
    # 用于分配 Kubernetes 内部服务的 IP CIDR 块
    service_ipv4_cidr = "172.30.0.0/16"
  }

  # 启用 EKS 日志
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}
