import 'package:flutter/material.dart';
import 'package:flutter_timbus_annotations/presentation/rules/widgets/rules_slide.dart';

const _slides = <Slide>[

  Slide(
    title: 'Fase previa de cada ronda',
    description:
        'La cantidad de jugadores queda a elección, pero se recomienda '
        'que no sean más de 5 (cinco) jugadores.\n'
        'En caso de que se excedan la cantidad recomendada, jugarán solo 5 personas '
        'por ronda, teniendo que turnarse a placer para que cada jugador acabe jugando '
        'una cantidad justa de rondas.\n'
        '\n'
        'En este juego son todos contra todos y hay un solo ganador. Todos empiezan con '
        'un puntaje inicial de 15 y la meta es restar puntos hasta tener 0 o menos.\n'
        '\n'
        'Antes de empezar, se deberán retirar del mazo los 8, 9 y comodines. Luego de eso,'
        'con un metodo a elección, se decide quién comienza a repartir. Se repartirán 5 '
        'cartas a cada jugador empezando por aquel que el repartidor tiene a su derecha. '
        'Al final el repartidor deberá terminar dándose la última carta a él mismo, pero '
        'antes de cualquier cosa, deberá dar vuelta dicha carta para que todos la vean.\n'
        '\n'
        'El palo de esa última carta (basto, oro, espada o copa) será el designado '
        'como el TRIUNFO DE RONDA y toda carta de dicho palo tendrá más valor que las '
        'demás. Sin embargo, NO en todas las situaciones puedes usar una carta del palo '
        'que es triunfo para poderle ganar una ronda a otra que no lo es. Eso se verá '
        'más adelante.\n'
        '\n'
        'Antes de empezar a poner las cartas sobre la mesa, los jugadores que no sean el '
        'repartidor decidirán si quieren jugar o no. Si ninguno quiere jugar, entonces el '
        'jugador que se encuentre a la izquierda del repartidor estará obligado a una'
        'ronda mano a mano con el repartidor.\n'
        '\n'
        'Una vez definidos los jugadores que participarán en la ronda, cada uno tendrá '
        'derecho a cambiar de 1 a 3 cartas por otras aleatorias que quedaron en el mazo. '
        'Solamente el repartidor es quien se podrá darse hasta 4 cartas.',
  ),
  
  Slide(
    title: 'Orden de las cartas según su número',
    description: '\n\n'
        'MÁS VALOR'
        '\n\n'
        '>  1 (Ases)'
        '\n\n'
        '>  3'
        '\n\n'
        '>  12 (Reyes)'
        '\n\n'
        '>  11 (Caballos)'
        '\n\n'
        '>  10 (Sotas)'
        '\n\n'
        '>  7'
        '\n\n'
        '>  6'
        '\n\n'
        '>  5'
        '\n\n'
        '>  4'
        '\n\n'
        '>  2'
        '\n\n'
        'MENOS VALOR',
  ),

  Slide(
    title: 'Cómo jugar cada ronda',
    description: 'Una vez completada la fase previa, comenzará a jugarse la ronda, la '
    'cual consta de 5 vueltas (una por cada carta en manos de cada jugador).\n'
    'Por cada vuelta, cada jugador tendrá que revelar una carta en el orden en que se '
    'repartió. Cuando el primer jugador de la vuelta revele su carta, se revelará un '
    'TRIUNFO SECUNDARIO, el cual corresponderá al palo de dicha carta.\n'
    'Todos los jugadores que tengan una o más cartas con el palo del TRIUNFO SECUNDARIO, '
    'deberán dar vuelta una de esas antes que las del TRIUNFO DE RONDA.\n'
    '\n'
    'Cuando un jugador NO tiene cartas del triunfo secundario, solo en esa ocasión '
    'podrá poner una carta del TRIUNFO DE RONDA, ganándole a cualquier carta en mesa '
    'que corresponda al triunfo secundario.\n'
    '\n'
    'Cuando un jugador NO tiene cartas del triunfo de ronda ni del de ronda, recién '
    'ahí es libre de lanzar cualquier carta que quiera, pero debe tener en cuenta que '
    'dicha ronda no la ganará.\n'
    '\n'
    'Si el triunfo secundario termina coincidiendo con el triunfo de ronda, todos los '
    'jugadores están obligados a poner alguna de las cartas del triunfo de ronda que '
    'tengan en su poder.\n'
    '\n'
    'Al final de cada vuelta, se decidirá el ganador de la misma por quién puso la carta '
    'con más valor. Si hay cartas del TRIUNFO DE RONDA en la mesa, la que tenga más valor '
    'por número ganará la vuelta. Si NO hay cartas con triunfo de ronda, la carta con '
    'TRIUNFO SECUNDARIO con mayor valor por numero será la ganadora.\n'
    '\n'
    'Al final de la ronda, nadie debe tener cartas restantes en su mano y se deberán '
    'contar las vueltas que cada jugador ganó durante la ronda. Cada una de esas rondas '
    'ganadas corresponde a un punto que se le resta al jugador.\n'
    '\n'
    'Aquél jugador que no haya ganado ninguna vuelta se lo denomina el BURRO y se le '
    'sumarán 5 puntos, alejandose así del 0.\n'
    '\n'
    'Si un jugador tiene 3 o menos puntos (sin haber ganado aún) y decide no jugar una '
    'ronda, debe sumarse un punto como prenda'
    
    ,
  )
];

class MoscaRulesScreen extends StatelessWidget {
  const MoscaRulesScreen({super.key});

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
