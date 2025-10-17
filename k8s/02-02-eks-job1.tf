# Resource: Kubernetes Job
resource "kubernetes_job_v1" "eks_job1" {
  # EKS 依赖角色
  depends_on = [
    kubernetes_service_account_v1.irsa_eks_sa
  ]

  metadata {
    name = "eks-job1"
  }
  spec {
    template {
      metadata {
        labels = {
          app = "eks-job1"
        }
      }
      spec {
        # 赋予 Job 的服务角色
        service_account_name = kubernetes_service_account_v1.irsa_eks_sa.metadata.0.name
        container {
          name  = "eks-job1"
          image = "amazon/aws-cli:latest"
          # 列出存储桶
          args = ["s3", "ls"]
          # 列出 DynamoDB 表一览
          # args  = ["dynamodb", "list-tables"]
        }
        restart_policy = "Never"
      }
    }
  }
}




# [ec2-user@ip-172-31-25-142 k8s]$ kubectl get job
# NAME       COMPLETIONS   DURATION   AGE
# eks-job1   1/1           12s        10m
# [ec2-user@ip-172-31-25-142 k8s]$ kubectl logs -f -l app=eks-job1
# 2025-10-15 00:28:17 do-not-delete-ssm-diagnosis-708365820815-us-east-1-a2xpc
# 2025-10-15 11:19:29 eks-backend-bucket-2025-10-15
# 2025-10-15 11:19:29 k8s-backend-bucket-2025-10-15
# [ec2-user@ip-172-31-25-142 k8s]$ 
# [ec2-user@ip-172-31-25-142 k8s]$ kubectl describe job eks-job1
# Name:           eks-job1
# Namespace:      default    
#kubectl describe pod eks-job1-12345 
# 确认 Job 生成的日志 
#kubectl logs -f -l app=eks-job1 
#重新启动 Job 
# terraform apply -replace kubernetes_job_v1.eks_job1 -auto-approve
# 删除 Job 
#kubectl delete job eks-job1