provider "kubernetes" {}

resource "kubernetes_pod" "backend" {
  metadata {
    name = "backend"
    labels {
      app = "contract-service"
    }
  }

  spec {
    container {
      name  = "backend"
      image = "contract-service:kube"
      port {
        container_port = 80
      }
      env {
        name  = "POSTGRES_ENABLED"
        value = "true"
      }
      env {
        name  = "POSTGRES_HOST"
        value = "my-postgres-postgresql.default.svc.cluster.local"
      }
      env {
        name  = "POSTGRES_PORT"
        value = "5432"
      }
      env {
        name  = "POSTGRES_DB"
        value = "my-database"
      }
      env {
        name  = "POSTGRES_USER"
        value = "postgres"
      }
      env {
        name  = "POSTGRES_PASSWORD"
        value = "secretpassword"
      }
    }
  }
}

resource "kubernetes_service" "backend" {
  metadata {
    name = "backend"
  }
  spec {
    selector {
      app = "${kubernetes_pod.backend.metadata.0.labels.app}"
    }
    port {
      port = 80
      target_port = 80
    }
  }
}
