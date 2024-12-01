output "postgres_ip" {
  value = digitalocean_droplet.database_server.ipv4_address
}

output "rabbitmq_ip" {
  value = digitalocean_droplet.rabbitmq_server.ipv4_address
}

output "redis_ip" {
  value = digitalocean_droplet.redis_server.ipv4_address
}

output "k8s_cluster_endpoint" {
  value = digitalocean_kubernetes_cluster.k8s_cluster.endpoint
  description = "O endpoint do cluster Kubernetes para acessar a API"
}

