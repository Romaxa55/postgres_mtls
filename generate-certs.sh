#!/bin/bash

# Создание директорий для хранения сертификатов
mkdir -p certs/{ca,server,client}

# Генерация ключа и самоподписанного сертификата для CA
openssl req -new -x509 -days 3650 -nodes -out certs/ca/ca.crt -keyout certs/ca/ca.key -subj "/CN=CA/OU=YourOrg/O=YourOrg/C=RU"

# Генерация ключа сервера
openssl genrsa -out certs/server/server.key 2048

# Создание запроса на подпись сертификата (CSR) для сервера
openssl req -new -key certs/server/server.key -out certs/server/server.csr -subj "/CN=postgres-server/OU=YourOrg/O=YourOrg/C=RU"

# Подписание сертификата сервера с использованием CA
openssl x509 -req -in certs/server/server.csr -CA certs/ca/ca.crt -CAkey certs/ca/ca.key -CAcreateserial -out certs/server/server.crt -days 3650

# Генерация ключа клиента
openssl genrsa -out certs/client/client.key 2048

# Создание CSR для клиента
openssl req -new -key certs/client/client.key -out certs/client/client.csr -subj "/CN=postgres-client/OU=YourOrg/O=YourOrg/C=RU"

# Подписание сертификата клиента с использованием CA
openssl x509 -req -in certs/client/client.csr -CA certs/ca/ca.crt -CAkey certs/ca/ca.key -CAcreateserial -out certs/client/client.crt -days 3650

echo "Сертификаты успешно созданы."
