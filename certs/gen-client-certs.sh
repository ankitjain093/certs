#!/bin/bash
# ./gen-cert.sh bng-lic-jift-01

# Generate valid Client Key/Cert
openssl genrsa -passout pass:1234 -des3 -out client-$2.key 4096
openssl req -passin pass:1234 -new -key client-$2.key -out client-$2.csr -subj "/C=SP/ST=Spain/L=Valdepenias/O=Test/OU=Client/CN=$2"
openssl x509 -passin pass:1234 -req -days 365 -in client-$2.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out client-$2.crt

# Remove passphrase from Client Key
openssl rsa -passin pass:1234 -in client-$2.key -out client-$2.key

cat client-$2.crt client-$2.key > client-$2.pem
