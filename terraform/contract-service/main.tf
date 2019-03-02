provider "kubernetes" {}

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
    }
  }
}
