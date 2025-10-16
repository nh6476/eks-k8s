# Kubernetes Service Manifest (Type: Load Balancer)
resource "kubernetes_service_v1" "nextweb-service-nlb" {
  metadata {
    name = "nextweb-service-nlb"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }    
  }
  spec {
    selector = {
      # app = kubernetes_deployment_v1.nextweb.spec.0.selector.0.match_labels.app      
      app = "nextweb-deployment"
    }
    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}