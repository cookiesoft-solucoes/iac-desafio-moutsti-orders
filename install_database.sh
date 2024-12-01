#!/bin/bash
# Atualizando e instalando RabbitMQ
sudo apt update -y
sudo apt install -y postgresql postgresql-contrib
sudo systemctl enable postgresql
sudo systemctl start postgresql
