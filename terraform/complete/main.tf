provider "kubernetes" {}
provider "helm" {}
provider "random" {}

variable "database-name" {
  default = "my-database"
}

resource "random_string" "password" {
  length = 10
  special = false
}

resource "kubernetes_secret" "db-secret" {
  metadata {
    name = "db-password"
  }

  data {
    postgresql-password = "${random_string.password.result}"
  }
}
