#!/bin/sh
DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
mkdir -p "$DIR/logs"
/usr/sbin/httpd -f "$DIR/config/tuapp.conf" -k start
echo "Aplicacion disponible en http://127.0.0.1:8080/tuapp/"
