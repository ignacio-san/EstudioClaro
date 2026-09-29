# EstudioClaro

Aplicación web estática para anotar sesiones de estudio: materia, minutos y objetivo. La lista se guarda en el navegador. El paquete publicado se sirve con Apache en `http://127.0.0.1:8080/tuapp/`.

## Estructura

- `app/` — archivos listos para el servidor (`index.html`, `css/`, `js/`, `img/`).
- `fuentes/` — CSS y JavaScript legibles, antes de minificar.
- `config/tuapp.conf` — Virtual Host de Apache (puerto 8080 y alias `/tuapp`).
- `EstudioClaro.zip` — paquete comprimido de `app/`.

## Empaquetado

1. Los estilos y el comportamiento se escribieron en `fuentes/`.
2. Las imágenes se exportaron a JPEG comprimido dentro de `app/img/`.
3. CSS y JavaScript se minificaron como `app/css/estilos.min.css` y `app/js/app.min.js`.
4. `index.html` enlaza solo esos archivos minificados.
5. `EstudioClaro.zip` contiene la carpeta de publicación, sin configuración del servidor ni fuentes sin minificar.

## Versionamiento

La rama `main` registra cuatro commits, uno por cada cierre de etapa: página inicial, optimización y minificación, este documento y la configuración de Apache.

Para publicar el repositorio en GitHub o GitLab hace falta Git en el equipo y una cuenta propia:

```bash
git remote add origin URL-DEL-REPOSITORIO
git push -u origin main
```

## Servidor

Apache escucha en `127.0.0.1:8080`. El alias `/tuapp` apunta a la carpeta `app/`.

```bash
./iniciar-servidor.sh
```

Abrir `http://127.0.0.1:8080/tuapp/`.

```bash
./detener-servidor.sh
```

El puerto 80 no se usa porque en este sistema exige permisos de administrador. El puerto queda declarado en la directiva `Listen` del Virtual Host.
