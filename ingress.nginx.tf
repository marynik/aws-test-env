resource "helm_release" "ingress-nginx" {
  name = "ingress-nginx-release"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"
}

