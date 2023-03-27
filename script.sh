#!/bin/bash

#Cria o diretório que será volume do container analytics
mkdir analytics

#Starta os containers
docker-compose up -d

# Definir variáveis do container de origem
CONTAINER_ORIGEM="transactional"
DB_ORIGEM_NAME="dvdrental"
CONTAINER_DESTINO="analytics"
DB_DESTINO_NAME="analytics"
USER="postgres"
PASSWORD="password"

# Definir variáveis do arquivo de backup
BACKUP_FILE_NAME="analytics_dvdrental.sql"
BACKUP_FILE_PATH="./analytics/$BACKUP_FILE_NAME"

# Extrair o banco de dados de origem e criar o arquivo de backup
docker exec -it -e PGPASSWORD="$PASSWORD" $CONTAINER_ORIGEM pg_dump -U $USER -Fc $DB_ORIGEM_NAME > $BACKUP_FILE_PATH

# Carregar o banco de dados de destino com o arquivo de backup
docker exec -i -e PGPASSWORD="$PASSWORD" $CONTAINER_DESTINO pg_restore -U $USER -C -d $DB_DESTINO_NAME < $BACKUP_FILE_PATH

