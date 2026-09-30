# EstudioClaro

Aplicación web estática para anotar sesiones de estudio: materia, minutos y objetivo. La lista se guarda en el navegador. El paquete publicado se sirve con Apache en `/IgnacioSanchez`.

## Estructura

- `app/` — archivos listos para el servidor (`index.html`, `css/`, `js/`, `img/`).
- `fuentes/` — CSS y JavaScript legibles, antes de minificar.
- `config/tuapp.conf` — Virtual Host de Apache (puerto 8080 y alias `/IgnacioSanchez`).
- `EstudioClaro.zip` — paquete comprimido de `app/`.

## Empaquetado

1. Los estilos y el comportamiento se escribieron en `fuentes/`.
2. Las imágenes se exportaron a JPEG comprimido dentro de `app/img/`.
3. CSS y JavaScript se minificaron como `app/css/estilos.min.css` y `app/js/app.min.js`.
4. `index.html` enlaza solo esos archivos minificados.
5. `EstudioClaro.zip` contiene la carpeta de publicación, sin configuración del servidor ni fuentes sin minificar.

## Versionamiento

La rama `main` registra un commit por cada cierre de etapa: página inicial, optimización y minificación, este documento, la configuración de Apache y el ajuste del script de arranque.

Para publicar el repositorio en GitHub o GitLab hace falta Git en el equipo y una cuenta propia:

```bash
git remote add origin URL-DEL-REPOSITORIO
git push -u origin main
```

## Servidor

La definición de referencia está en `config/tuapp.conf`: escucha en el puerto 8080, `ServerName localhost` y el alias `/IgnacioSanchez` apunta a la carpeta `app/`.

```bash
sh iniciar-servidor.sh
```

El script copia `app/` a un directorio de ejecución y arranca Apache con ese Virtual Host. En macOS, el proceso de Apache a veces no puede leer el Escritorio; la copia evita ese bloqueo. Abrir `/IgnacioSanchez`.

```bash
sh detener-servidor.sh
```

El puerto 80 no se usa porque en este sistema exige permisos de administrador. El puerto queda declarado en la directiva `Listen`.
