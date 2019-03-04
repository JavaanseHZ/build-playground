provider "kubernetes" {}
provider "helm" {}
provider "random" {}

module "postgres" {
  source = "./postgres-module"
  input_database_name = "${var.database-name}"
  input_secret_name = "${kubernetes_secret.db-secret.metadata.0.name}"
}
