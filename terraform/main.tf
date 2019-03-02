provider "kubernetes" {}
provider "helm" {}

/*
provider "random" {}

resource "random_string" "password" {
  length = 10
  special = false
}

variable "password" {
  type    = "string"
  default = "${random_string.password.result}"
}
*/

module "postgres" {
  source = "./postgres"
}

module "contract-service" {
  source = "./contract-service"
}

module "frontend-ui" {
  source = "./frontend-ui"
}
