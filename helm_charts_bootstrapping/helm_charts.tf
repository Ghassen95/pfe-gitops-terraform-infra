resource "helm_release" "cert-manager-chart" {
  name             = "cert-manager"
  repository       = "https://raw.githubusercontent.com/Ghassen95/pfe-gitops-demo/helm"
  chart            = "helm/cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  lint             = true
  cleanup_on_fail  = true
  depends_on = [
    azurerm_kubernetes_cluster.aks_cluster
  ]
}

resource "helm_release" "nginx-ingress-chart" {
  name             = "nginx-ingress"
  repository       = "https://raw.githubusercontent.com/Ghassen95/pfe-gitops-demo/helm"
  chart            = "helm/ingress-nginx"
  namespace        = "nginx-ingress"
  create_namespace = true
  lint             = true
  cleanup_on_fail  = true
  depends_on = [
    azurerm_kubernetes_cluster.aks_cluster
  ]
}

resource "helm_release" "kube-prometheus-stack-chart" {
  name             = "kube-prometheus-stack"
  repository       = "https://raw.githubusercontent.com/Ghassen95/pfe-gitops-demo/helm"
  chart            = "helm/kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true
  lint             = true
  cleanup_on_fail  = true
  depends_on = [
    azurerm_kubernetes_cluster.aks_cluster
  ]
}

resource "helm_release" "prometheus-blackbox-exporter-chart" {
  name             = "prometheus-blackbox-exporter"
  repository       = "https://raw.githubusercontent.com/Ghassen95/pfe-gitops-demo/helm"
  chart            = "helm/prometheus-blackbox-exporter"
  namespace        = "monitoring"
  create_namespace = true
  lint             = true
  cleanup_on_fail  = true
  depends_on = [
    azurerm_kubernetes_cluster.aks_cluster
  ]
}

resource "helm_release" "secrets-store-csi-driver-chart" {
  name             = "secrets-store-csi-driver"
  repository       = "https://raw.githubusercontent.com/Ghassen95/pfe-gitops-demo/helm"
  chart            = "helm/secrets-store-csi-driver"
  namespace        = "kube-system"
  create_namespace = true
  lint             = true
  cleanup_on_fail  = true
  depends_on = [
    azurerm_kubernetes_cluster.aks_cluster
  ]
}
