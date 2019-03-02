provider "kubernetes" {}

resource "kubernetes_pod" "frontend" {
  metadata {
    name = "frontend"
    labels {
      app = "frontend-ui"
    }
  }

  spec {
    container {
      name  = "nginx"
      image = "frontend-ui:kube"
      port {
        container_port = 80
      }
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name = "frontend"
  }
  spec {
    selector {
      app = "${kubernetes_pod.frontend.metadata.0.labels.app}"
    }
    port {
      port = 8888
      target_port = 80
    }
    type = "NodePort"
  }
}
