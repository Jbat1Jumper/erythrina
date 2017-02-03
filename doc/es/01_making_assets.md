### Erythrina

# Creando los assets

El primer tema que cobriré será la creación de los assets. Intentaré usar programas
libres u open source. Quizás este tutorial cubrirá menos sobre Godot pero son
importantes para cada juego. Llegaremos a Godort en unWe will reach godot en solo un rato.

Estaba pensando en usar GraphicsGale para dibujar. No es un mal programa, tiene
una versión gratuita, etc. Realmente no me gusta porque no encuentro intuitivo
algunas de las herramientas aunque para pixel art no se necesita demasiado y
encuentro que encaja bien con los sprites animados de Godot. Pero justo hace poco
encontré ASEprite. Es un editor It's a pixelated editor listo para pixel art,
y además es open source.

![ASEprite](../img/aseprite.png)

Justo el abrirlo aparece toda la nostalgia. Al principio pensé que un entorno
pixelado sería molesto, pero una vez que lo usé me pareció cómodo. ASEprite
puede trabajar con capas, animaciones, exportar hojas de sprites, paletas, etc.
Y se ajusta bien con los sprite animados de Godot.

Para Windows estoy usando esta versión compilada - [Enlace al zip](http://www.mediafire.com/download/a2p5m91lndrfw4g/Aseprite1.0.2-dev.zip) -
porque los últimos binarios no son gratuitos, sin embargo el código se puede encontrar
aquí - [link to github](https://github.com/aseprite/aseprite/)

## Cosas que debemos conocer antes de dibujar

Antes de ir al desnudo acto de salpicar la pantalla de píxeles, hay algunas cosas
que debemos tener en cuenta. Aquí hay algunos trucos y reglas que pueden hacer el aspecto
de nuestro juego/diseño más profesional.

Un diseñador gráfico no tiene una varita mágica para hacer parecer todo maravilloso.
En lugar de eso, tienen un conjunto de reglas que, si las seguimos, podemos hacer
que parezca impresionante casi cualquier cosa. Y aquí tenemos un pequeño subconjunto
de algunas de las reglas que he aprendido hasta ahora. (Renuncia: no soy diseñador,
soy un técnico en electrónica y un estudiante de Informática de modo que cada
una de estas palabras debe cogerse con cautela).

## Cosas de la escuela primaria

Primero de todo, no se puede ir ahí y coger colores al azar.
¿Has tenido la experiencia de sentir cuando has hecho algo grande pero los colores
no se ven bien, y no sabes por qué?. Ahí justamente, es donde entra un poco de teoría de colores.
Necesitamos atravesar un poco de materia básica y aburrida.

Supongo que todos conocen los colores elementales y básicos.

![primary colors](../img/prim_colors.png)

Sí, no estamos usando el rojo, verde y azul como todas las pantallas CRT suelen hacer. Es verdad que RGB son los colores primarios para las pantallas y también que el rojo, amarillo y azul  son colores primarios también, ¿cuál es la diferencia?.

¿Qué ocurre cuando RGB son colores de luz y RYB son colores del pigmento?. La diferencia entre ellos es cómo y qué ocurre cuando se mezclan.
Con RGB cuando se mezclan todos los colores con máxima intensidad, el resultado es la luz blanca. Pero cuando se mezcla pintura roja, azul y amarilla se consigue un cubo de pintura marrón.

![mix paint](../img/color_mix.png)

La pintura roja, amarilla y azul son los colores básicos. Cuando se mezclan en parejas se obtienen los colores secundarios.

![mix paint](../img/basic_wheel.png)

Y si mezclamos un color primario con uno secundario, se crean los colores ternarios. Y después de eso, haciendo todas las combinaciones acabamos con una fantástica rueda de doce colores.

![mix paint](../img/basic_wheel_2.png)

Podríamos continuar pero 12 colores es todo lo que necesitamos. Realmente más colores transformarían todo en algo peor.

Pero, no podemos hacer todo el juego con sólo 12 colores. ¿O sí? ¿y dónde están el negro y el blanco?

Bueno, para los físicos, el negro no es un color pero el blando sí. Para los químicos el negro es un color pero el blanco no. Pero para la teoría de los colores básicos, ninguno de ellos son colores.
Son solamente variaciones de intensidad y luminancia de un color. Añaden sombra (al agregar negro) y tinte (al agregar blanco).

Girando la rueda de colores y cambiando el color, se está cambiando realmente el
matiz (HUE) del color. Cuando hacemos una rueda de 12 colores estamos restringiendo
los matices a un pequeño subconjunto. Sin embargo todavía pondemos teñir y sombrear
los colores para hacer muchas variaciones.

Cuando un color no tiene agregado ni blanco ni negro entonces está completamente saturado.
A menor saturación del colorm, más negro o blanco tiene. El neutro podría ser cualquier color con saturación 0.

## Cálido y fresco

One thing that is important to know and is a little obvious at sight is the difference of warm and cool colors.

The color wheel is split in two sections.

![](../img/warm_cool.png)

It's usefull to know what are you drawing and what feelings are you trying to transmit. For example the warm colors generally are energetic and vivid and cool colors are calm and in occasions sad. Try, for example, to avoid mixing warm colors  (at least in equal amounts) when trying to draw something that must feel cool.


## Picking colors

The most important thing to know about colors is to pick the fewest possible. You must pick the minimum amount that will explain the picture. The less colors you pick the more 'harmonic' will look the picture. If you exaggerate and pick only one color everything will be monochrome and there will not be place for incorrect colors (there will be only one).

For many things picking from two to four colors its just enough. The rest are just variations adding black and white.

Here are some tips for picking colors and some use cases.

##### Complementary colors



![](img/complementary_colors.png)



Just pick a base color, then pick the opposite color in the wheel. That color will be the complementary color. It will have de highest hue contrast so its not recommended to use them at full saturation. Its very useful to make things noticeable.



##### Analogous colors




![](img/analogous_colors.png)


Pick a base color, and then pick the adjacent colors in the weel. This combination is usually very harmonious and confortable. It lacks of contrast and some usage of black and white is needed to add contrast. You can also combine it with the complementary color for something that must be really noticeable.



##### Split complementary colors



![](img/comp_analogous_colors.png)



Pick a base color and then, instead of picking the complementary pick the analogous colors of the complementary. You will have almost the same contrast as the complementary but its easier to use and more confortable to the eye.


##### Triangle colors



![](img/triangle_colors.png)



Pick a base color and then chose another two making a triangle in the wheel so the three colors are evenly spaced.



##### Square/Rectangle Colors



![](img/square_colors.png)



Pick two pairs of complementary colors. The result may be versatile enough to have some good contrast and good harmony. You will also have the same warm colors as well as cool colors. This combinations work better if one color is the dominant.



-

All the colors here maybe may look too simple and colorful. But everything else is in the variation. Taking a set of analogous colors you could make something like this.



![](img/analogous_example.png)



And I really don't know what is that. But in that thing there are only three colors and everything else is just tint and shadow. And that colors are the same (have the same hue) that the ones on the right. It blew my mind the first time I saw it.




If you want to draw something more realistic you are not restricted to a small set of colors, but they will help as guidelines for the other colors. You always can use a base paint in basic colors and then paint more colors, shadow and light over until everything look gorgeous.



## Now the drawing thing


So, now we are ready to go and dive into the drawing thing. So we sit, turn on the computer, and open ASEprite. The first thing we see is an environment like this.


![](img/aseprite1.png)


Its actually a lovely environment once you get used. Then you go to create a new file in aseprite and find a menu like this one.


![](img/aseprite2.png)


And maybe you will ask yourself which color mode use, or which background color. For pixel art one great tool (at least for me) is an indexed color palette. You are limited to 256 colors, yes, but they are plenty enough. The gain is that when you want to change one color, or adjust all the palette colors over all the sprites, you will only need to change the palette. You do not need to repaint anything (theoretically).


This leads you to make a palette shared between all the images. Or maybe to use different palettes for different purposes (like a palette for normal environments, and another for cold environments where all the colors are tinted in blue). And that will be the first thing we will do.


Actually creating a palette from scratch is a continuous process where you add colors when you need them, and that is fine. But here I will cheat and make a (I hope) complete palette from the twelve colors from the color wheel. Then tweak it to give everything the desired look and use it everywhere so the colors will be consistent over all the assets.


I'll start by cleaning ant throwing away the current palette. By clicking here on the edit palette button.


![](img/aseprite3.png)


It will expectably open a palette editor like this one, where you can edit each color.


![](img/aseprite4.png)


But editing each color one by one is a tedious process, and if you click on the + button, some useful tools will open.


![](img/aseprite5.png)


To erase all the current colors easily you can actually select a big group of
colors. Holding ctrl or shift, like with files or everything similar, will select a group of colors.


![](img/aseprite6.png)


Then just move all the RGB sliders to 0 to make all colors black. Now we have a nice and empty palette and we are ready to create.


I use the colors in the HSB (HSV or HSL, whatever) mode. It actually reflects well the basic color theory.


![](img/aseprite7.png)


First of all I will make a gray gradient. I will let the first row empty if I may need some specific colors at some point, to made color annotations and to use the first color as the transparent color. I select the 9th color and make it white. Then I will select the last 24th color (the last of the third row if you live in a universe where the rows have 8 colors, and if you not you can scale them) and make it black (if it isn't black already).


![](img/aseprite8.png)


Then just select that 16 colors from white to that black, and then press the Ramp button.


![](img/aseprite9.png)


It will make a nice gradient with equal size steps and will make our grayscale.


![](img/aseprite10.png)



Then we will continue with the colors. Those are a little harder because they can lerp in more than 1 dimension, and generally the saturation and the value make a triangle or a square. I will make it dirty and simple choosing colors in this way.


![](img/triangle_red.png)


So I will sacrifice full saturated colors (I will not use them here for now) and some gray tones (I will miss them).


I will proceed like with the gray scale but making two ramps and tweaking them a little.


First lets start with the red. Its hue is 0 so I think its a good start. I will first make a gardent from these colors.

![](img/aseprite11.png)

![](img/aseprite12.png)

And they will go from an almost black dark red to a red which is not saturated and does not harm the eye when watching. And the result is something like this.

![](img/aseprite13.png)

After that we will make the light part of the gradient between these colors.

![](img/aseprite14.png)

![](img/aseprite15.png)

And the result is something like this.

![](img/aseprite16.png)

![](img/aseprite17.png)

Then there goes a boring but actually fast job of doing this for the rest of the 12 colors. Its actually just copy and paste simple as selecting the two rows of the red gradent, and then pasting it eleven times.

![](img/aseprite18.png)

![](img/aseprite19.png)

And after ten more times.

![](img/aseprite20.png)

Then to change the hue of a hole gradient its just easy as select the gradient and simply change the hue.

![](img/aseprite21.png)

And again we will do this like ten more times, and end up having this.

![](img/aseprite22.png)

After that I will actually cheat all the hues a little bit moving some of them like 5 degrees. And with white colors I will make a row marking the columns of tones which are likely to use as base colors. And the other ones will be more likely to be used as shade or light colors. The whole result its in the assets folder, also exported as a .gpl pallete.

![](img/aseprite23.png)

### Continues in the [Part 2](02_making_assets.md)
