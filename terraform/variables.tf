
#######################################
# variables.tf
#######################################
variable "backend_image" {
  description = "Image Docker du backend"
  type        = string
  default     = "fatimadiao20/image-back:latest"
}

variable "frontend_image" {
  description = "Image Docker du frontend"
  type        = string
  default     = "fatimadiao20/image-front:latest"
}

variable "frontend_port" {
  description = "Port du conteneur frontend"
  type        = number
  default     = 5173
}

variable "frontend_node_port" {
  description = "NodePort pour le frontend"
  type        = number
  default     = 30517
}

variable "backend_node_port" {
  description = "NodePort pour le backend"
  type        = number
  default     = 30007
}

variable "db_username" {
  description = "Nom d'utilisateur PostgreSQL"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Mot de passe PostgreSQL"
  type        = string
  default     = "password123"
}

variable "db_name" {
  description = "Nom de la base de données"
  type        = string
  default     = "mydb"
}