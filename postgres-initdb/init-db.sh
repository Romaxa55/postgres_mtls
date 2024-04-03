#!/bin/sh
set -e

# Путь к pg_hba.conf внутри контейнера.
PG_HBA=/var/lib/postgresql/data/pg_hba.conf

# Создаем бэкап файла pg_hba.conf
cp $PG_HBA $PG_HBA.backup

# Очищаем файл pg_hba.conf и добавляем наши правила
cat << EOF > $PG_HBA
# "local" is for Unix domain socket connections only
local   all             all                                     trust
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
# IPv6 local connections:
host    all             all             ::1/128                 trust
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     trust
host    replication     all             127.0.0.1/32            trust
host    replication     all             ::1/128                 trust

# Custom rules
hostssl all             all        0.0.0.0/0                    cert clientcert=verify-full
EOF

echo "Custom pg_hba.conf has been configured."
