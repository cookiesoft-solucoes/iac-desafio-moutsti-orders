#!/bin/bash
# Atualizando e instalando RabbitMQ
sudo apt-get update -y
sudo apt-get install -y redis-server

# Configurando o Redis para permitir acesso remoto
sed -i 's/^bind 127.0.0.1/bind 0.0.0.0/' /etc/redis/redis.conf
sed -i 's/^# requirepass.*/requirepass "sua-senha-segura"/' /etc/redis/redis.conf
sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf

# Configurando persistência no Redis
sed -i 's/^# appendonly no/appendonly yes/' /etc/redis/redis.conf

# Reiniciando o Redis para aplicar as configurações
systemctl restart redis
systemctl enable redis

# Configurar usuário padrão
DEFAULT_USER="sigepub"
DEFAULT_PASS="sigepub2024"

sudo rabbitmqctl add_user $DEFAULT_USER $DEFAULT_PASS
sudo rabbitmqctl set_user_tags $DEFAULT_USER administrator
sudo rabbitmqctl set_permissions -p / $DEFAULT_USER ".*" ".*" ".*"