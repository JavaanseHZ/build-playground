module "postgres" {
  source = "./postgres"
}

module "contract-service" {
  source = "./contract-service"
}

module "frontend-ui" {
  source = "./frontend-ui"
}
