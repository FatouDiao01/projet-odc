#######################################
# providers.tf
#######################################
provider "kubernetes" {
  config_path = "~/.kube/config"  # Adapte ce chemin à ton environnement Jenkins si besoin
}
