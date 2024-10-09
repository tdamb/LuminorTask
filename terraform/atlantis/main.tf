resource "kubernetes_namespace" "atlantis" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "atlantis" {
  name       = "atlantis"
  repository = "https://helm.runatlantis.io"
  chart      = "atlantis"
  namespace  = var.namespace

  values = [
    templatefile("${path.module}/helm_values.yaml", {
      github_user           = var.github_user
      github_token          = var.github_token
      github_webhook_secret = var.github_webhook_secret
    })
  ]

  depends_on = [kubernetes_namespace.atlantis]
}

data "kubernetes_service" "atlantis" {
  metadata {
    name      = "atlantis"
    namespace = var.namespace
  }

  depends_on = [helm_release.atlantis]
}
