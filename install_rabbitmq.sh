#!/bin/bash
# Atualizando e instalando RabbitMQ
sudo apt-get update
sudo apt-get install -y rabbitmq-server
sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management

# Configurar usuário padrão
DEFAULT_USER="moutsti"
DEFAULT_PASS="moutsti2024"

sudo rabbitmqctl add_user $DEFAULT_USER $DEFAULT_PASS
sudo rabbitmqctl set_user_tags $DEFAULT_USER administrator
sudo rabbitmqctl set_permissions -p / $DEFAULT_USER ".*" ".*" ".*"