provider "helm" {}
resource "helm_release" "my-postgres" {
    name      = "my-postgres"
    chart     = "stable/postgresql"

    set {
        name = "postgresqlDatabase"
        value = "my-database"
    }

    set {
        name = "postgresqlPassword"
        value = "secretpassword"
    }

    set {
        name = "service.type"
        value = "NodePort"
    }

    set {
        name = "service.nodePort"
        value = "31111"
    }
}
