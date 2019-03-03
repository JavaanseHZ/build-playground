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
        container_port = 8080
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
