import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_timbus_annotations/presentation/rules/slides/slideshow.dart';

final trucoSlides = Slideshow(
  name: 'Truco',
  icon: Icons.check_box_outline_blank,
  slides: const [
    MarkdownBody(data: '''
> **Objetivo del Juego**: ser el primer equipo que llegue a la cantidad de puntos designada.

# **Requisitos**
* Mazo de cartas españolas.
* Numero par de jugadores hasta 8.
* Esta app o un papel y lápiz para anotar los puntos.

# **Recomendaciones**
* Si bien el juego admite 8 jugadores, se recomienda que se juegue de a 6 para que sea menos probable que hayan muchas cartas de alto valor en la mesa.
'''),

    MarkdownBody(data: '''
# **Antes de empezar**
Primero que nada, se deben definir la cantidad de puntos que se deben acumular para ganar. Normalmente se establece en 30, pero para partidas más cortas se suelen establecer en 9, 15 o 18 puntos.

Este juego siempre tendrá solo 2 equipos y se deben ubicar todos en forma de ronda intercalando un jugador de cada equipo, de modo que todos los jugadores tienen a ambos lados a jugadores del equipo contrario.

Luego de definir los equipos y la disposición de sus integrantes, deberemos excluir del mazo todas las cartas con valor numérico 8 y 9. Los 10 tambien se pueden sacar si así se desea, pero en caso de ser muchos jugadores se recomienda dejarlos en el mazo.

Finalmente, se debe definir con un método a elección quién será la persona que comenzará a repartiendo la primera ronda. Luego de eso, con el pasar de cada ronda, el mazo se va pasando de jugador en jugador en sentido antihorario.
'''),

    MarkdownBody(data: '''
# **Durante la ronda**
Antes que nada, la persona designada para repartir debe darle 3 cartas a cada jugador. Esta persona para su equipo es el *pie de ronda*, mientras que el jugador a su izquierda es el *pie de ronda* del equipo rival. Normalmente esta es la persona que les dice a los demás cómo se debe jugar la ronda, siendo también el encargado de recolectar información de las cartas de sus compañeros sin que los rivales se den cuenta.

Por otro lado, las dos personas que estén a la derecha del repartidor se las denomina *Mano de ronda* y será la primera que tenga la posibilidad de poner una carta encima de la mesa en todo su equipo.

Una vez que todos los jugadores tienen sus cartas, ahora hay que comenzar a poner las cartas sobre la mesa en sentido antihorario. Cada una de ellas se rige por un un orden de valores donde las cartas más valiosas siempre les ganan a las cartas que se encuentren por debajo y pierden contra las que se encuentran más arriba. Dicho orden de valores, se encuentra en la página "Valor de las cartas"

Cada jugador debe ir revelando solo una carta por vuelta y el que ponga la carta con más valor en cierta vuelta, ganará esa instancia. El equipo que gane un mejor de 3 vueltas, ganará la puesta de cartas y se llevará 1 punto.

Aparte de todo lo anterior los jugadores pueden usar ciertas palabras clave o *CANTOS* para poder poder acceder a otras instancias en donde se ponen más puntos en juego. Dichas palabras son *ENVIDO* y *TRUCO*.

Cuando un jugador canta alguna de las dos palabras anteriores, los jugadores del equipo rival deben responderle con *QUIERO* para entrar en la instancia de juego o *NO QUIERO* para denegarla, concediendo una pequeña cantidad de puntos a los cantores.
'''),

    MarkdownBody(data: '''
# **Fase de Envido**
El envido solo puede cantarse cuando aún NO estan todas las cartas de la primera ronda puestas en la mesa, por lo que si el jugador que repartió pone su pimera carta, ya no se puede cantar Envido.

Para proponer una fase de envido, se debe decir en voz alta ENVIDO, REAL ENVIDO o FALTA ENVIDO. Cada uno de estos cantos pone en juego diferentes cantidades de puntos para el vencedor de la fase:

1. **Envido**: 2 puntos
2. **Envido** (por segunda vez): otros 2 puntos
3. **Real Envido**: 3 puntos
4. **Falta envido**: La cantidad de puntos que le falta al rival para ganar la partida.

Cabe destacar que los cantos son acumulativos y no es necesario decirlos en orden, salvo el segundo Envido que obligatoriamente debe venir despues del primer envido.

Estos cantos se acumulan en forma de conversación, por lo que lo unico permitido es que el equipo A cante ENVIDO y el equpo B cante ENVIDO (otra vez), REAL ENVIDO o FALTA ENVIDO.

Cuando un equipo canta REAL ENVIDO o FALTA ENVIDO sin cantar ENVIDO, este ultimo ya no se puede cantar, ya que se deben decir en el orden estipulado en la lista.

Cuando la cantidad de puntos le parece mucho a un jugador, puede denegar la fase de envido si es que quiere diciendo NO QUIERO, pero se les otorgará a los rivales la cantidad de puntos correspondiente al anterior canto y, en caso de no haber anterior canto, se le otorgará 1 punto.

**Ejemplo 1**: Si el equipo A canta FALTA ENVIDO y el B le dice NO QUIERO, la fase de ENVIDO se deniega y el equipo A se lleva 1 punto de partida.

**Ejemplo 2**: Si el equipo A canta ENVIDO, el B canta ENVIDO y el equipo A dice NO QUIERO, la fase de ENVIDO se deniega y el equipo B se lleva 2 puntos (equivalentes al primer ENVIDO) de partida.

**Ejemplo 3**: Si el equipo A canta ENVIDO, el B canta REAL ENVIDO y el A dice QUIERO, se entra a la fase de ENVIDO y se juega por 5 puntos de partida.

Cuando se entra en una fase de Envido, los jugadores dejarán de poner cartas en la mesa por un momento y comenzarán a fijarse en sus tres cartas y calcular cuántos puntos tienen.

Para calcular cuantos puntos tiene uno mismo, se deben mirar las 3 cartas sin importar si estan puestas o no en mesa y seguir los siguientes tips:

* Primero se deben elejir dos cartas del mismo palo. En caso de que ninguna sea del mismo palo, debe elejir la que tenga valor numérico más alto y ese será su puntaje.
* Si se tienen dos cartas del mismo palo, el jugador ya tiene 20 puntos. A ese número hay que sumarle un adicional correspondiente al valor numérico sumado de ambas cartas.
* Los 10, 11 y 12 sirven para tener dos cartas del mismo palo pero suman 0 puntos adicionales. Son inservibles cuando no se tiene otra carta del mismo palo.
* Si las 3 cartas son del mismo palo, se deben tomar en cuenta solo las 2 cartas que más puntaje le otorguen al jugador.

Todos los jugadores deben ir diciendo cuántos puntos tienen empezando por el *Jugador mano* y luego seguir en sentido antihorario. El equipo cuyo jugador tenga el puntaje más alto ganará la fase de Envido, llevandose todos los puntos en juego.
'''),

    MarkdownBody(data: '''
# **Fase de Truco**
El Truco se puede cantar en cualquier momento de la ronda, pero debe ser obligatoriamente después del Envido. Es posible cantar el Truco antes del Envido y, en caso de aceptarse, ya no será posible cantar Envido durante el resto de la ronda.

En este caso, las reglas de la fase son más simples que el Envido. Se debe completar la puesta de cartas en la mesa y el ganador, en vez de llevarse 1 punto como se dijo antes, se lleva la cantidad de puntos correspondiente al último canto.

En esta fase existen también una serie de cantos que, al igual que el Envido, se acumulan en forma de conversación:

1. **Truco**: 2 puntos
2. **Quiero Rertruco**: 3 puntos
3. **Quiero vale cuatro**: 4 puntos

En este caso los cantos deben decirse todos en ese orden, por lo que no es posible decir TRUCO primero y luego QUIERO VALE CUATRO.

Cabe destacar que cuando se le dice NO QUIERO al QUIERO RETRUCO o al QUIERO VALE CUATRO, se le otorgarán al autor del ultimo canto la suma de 2 y 3 puntos respectivamente.

Una vez terminada la fase de Truco, también termina la ronda ya que no hay más cartas que poner en la mesa, por lo que resta sumar todos los puntos acumulados.
'''),

    MarkdownBody(data: '''
# **Cosas a tener en cuenta**
* Este es un juego de picardía, por lo que en cualquier momento se puede cantar ENVIDO, TRUCO o cualquier otra cosa que ponga más puntos en juego. Incluso si es por accidente, se lo tomará como un canto intencional y el rival deberá responder si quiere o si no quiere.
* Este es un juego de mentirosos, por lo que la idea es pretender tener buenas cartas cuando en realidad se tienen malas y viceversa. En ciertas ocasiones es bueno cantar ENVIDO, TRUCO o cosas mas arriesgadas para hacerle creer al rival que se tienen buenas cartas. A veces también es inteligente quedarse callado cuando se tienen buenas cartas ya que si el rival canta algo, uno le puede cantar algo con mayor valor.
* En el ENVIDO uno siempre se debe ser sincero con los puntos que se tiene y tener mucho cuidado de cantar bien sus puntos ya que al final de la ronda, los rivales pueden exigir ver los puntos y, si los mismos no coinciden con los cantados, los puntos de equipo se irán para los rivales, sin importar el puntaje de las cartas de los demás jugadores.
* Cuando se juega de a 4 o más jugadores, existen señas para decirles a los aliados qué cartas tienes en tu poder. Es recomendado saberlas para que sea más fácil comunicarse entre los de un mismo equipo.
'''),

    MarkdownBody(data: '''
# **Orden de las cartas**

### Mayor valor

1. As de Espada
2. As de Basto
3. 7 de Espada
4. 7 de Oro
5. Todos los 3
6. Todos los 2
7. As de Copa y As de Oro
8. Todos los 12
9. Todos los 11
10. Todos los 10 (Si es que están en el mazo)
11. Todos los 6
12. Todos los 5
13. Todos los 4

### Menor valor
'''),

    MarkdownBody(data: '''
# **Señas**

* **As de Espada**: Levantar las cejas
* **As de Basto**: Guiñar el ojo
* **7 de Espada**: Sonreír del lado Derecho
* **7 de Oro**: Sonreír del lado Izquierdo
* **Todos los 3**: Morderse el labio de abajo
* **Todos los 2**: Beso sutil 
* **As de Copa o As de Oro**: Abrir levemente la boca
* **Buenos puntos para el Envido**: Arrugar la nariz
* **No tengo nada**: Cerrar ambos ojos
'''),
  ],
);


