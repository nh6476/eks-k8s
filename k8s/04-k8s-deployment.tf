# # Kubernetes Deployment Manifest
# resource "kubernetes_deployment_v1" "nextweb" {
#   metadata {
#     name = "nextweb-deployment"
#     labels = {
#       app = "nextweb-deployment"
#     }
#   }

#   spec {
#     replicas = 1
#     selector {
#       match_labels = {
#         app = "nextweb-deployment"
#       }
#     }
#     template {
#       metadata {
#         labels = {
#           app = "nextweb-deployment"
#         }
#       }
#       spec {
#         container {
#           image = "komavideo/deeplearnaws-nextweb:v2"
#           name  = "nextweb-container"

#           port {
#             container_port = 3000
#           }
#         }
#       }
#     }
#   }
# }
