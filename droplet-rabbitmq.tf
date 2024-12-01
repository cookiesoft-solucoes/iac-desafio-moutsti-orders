data "digitalocean_ssh_key" "default_rabbitmq" {
  name = "do_chave_infra_moutsti"  # Substitua pelo nome da chave pública já cadastrada
}

resource "digitalocean_droplet" "rabbitmq_server" {
  image  = "ubuntu-24-10-x64"
  name   = "rabbitmq-server"
  region = "nyc3"
  size   = "s-1vcpu-2gb"  # Ajuste o tamanho conforme necessário
  
  ssh_keys = [data.digitalocean_ssh_key.default_rabbitmq.id]

  # Script para instalação do RabbitMQ
  user_data = file("install_rabbitmq.sh")

}

resource "digitalocean_record" "subdomain_rabbitmq" {
  domain = "desafiomoutsti.cloud"          # Substitua pelo seu domínio principal
  type   = "A"                             # Tipo de registro DNS (A para apontar para um IPv4)
  name   = "rabbitmq"                      # Nome do subdomínio, por exemplo: "sub.example.com"
  value  = digitalocean_droplet.rabbitmq_server.ipv4_address  # O IP do droplet
}
