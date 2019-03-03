resource "helm_release" "my-postgres" {

    name      = "my-postgres"
    chart     = "stable/postgresql"

    set {
        name = "postgresqlDatabase"
        value = "${var.database-name}"
    }
    // use existingSecret
    set {
        name = "existingSecret"
        value = "${kubernetes_secret.db-secret.metadata.0.name}"
    }

    set {
        name = "service.type"
        value = "NodePort"
    }
}
