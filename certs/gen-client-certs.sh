#!/bin/bash
# ./gen-cert.sh bng-lic-jift-01

# Generate valid Client Key/Cert
openssl genrsa -passout pass:1234 -des3 -out client-$1.key 4096
openssl req -passin pass:1234 -new -key client-$1.key -out client-$1.csr -subj "/C=SP/ST=Spain/L=Valdepenias/O=Test/OU=Client/CN=$1"
openssl x509 -passin pass:1234 -req -days 365 -in client-$1.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out client-$1.crt

# Remove passphrase from Client Key
openssl rsa -passin pass:1234 -in client-$1.key -out client-$1.key

cat client-$1.crt client-$1.key > client-$1.pem
