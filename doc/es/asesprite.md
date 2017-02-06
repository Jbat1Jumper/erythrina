
# ASEprite

Aseprite es un programa para crear sprites animados. Sus principales caracteríticas son:

* Los sprites se componen por capas y frames (como conceptos separados)
* Soporta modos de color: RGBA, indexado (paletas hasta 256 colores) y escala de grises.
* Cargar&grabar secuencias de ficheros PNG y GIFT animados (y FLC, FLI, JPG, BMP, PCX, TGA).
* Exportar/importar animaciones desde/hacia hojas de sprites.
* Modo de dibujo de celtas, útil para dibujar patrones y texturas.
* Hacer y deshacer cada operación.
* Previsualización de animaciones en tiempo real.
* Soporte de múltiples editores.
* Herramientas específicas de Pixel-art como relleno de contornos, polígonos, modo de sobreado, etc.
* Piel de cebolla.

## Instalación de ASEsprite en OpenSUSE

Vamos a instalar el programa ASEprite desde las fuentes en GNU/Linux OpenSUSE.

El código está disponible es este [repositorio GitHub](https://github.com/aseprite/aseprite/).
Consultamos el documento `INSTALL.md` y vamos siguiendo sus indicaciones.

## Obtener el código fuentes

* `zypper in git`, instalar la herramienta Git.
* `git clone --recursive https://github.com/aseprite/aseprite.git
`, clonamos el respositorio de ASEprite.
* `cd aseprite`
* `git pull`, actualizar lo que hemos clonado.
* `git submodule update --init --recursive`, actualizamos los submódulos.

## Instalar las dependencias para OpenSUSE

Se necesitan las siguientes dependencias para la instalación de OpenSUSE:

```
sudo zypper refresh
sudo zypper -n install gcc-c++ libX11-devel libXcursor-devel cmake ninja
```

El paquete libXcursor-devel se necesita para ocultar el cursor del sistema.

...

## Compilación

Hemos descargado el código de Aseprite. Creamos el directorio build dentro,
para guardar todos lo ficheros resultantes del proceso de compilación
(.exe, .lib, .obj, .a, .o, etc).
```
cd aseprite
mkdir build
```

De esta forma, si se quiere empezar con una copia fresca del código fuente de Aseprite,
se puede eliminar el directorio build y comenzar de nuevo.

Entremos al nuevo directorio y ejecutamos cmake:

```
cd aseprite\build
cmake -G Ninja ..
```

Aquí cmake acepta diferentes opciones dependiendo de nuestra plataforma.
Algunas opciones de cmake se pueden modificar usando herramientas como ccmake o cmake-gui.

> En GNU/Linux se puede especificar el directorio de instalación de Aseprite después de
un comando de instalación ninja. Por ejemplo:
>
> ```
> cd aseprite
> mkdir build
> cd build
> cmake -DCMAKE_INSTALL_PREFIX=~/software -G Ninja ..
> ninja aseprite
> ```
>
> Después se puede invocar ninja install y se copiará el programa en la localización
especificada (e.g. ~/software/bin/aseprite)

Después de ejecutar y configurar cmkae, tenemos que compilar el proyecto:
```
cd aseprite/build
ninja aseprite
```

Cuando ninja termine la compilación, podremos encontrar el ejecutable dentro de
`aseprite/build/bin/aseprite.exe`.
