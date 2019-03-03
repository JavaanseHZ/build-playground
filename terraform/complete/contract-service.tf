resource "kubernetes_pod" "backend" {
  //explicit, but not necessary because of reference to my-postgres NodePort
  depends_on = ["helm_release.my-postgres",]

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
        container_port = 8080
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
        value = "${var.database-name}"
      }
      env {
        name  = "POSTGRES_USER"
        value = "postgres"
      }
      env {
        name  = "POSTGRES_PASSWORD"
        value_from {
          secret_key_ref {
            name = "${kubernetes_secret.db-secret.metadata.0.name}"
            key = "postgresql-password"
          }
        }
      }
      readiness_probe {
        http_get {
          path = "/actuator/readiness"
          port = 8080
        }
        initial_delay_seconds = 20
        timeout_seconds = 300
      }
      liveness_probe {
        http_get {
          path = "/actuator/health"
          port = 8080
        }
        initial_delay_seconds = 20
        timeout_seconds = 60
        failure_threshold = 10
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
      target_port = 8080
    }
  }
}
