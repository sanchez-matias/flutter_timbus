import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_timbus_annotations/presentation/rules/slides/slideshow.dart';

final generalaSlides = Slideshow(
  name: 'Generala',
  icon: Icons.casino,
  slides: const [
    MarkdownBody(data: '''
> **Objetivo del juego**: Completar todos los casilleros de la tabla con el puntaje más alto posible.

# **Requisitos**
* Al menos 2 jugadores.
* 5 dados de seis caras.
* Esta app o un papel y lápiz para anotar los puntajes.

# **Recomendaciones**
* Usar la app para anotar el puntaje debido a que es mucho más sencillo tener control de la tabla que con un papel y lápiz.
* Contar con una superficie plana y áspera donde se puedan arrojar los dados sin que se deslicen.
'''),

    MarkdownBody(data: '''
# **¿En qué consiste el juego?**

Este es un juego que se desarrolla por rondas, por lo que los dados deben ser tirados una vez por jugador en el sentido de la ronda que formen. En once rondas, ganará el jugador que más puntos haya hecho con los juegos de dados que logró formar.

En algunos casos, los dados formarán juegos que pueden ser válidos para más de un tipo de combinación. El jugador es el que terminará decidiendo qué tipo de combinación es la que quiere anotarse, pero debe ser solo una de ellas.

En más de una ocasión, el jugador puede no tener suerte y terminar sin haber formado una combinación válida. En este caso en donde el jugador está sin opciones, debe optar por tacharse una celda en donde se inhabilita dicha celda, impidiendo que se puedan sumar puntos en la misma por el resto de la partida.

La partida termina cuando todos los casilleros de la tabla están llenos y el jugador con mayor puntaje global será el ganador.
'''),

    MarkdownBody(data: '''
# **Posibles combinaciones de dados**

*  **Numéricos**: son los correspondientes a la fila del 1 al 6 en la tabla y se forman sacando dados de un mismo valor. En caso de haber buscado una combinación y haber fallado, se puede buscar la celda de menor valor y rellenarla como una combinación de 1 dado en la celda correspondiente.
*  **Escalera**: Se forma cuando todos los dados están ordenados en una sucesión del 1 al 5 o del 2 al 6.
*  **Full**: Es formado cuando se sacan 3 dados de un valor A y otros 2 del valor B.
*  **Poker**: Se forma cuando se sacan 4 dados del valor A y 1 del valor B. 
*  **Generala**: Se forma cuando se sacan 5 dados iguales. Si los cinco salieron de una sola tirada, ese jugador gana automáticamente la partida.
*  **Doble Generala**: Se forma cuando, habiendo formado generala, la misma vuelve a salir. También aplica la regla para cuando sale en una tirada.
''')
  ],
);
