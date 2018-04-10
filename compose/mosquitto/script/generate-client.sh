#!/usr/bin/env bash
set -e
export LANG=C

if [ $# -ne 2 ]; then
	host=$(hostname -f)
	if [ -n "$1" ]; then
		host="$1"
	fi
else
	host=$(hostname -f)
fi

openssl genrsa -out client.key 2048
openssl req -new -out client.csr -key client.key -subj "/CN=client/O=${host}"
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAserial ./ca.srl -out client.crt -days 3650 -addtrust clientAuth