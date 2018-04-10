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

cp ${host}.crt /etc/mosquitto/certs/server.crt
cp ${host}.key /etc/mosquitto/certs/server.key
cp ca.crt /etc/mosquitto/ca_certificates
