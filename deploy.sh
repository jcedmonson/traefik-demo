#!/bin/bash

printf '(1) ------ Certificate Creation ------- \n\n'

rm -rf certs/
mkdir certs/
openssl genrsa -out certs/private.pem 4096
openssl req -new -sha256 -key certs/private.pem -out certs/private.csr
openssl req -x509 -sha256 -days 365 -key certs/private.pem -in certs/private.csr -out certs/public.pem

printf '\n(2) ------ Docker Deployment ------- \n'
docker compose up --build --force-recreate -d

printf '\n(COMPLETE)\n'
printf 'API DEMO ----- Navigate to -> https://localhost/api/demo/\n'
printf 'TRAEFIK ------ Navigate to -> http://localhost:8080/dashboard/#/\n'