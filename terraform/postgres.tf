resource "helm_release" "my-postgres" {

    name      = "my-postgres"
    chart     = "stable/postgresql"

    set {
        name = "postgresqlDatabase"
        value = "${var.database_name}"
    }

    /*set {
        name = "postgresqlPassword"
        value = "${random_string.password.result}"
    }*/

    set {
        name = "service.type"
        value = "NodePort"
    }
}
