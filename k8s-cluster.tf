resource "digitalocean_kubernetes_cluster" "k8s_cluster" {
  name    = "erp-k8s-cluster"
  region  = "nyc3"
  version = "1.31.1-do.4"  # Verifique a versão atual

  node_pool {
    name       = "default-pool"
    size       = "s-4vcpu-8gb"  # Ajuste conforme sua necessidade
    node_count = 3
    auto_scale = false
    min_nodes  = 3
    max_nodes  = 5
  }

  # Exporta o kubeconfig para o provedor Kubernetes
  provisioner "local-exec" {
    command = <<EOT
    doctl kubernetes cluster kubeconfig save ${self.name}
    EOT
  }

}

