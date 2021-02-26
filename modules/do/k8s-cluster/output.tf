output "kube_config" {
  value = digitalocean_kubernetes_cluster.k8s.kube_config[0].raw_config
}
