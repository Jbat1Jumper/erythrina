

# ASEprite


Aseprite es un programa para crear sprites animados. Sus principales caracteríticas son:

* Los sprites se componen por capas y frames (como conceptos separados)
* Soporta modos de color: RGBA, indexado (paletas hasta 256 colores) y escala de grises.
* Cargar&grabar secuencias de ficheros PNG y GIFT animados (y FLC, FLI, JPG, BMP, PCX, TGA).
* Exportar/importar animaciones desde/hacia hojas de sprites.
* Modo de dibujo de celtas, útil para dibujar patrones y texturas.
* Hacer y descaher cada operación.
* Previsualización de animaciones en tiempo real.
* Soporte de múltiples editores.
* Herramientas específicas de Pixel-art como relleno de contornos, polígonos, modo de sobreado, etc.
* Piel de cebolla.

## Instalación de ASEsprite en GNU/Linux

Vamos a instalar el programa ASEprite desde las fuentes en GNU/Linux OpenSUSE.

El código está disponible es este [repositorio GitHub](https://github.com/aseprite/aseprite/).
Consultamos el documento `INSTALL.md` y vamos siguiendo sus indicaciones.

* `zypper in git`, instalar la herramienta Git.
* `git clone --recursive https://github.com/aseprite/aseprite.git
`, clonamos el respositorio de ASEprite.
* `cd aseprite`
* `git pull`, actualizar lo que hemos clonado.
* `git submodule update --init --recursive`, actualizamos los submódulos.

...
