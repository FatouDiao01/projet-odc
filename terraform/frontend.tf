
#######################################
# frontend.tf
#######################################
resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "front-app"
    labels = {
      app = "front-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "front-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "front-app"
        }
      }

      spec {
        container {
          name  = "frontend-container"
          image = var.frontend_image
          image_pull_policy = "Always"

          port {
            container_port = var.frontend_port
          }

          resources {
            limits = {
              memory = "256Mi"
              cpu    = "500m"
            }
            requests = {
              memory = "128Mi"
              cpu    = "150m"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name = "front-service"
  }

  spec {
    selector = {
      app = "front-app"
    }

    port {
      port        = 80
      target_port = var.frontend_port
      node_port   = var.frontend_node_port
    }

    type = "NodePort"
  }
}
