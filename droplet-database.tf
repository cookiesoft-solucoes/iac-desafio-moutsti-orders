data "digitalocean_ssh_key" "default_database" {
  name = "do_chave_infra_moutsti"  # Substitua pelo nome da chave pública já cadastrada
}

resource "digitalocean_droplet" "database_server" {
  image  = "ubuntu-24-10-x64"
  name   = "database-server"
  region = "nyc3"
  size   = "s-4vcpu-8gb"  # Ajuste o tamanho conforme necessário
  
  ssh_keys = [data.digitalocean_ssh_key.default_database.id]

  user_data = file("install_database.sh")
}

resource "digitalocean_record" "subdomain_database" {
  domain = "desafiomoutsti.cloud"                              # Substitua pelo seu domínio principal
  type   = "A"                                                 # Tipo de registro DNS (A para apontar para um IPv4)
  name   = "database"                                          # Nome do subdomínio, por exemplo: "sub.example.com"
  value  = digitalocean_droplet.database_server.ipv4_address   # O IP do droplet
}
