terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.33.0" # Use a versão mais recente
    }
  }
}

variable "do_token" {}
variable "pvt_key" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = "do_chave_infra_moutsti"
} 

# Provedor Kubernetes
provider "kubernetes" {
  host           = digitalocean_kubernetes_cluster.k8s_cluster.endpoint
  config_path    = "~/.kube/config"               # Caminho para o kubeconfig
  config_context = "do-nyc3-erp-k8s-cluster"      # Contexto do cluster (ajuste conforme necessário)
}
