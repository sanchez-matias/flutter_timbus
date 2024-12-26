import 'package:flutter/material.dart';
import 'package:flutter_timbus_annotations/presentation/rules/widgets/rules_slide.dart';

const _slides = <Slide>[
  Slide(
    title: 'Orden de las cartas',
    imageUrl: 'assets/rules/cards_truco_fliped.png',
  ),
  Slide(
    title: 'Cómo jugar',
    description:
        'Se formarán dos equipos de un numero par de jugadores, pudiendo '
        'ser hasta 8 en total. Los mismos deben jugar ubicados en forma de ronda e '
        'intercalando un integrante de cada equipo. La manera de formar los equipos será '
        'a elección de los jugadores y deberán sacar del mazo los 8 y los 9. Algunos '
        'sacan también los 10 (sotas) del mazo pero eso queda a elección.\n'
        '\n'
        'Luego de formar los equipos, se deberá decidir quién comienza a repartir '
        'y el repartidor deberá darle 3 cartas a cada integrante. Cada ronda, el rol de '
        'repartidor cambiará al jugador que esté a la derecha del que repartió previamente '
        'siendo el jugador MANO aquel que se encuentra a la derecha del repartidor.\n'
        '\n'
        'En este juego hay dos fases en las que podremos entrar para darle valor a nuestras '
        'cartas para sumar puntos: El envido y el truco. Primero se canta el ENVIDO y solo '
        'se podrá cantar hasta que cada jugador haya puesto una carta sobre la mesa. '
        'Después del envido se puede cantar el TRUCO el cual multiplicará los puntos que '
        'gane el equipo que sea el vencedor con las cartas en la mesa.\n'
        '\n'
        'Para definir el equipo que vence al poner las cartas, se deben ir poniendo cartas '
        'sobre la mesa en sentido antihorario empezando por el jugador MANO. Por cada vuelta '
        'habrá un vencedor según el valor de las cartas mostrado previamente. El equipo que '
        'gane un mejor de 3 vueltas, ganará la puesta de cartas, llevandose 1 punto.\n'
        '\n'
        'Tener en cuenta que ese punto puede ser aumentado si se entra en fase de truco.',
  ),
  Slide(
    title: 'Fase de envido',
    description:
        'Para entrar en esta fase, la primera ronda de la puesta de cartas no debe haber '
        'finalizado, de lo contrario el ENVIDO no se puede cantar y nadie suma puntos con '
        'esta fase.\n'
        '\n'
        'Para proponer una fase de envido, se debe decir en voz alta ENVIDO, REAL ENVIDO, '
        'o FALTA ENVIDO. Cada uno de estos cantos pone en juego diferentes cantidades de '
        'puntos para el vencedor de la fase. Siendo el Envido el que otorga 2, el Real '
        'Envido el que otorga 3 y el Falta Envido otorgará la cantidad de puntos que el '
        'rival le falte para ganar el partido completo. Estos cantos se pueden acumular '
        'en forma de conversación y en orden de puntos, por lo que lo unico permitido '
        'es que el equipo A cante ENVIDO y el equpo B cante REAL ENVIDO o FALTA ENVIDO. '
        'Por otro lado, si el jugador A canta ENVIDO el jugador B puede cantar un '
        'segundo ENVIDO, el cual pondrá en juego 4 puntos y se podrán seguir acumulando '
        'los cantos del REAL ENVIDO y FALTA ENVIDO.\n'
        '\n'
        'Una vez que se cantaron las propuestas de fase de envido, el jugador que debe '
        'dar la respuesta final debe decir QUIERO para entrar en fase de envido o NO '
        'QUEIRO para denegarla, entregando así cierta cantidad de puntos al rival, la '
        'cual equivale al valor del canto anterior al ultimo que se dijo. Por ejemplo: '
        'El equipo A canta ENVIDO (2 puntos), el equipo B canta ENVIDO (4 puntos), el '
        'equipo A canta REAL ENVIDO (7 puntos). Si el equipo B se niega, el equipo A '
        'suma 4 puntos.\n'
        '\n'
        'La fase de envido se juega viendo las cartas que se tienen sin mostrarlas '
        'y revelando en voz alta y en orden de ronda (comenzando por el jugador MANO) '
        'el puntaje que tiene cada jugador en sus cartas. Dicho puntaje, se calcula de'
        'la siguiente forma:\n'
        '\n'
        'PRIMERO: Si el jugador posee dos cartas de un mismo palo, tiene automáticamente '
        '20 puntos iniaciales. A eso debe sumarle el valor numérico de las dos cartas que '
        'más puntaje le den para cantar.\n'
        '\n'
        'SEGUNDO: Los 10, 11 y 12 solo cuentan para sumar los 20 puntos iniciales y valen '
        '0 puntos para el extra.\n'
        '\n'
        'TERCERO: Si el jugador tiene todas cartas de distinto palo, entonces su puntaje '
        'será el valor de la carta con más valor numérico.\n'
        '\n'
        'CUARTO: Solo se pueden usar dos cartas para armar un puntaje, por lo que, si el '
        'jugador posee tres cartas del mismo palo deberá usar las dos que más puntos le '
        'otorguen para cantar.\n'
        '\n'
        'Una vez el jugador sabe sus puntos, debe decir el numero en voz alta en el '
        'orden previamente especificado y el equipo que tenga al jugador con más puntaje '
        'en sus cartas ganará la fase del envido sumando los puntos correspondientes.\n'
        '\n'
        'Si un rival revela un puntaje más alto que los jugadores que todavía no dijeron '
        'el suyo, el jugador puede decir SON BUENAS para indicar que se rinden con la fase '
        'de envido, evitando así cantar sus puntos para que no se pueda deducir qué cartas '
        'tienen.\n',
  ),
  Slide(
    title: 'Fase de truco',
    description:
        'En esta fase se puede entrar cuando los jugadores lo deseen, solo que NO podrán '
        'entrar en fase de envido una vez que hayan entrado en fase de truco.\n'
        '\n'
        'Para proponer una fase de truco, se debe decir en voz alta TRUCO y si el rival '
        'quiere, puede aceptar entrar en la fase diciendo QUIERO o denegarla, diciendo '
        'NO QUIERO. Si la deniega, entonces se le sumará 1 punto al equipo que cantó truco '
        'y la ronda terminará.\n'
        '\n'
        'La fase consta solamente en aumentar el puntaje que se lleva el vencedor de la '
        'puesta de cartas a 2 puntos.\n'
        '\n'
        'Una vez cantado el TRUCO, hay dos cantos que proponen poner más puntos en juego: '
        'QUIERO RETRUCO lo aumenta a 3 y QUIERO VALE CUATRO lo aumenta a 4. Ambos se deben '
        'decir en orden, por lo que no se puede cantar QUIERO VALE CUATRO sin haber cantado '
        'QUIERO RETRUCO previamente.\n'
        '\n'
        'El orden de canto es en modo de conversación, por lo que si el equipo A canta TRUCO, '
        'estará en manos del equipo B si quiere RETRUCO, y, en caso de cantarlo, estará en '
        'manos del equipo A cantar el QUIERO VALE CUATRO.\n'
        '\n'
        'Decirle NO QUIERO al TRUCO le otorga 1 punto al equipo que lo cantó. Hacerlo con el '
        'QUIERO RETRUCO otorga 2 y el QUIERO VALE CUATRO otorga 3.',
  ),
  Slide(
    title: 'Cosas a tener en cuenta',
    description:
        '>  Este es un juego de picardía, por lo que en cualquier momento se puede cantar '
        'ENVIDO, TRUCO o cualquier otra cosa que ponga más puntos en juego. Incluso si es '
        'por accidente, se lo tomará como un canto intencional y el rival deberá '
        'responder si quiere o si no quiere.\n'
        '\n'
        '>  Este es un juego de mentirosos, por lo que la idea es pretender tener buenas cartas '
        'cuando en realidad se tienen malas y viceversa. En ciertas ocasiones es bueno cantar '
        'ENVIDO, TRUCO o cosas mas arriesgadas para hacerle creer al rival que se tienen buenas '
        'cartas. A veces también es inteligente quedarse callado cuando se tienen buenas cartas '
        'ya que si el rival canta algo, uno le puede cantar algo con mayor valor.\n'
        '\n'
        '>  El ENVIDO siempre tiene prioridad sobre el truco. Se puede cantar TRUCO primero, '
        'pero si el rival canta ENVIDO despues de un truco anticipado, el truco se cancela '
        'como si nunca se hubiera cantado.\n'
        '\n'
        '>  En el ENVIDO uno siempre se debe ser sincero con los puntos que se tiene y '
        'tener mucho cuidado de cantar bien sus puntos ya que al final de la ronda, los '
        'rivales pueden exigir ver los puntos y, si los mismos no coinciden con los cantados, '
        'los puntos de equipo se irán para los rivales, sin importar el puntaje de las '
        'cartas de los demás jugadores.\n'
        '\n'
        '>  Cuando se juega de a 4 o más jugadores, existen señas para decirles a los aliados '
        'qué cartas tienes en tu poder. Es recomendado saberlas para que sea más fácil '
        'comunicarse entre los de un mismo equipo.\n',
  ),
];

class TrucoRulesScreen extends StatelessWidget {
  const TrucoRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: _slides.length,
        itemBuilder: (context, index) => _slides[index],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Volver'),
      ),
    );
  }
}
