#!/bin/sh
DIR=$(CDPATH= cd -- "$(dirname "$0")" && pwd)
RUN="/tmp/estudioclaro-run"
rm -rf "$RUN"
mkdir -p "$RUN/app" "$RUN/vacio" "$RUN/logs"
cp -R "$DIR/app/." "$RUN/app/"
cp "$DIR/vacio/index.html" "$RUN/vacio/index.html"
cat > "$RUN/tuapp.conf" << EOF
ServerRoot "/usr"
ServerName localhost
Listen 127.0.0.1:8080
PidFile "/tmp/estudioclaro-httpd.pid"
Mutex file:/tmp
ErrorLog "$RUN/logs/error.log"
CustomLog "$RUN/logs/access.log" common
LoadModule mpm_prefork_module libexec/apache2/mod_mpm_prefork.so
LoadModule authn_core_module libexec/apache2/mod_authn_core.so
LoadModule authz_core_module libexec/apache2/mod_authz_core.so
LoadModule authz_host_module libexec/apache2/mod_authz_host.so
LoadModule mime_module libexec/apache2/mod_mime.so
LoadModule log_config_module libexec/apache2/mod_log_config.so
LoadModule dir_module libexec/apache2/mod_dir.so
LoadModule alias_module libexec/apache2/mod_alias.so
LoadModule unixd_module libexec/apache2/mod_unixd.so
TypesConfig /private/etc/apache2/mime.types
AddType text/css .css
AddType application/javascript .js
DirectoryIndex index.html
DocumentRoot "$RUN/vacio"
<Directory "$RUN/vacio">
    Require all granted
</Directory>
<VirtualHost 127.0.0.1:8080>
    ServerName localhost
    Alias /IgnacioSanchez "$RUN/app"
    <Directory "$RUN/app">
        Options FollowSymLinks
        AllowOverride None
        Require all granted
        DirectoryIndex index.html
    </Directory>
</VirtualHost>
EOF
if [ -f /tmp/estudioclaro-httpd.pid ]; then
  kill "$(cat /tmp/estudioclaro-httpd.pid)" 2>/dev/null || true
  sleep 1
fi
/usr/sbin/httpd -f "$RUN/tuapp.conf" -k start
echo "Aplicacion disponible en /IgnacioSanchez"
