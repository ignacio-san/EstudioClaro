#!/bin/sh
DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
/usr/sbin/httpd -f "$DIR/config/tuapp.conf" -k stop
echo "Servidor detenido."
