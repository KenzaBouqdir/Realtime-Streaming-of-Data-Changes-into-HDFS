# create-ssl.sh
#!/bin/bash

# Generate root CA key and certificate
openssl genrsa -out ssl/private/root.key 2048
openssl req -x509 -new -nodes -key ssl/private/root.key -sha256 -days 1024 -out ssl/certs/root.crt -subj "/CN=RootCA"

# Generate server key and CSR
openssl genrsa -out ssl/private/server.key 2048
openssl req -new -key ssl/private/server.key -out ssl/private/server.csr -subj "/CN=postgres"

# Sign the server certificate
openssl x509 -req -in ssl/private/server.csr -CA ssl/certs/root.crt -CAkey ssl/private/root.key -CAcreateserial -out ssl/certs/server.crt -days 365 -sha256

# Set correct permissions
chmod 600 ssl/private/*.key
chmod 644 ssl/certs/*.crt