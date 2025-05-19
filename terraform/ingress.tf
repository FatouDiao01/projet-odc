resource "kubernetes_ingress_v1" "myapp_ingress" {
  metadata {
    name = "myapp-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    ingress_class_name = "nginx"

    # Règle pour le frontend (myapp.local)
    rule {
      host = "myapp.local"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.frontend.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    # Règle pour le backend (api.local)
    rule {
      host = "api.local"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service.backend.metadata[0].name
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
}
