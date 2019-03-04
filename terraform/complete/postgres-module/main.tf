resource "helm_release" "my-postgres" {

    name      = "my-postgres"
    chart     = "stable/postgresql"

    set {
        name = "postgresqlDatabase"
        value = "${var.input_database_name}"
    }
    // use existingSecret
    set {
        name = "existingSecret"
        value = "${var.input_secret_name}"
    }

    set {
        name = "service.type"
        value = "NodePort"
    }
}
