resource "helm_release" "web-app" {
    name = "web-app-release"
    chart = "./mychart"
    recreate_pods = true
    force_update = true
}
