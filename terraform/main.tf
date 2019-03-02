provider "kubernetes" {}
provider "helm" {}
provider "random" {}

variable "database_name" {
  default = "my-database"
}

resource "random_string" "password" {
  length = 10
  special = false
}
