#######################################
# providers.tf
#######################################
provider "kubernetes" {
  config_path = "/var/lib/jenkins/.kube/config"
}
