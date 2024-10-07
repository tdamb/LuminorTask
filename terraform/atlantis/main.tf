resource "helm_release" "atlantis" {
  name       = "atlantis"
  repository = "https://helm.runatlantis.io"
  chart      = "atlantis"
  namespace  = var.namespace

  values = [file("${path.module}/helm_values.yaml")]
}
