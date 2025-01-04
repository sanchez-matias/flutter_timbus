import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_timbus_annotations/presentation/rules/slides/slideshow.dart';

final chinchonSlides = Slideshow(
  name: 'Chinchón',
  icon: Icons.healing,
  slides: const [
    MarkdownBody(data: '''
> **Objetivo para ganar**: Ser el único que queda al mantenerse por debajo de la cantidad de puntos designada

# **Requisitos**

* Un mazo de cartas españolas
* Un mínimo de 2 jugadores
* Esta app o un papel y lápiz para anotar

# **Recomendaciones**

* No ser más de 5 jugadores en la partida. Esto debido a la cantidad limitada de cartas.
* En caso de querer forzar la partida a más de 5 jugadores, se recomienda que se turnen para que siempre jueguen solo 5 personas por ronda.
'''),

    MarkdownBody(data: '''
# **Fase previa**

Antes que nada, se debe definir el límite de puntos de la partida. Este límite representará cuántos puntos puede acumular un jugador sin ser expulsado de la partida. La mayoría de partidas rápidas se establecen en 50, pero también se suelen establecer en 70 o 100.

Luego de mezclar el mazo, deberemos repartir 7 cartas a cada jugador y, una vez que cada jugador tenga sus 7 cartas, se deja el mazo en el medio y se da vuelta la carta de arriba del mazo.

Esa carta que se dio vuelta conformará la *pila de descarte*, mientras que las cartas restantes serán parte de la *pila de agarre*.
'''),

    MarkdownBody(data: '''
# **Esencia del Juego**

La esencia del juego es ir formando juegos con las 7 cartas que se tienen en la mano. Cuando alguna de las cartas no le sirva al jugador para dicho objetivo, deberá tomar una carta de la *pila de descarte* o de la *pila de agarre* y luego dejar una que no le sirva en la *pila de descarte*.

Luego de eso, el siguiente jugador en orden de la ronda debe ejecutar la misma acción hasta que uno consiga formar un juego de cartas con cada una de las 7 cartas que tiene en la mano.

Cuando algún jugador consigue la última carta que le faltaba para completar todos sus juegos, debe dejar dicha carta en su mazo y dejar una de la cual pueda prescindir boca abajo. Una vez ocurra eso, la ronda acaba y todos los jugadores deben mostrar sus cartas.

El jugador que haya *cortado* la ronda es quien se llevará -10 puntos, alejandose así del límite de puntos y aumentando sus probabilidades de ganar. El resto de jugadores debe sumar los valores numéricos de todas sus cartas que no formen un juego y sumárselos a su puntaje global.

La carta del comodín puede usarse para reemplazar cualquier carta que el jugador quiera, pero en caso de no cortar la ronda, sumará 25 puntos por cada comodín en mano.
'''),

    MarkdownBody(data: '''
# **¿Qué juegos de cartas se pueden formar?**

Solo 3 tipos de juegos son válidos para el chinchón:
* **Pierna**: Tener 3 o 4 cartas del mismo valor numérico.
* **Escalera**: Tener 3 o más cartas del mismo palo en ordren numérico ascendente o descendente.
* **Chinchón**: Tener una escalera formada con las 7 cartas que se tienen en mano y sin ningún comodín.

Cabe destacar que el *Chinchón* es el juego más valioso y hará que quien lo haya formado, gane automáticamente la partida completa.
'''),

    MarkdownBody(data: '''
# **Para tener en cuenta**

* Es válido que se juegue al chinchón con la posibilidad de *cortar* rondas con una carta que no haga juego con las otras, pero el jugador que corta la ronda sumará los puntos de dicha carta.
* Si un jugador puede cortar pero continúa con su turno sin hacerlo, la ronda continúa y no podrá cortar hasta que vuelva a ser su turno.
* Cuando un jugador cortó la ronda y mostró sus combinaciones de cartas, todos los demás pueden *colar* sus cartas en alguna de las combinaciones que haya formado, evitando así sumar el valor de cada carta que cuele
.
* Cuando la partida ya empezó y tiene rondas jugadas, cualquier jugador se puede meter a jugar, pero debe sumarse con el puntaje más alto en la partida.
'''),
  ],
);
