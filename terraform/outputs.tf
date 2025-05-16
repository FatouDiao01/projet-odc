
#######################################
# outputs.tf
#######################################
output "backend_service_node_port" {
  description = "NodePort pour le backend"
  value       = kubernetes_service.backend.spec[0].port[0].node_port
}

output "frontend_service_node_port" {
  description = "NodePort pour le frontend"
  value       = kubernetes_service.frontend.spec[0].port[0].node_port
}

output "postgres_service_cluster_ip" {
  description = "IP interne du service PostgreSQL"
  value       = kubernetes_service.postgres.spec[0].cluster_ip
}
