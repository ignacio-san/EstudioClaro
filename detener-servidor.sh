#!/bin/sh
if [ -f /tmp/estudioclaro-run/tuapp.conf ]; then
  /usr/sbin/httpd -f /tmp/estudioclaro-run/tuapp.conf -k stop
  echo "Servidor detenido."
else
  if [ -f /tmp/estudioclaro-httpd.pid ]; then
    kill "$(cat /tmp/estudioclaro-httpd.pid)"
    echo "Servidor detenido."
  else
    echo "No hay un servidor iniciado."
  fi
fi
