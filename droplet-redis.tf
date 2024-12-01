data "digitalocean_ssh_key" "default_redis" {
  name = "do_chave_infra_moutsti"  # Substitua pelo nome da chave pública já cadastrada
}

resource "digitalocean_droplet" "redis_server" {
  image  = "ubuntu-24-10-x64"
  name   = "redis-server"
  region = "nyc3"
  size   = "s-1vcpu-2gb"  # Ajuste o tamanho conforme necessário
  
  ssh_keys = [data.digitalocean_ssh_key.default_redis.id]

  # Script para instalação do Redis
  user_data = file("install_redis.sh")

}

resource "digitalocean_record" "subdomain_redis" {
  domain = "desafiomoutsti.cloud"                           # Substitua pelo seu domínio principal
  type   = "A"                                              # Tipo de registro DNS (A para apontar para um IPv4)
  name   = "redis"                                          # Nome do subdomínio, por exemplo: "sub.example.com"
  value  = digitalocean_droplet.redis_server.ipv4_address   # O IP do droplet
}
