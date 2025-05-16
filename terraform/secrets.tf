
#######################################
# secrets.tf
#######################################
resource "kubernetes_secret" "postgres_secret" {
  metadata {
    name = "postgres-secret"
  }

  data = {
    username = base64encode(var.db_username)
    password = base64encode(var.db_password)
  }

  type = "Opaque"
}