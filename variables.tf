variable "pvt_key" {
  description = "Caminho para a chave privada SSH"
  sensitive   = true
}

variable "do_token" {
  description = "Token de autenticação da DigitalOcean"
  sensitive   = true
}