import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_timbus_annotations/presentation/rules/slides/slideshow.dart';

final moscaSlides = Slideshow(
  name: 'La Mosca',
  icon: Icons.emoji_nature,
  slides: const [
    MarkdownBody(data: '''
# **Requisitos**
* Un mazo de cartas españolas
* Esta app o un papel y lápiz para anotar

# **Recomendaciones**
* No ser mas de 5 jugadores, para que todos puedan jugar en todo momento.
* En caso de ser más de 5 jugadores, se recomienda turnarse para que en cada ronda jueguen solo 5 personas.

> **Objetivo para ganar**: Ser el primero en llegar a los 0 puntos.
'''),

    MarkdownBody(data: '''
# **Fase previa**

En este juego son todos contra todos y hay un solo ganador. Todos empiezan con un puntaje inicial de 15 y la meta es restar puntos hasta tener 0 o menos.

Antes de empezar, se deberán retirar del mazo los 8, 9 y comodines. Luego de eso, con un metodo a elección, se decide quién comienza a repartir.

Se repartirán 5 cartas a cada jugador empezando por aquel que el repartidor tiene a su derecha. Al final el repartidor deberá terminar dándose la última carta a sí mismo, pero antes de cualquier cosa, deberá dar vuelta dicha carta para que todos la vean. El palo de esa última carta será el designado como el TRIUNFO DE RONDA.

Antes de comenzar con la ronda, los jugadores que no sean el repartidor decidirán si quieren jugar o no. Normalmente, esto se decide cuando al jugador no le tocaron cartas muy buenas y tiene miedo de sumar puntos.

Si ninguno quiere jugar la ronda, entonces el jugador que se encuentre a la izquierda del repartidor estará obligado a una ronda mano a mano con el mismo.
'''),

    MarkdownBody(data: '''
# **Durante la ronda**

Una ronda de La Mosca está conformada por 5 turnos en donde cada jugador pondrá una de las cartas que tiene para intentar ganar el turno.

El jugador a la derecha del que repartió es quien comienza y el palo de la carta que ponga será denominado TRIUNFO DE TURNO. Este determina el palo de la carta que todos deben poner durante el turno si es que la tienen.

Si el jugador no tiene una carta con TRIUNFO DE TURNO, esta obligado a poner una carta del TRIUNFO DE RONDA, el cual es mas valioso que el de turno.

Si el jugador no tiene ninguna carta con TRIUNFO DE TURNO ni TRIUNFO DE RONDA, es libre de poner una carta de cualquier otro palo, pero no tendrá posibilidad de ganar dicho turno.

Una vez finalizado el turno, se evaluan las cartas sobre la mesa:

* Si hay cartas con TRIUNFO DE RONDA en la mesa, entonces el ganador será el que haya puesto la carta de dicho palo con la mayor jerarquía.
* Si no hay cartas con TRIUNFO DE RONDA en la mesa pero sí hay cartas con TRIUNFO DE TURNO, el ganador sera el que haya puesto la carta de dicho triunfo con mayor jerarquía.

El jugador que gane el turno es quien debe poner la primera carta el siguiente turno y, de esa forma, se deben jugar los 5 turnos hasta que nadie tenga cartas en la mano.

Por cada turno ganado, se le restará 1 punto a dicho jugador y, quien no haya ganado ningún turno, se le sumarán 5 puntos.
'''),

    MarkdownBody(data: '''
# **Cosas para tener en cuenta**

* Si un jugador decide no jugar una ronda pero su puntaje global es menor a 5, se le suma 1 punto.
* Si, al dar las cartas, la carta que da vuelta el repartidor resulta ser un as (uno), entonces TODOS deben jugar la ronda sin excepciones
'''),

MarkdownBody(data: '''
# **Jerarquía de cartas del mismo triunfo**
### Mayor valor

* As (uno)
* 3
* Rey (doce)
* Caballo (once)
* Sota (diez)
* 7
* 6
* 5
* 4
* 2

### Menor valor
'''),
  ],
);
