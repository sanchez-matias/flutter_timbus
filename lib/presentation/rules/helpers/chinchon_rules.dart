import 'package:flutter/material.dart';
import 'package:flutter_timbus_annotations/presentation/rules/widgets/rules_slide.dart';

const _slides = <Slide>[
  Slide(
    title: 'Cómo jugar',
    description:
        'Este es un juego de todos contra todos y los jugadores se deberán eliminar '
        'hasta quedar solo un jugador, quien será el ganador del partido.\n'
        '\n'
        'Para el chinchón, se recomienda jugar con un máximo de 5 jugadores, aunque no '
        'existe un límite inviolable. Esto es porque las rondas se juegan con muchas '
        'cartas en mano y deben sobrar varias para dejar en el mazo.\n'
        '\n'
        'Luego de mezclar el mazo, deberemos repartir 7 cartas a cada jugador y una vez '
        'que cada jugador tenga sus 7 cartas se deja el mazo en el medio y se da vuelta '
        'la carta de arriba del mazo. Dicha carta será la primera de la pila de descarte, '
        'por lo que en este lugar iremos dejando las cartas que no nos sirven.\n'
        '\n'
        'En cada ronda deberemos formar combinaciones de diferentes cartas hasta que '
        'TODAS las cartas en nuestro poder sean parte de una combinación. Para llegar '
        'a ese objetivo deberemos tomar una carta del mazo o de la pila de descarte '
        'y dejar una carta en la pila de descarte, teniendo 7 cartas en la mano al '
        'final del turno. Cabe aclarar que solo se puede sacar la carta cuando sea el '
        'turno del jugador, ya que dichos turnos van en orden de ronda.\n'
        '\n'
        'Una vez que un jugador termine de armar su mano de cartas, deberá usar una '
        'que le sobre para cortar la ronda, colocándola boca abajo para indicar que '
        'la ronda se terminó. En ese momento nadie puede seguir sacando cartas y TODOS '
        'deben mostrar su mano de cartas.\n'
        '\n'
        'Si todas las cartas que tiene el jugador que cortó la ronda forman parte de una '
        'combinación, al mismo se le restarán 10 puntos. A todos los otros se le sumarán '
        'todos los puntos correspondientes a sumar el valor numérico de las cartas que no '
        'formen parte de una combinación.\n'
        '\n'
        'Antes de sumar los puntos, los jugadores que no cortaron podrán colar cartas en '
        'las combinaciones de cualquiera de sus compañeros. Esto es con el objetivo de '
        'sumar menos puntos.\n'
        '\n'
        'Todo jugador que llegue a los 100 puntos queda automaticamente eliminado y el '
        'último en pie será el ganador. Sin embargo, también se puede modificar el límite '
        'de puntos para hacer la partida más corta. Normalmente se lo acorta a 50 puntos.',
  ),
  Slide(
    title: 'Combinaciones posibles',
    description: '>  Pierna: juntar 3 o 4 cartas del mismo valor numérico\n'
        '\n'
        '>  Escalera: juntar 3 o más cartas del mismo palo que estén en orden de '
        'escalera\n'
        '\n'
        '>  Chinchón: hacer una sola escalera con todas las 7 cartas que se tienen en '
        'la mano. Esta combinación hace que el jugador gane automaticamente la partida.',
  ),
];

class ChinchonRulesScreen extends StatelessWidget {
  const ChinchonRulesScreen({super.key});

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
