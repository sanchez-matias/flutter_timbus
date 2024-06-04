import 'package:flutter/material.dart';
import 'package:flutter_timbus_annotations/presentation/widgets/rules_slide.dart';

const _slides = <Slide>[
  Slide(
    title: 'Cómo jugar',
    description:
        'Para empezar, deberemos contar con al menos dos jugadores, 5 dados y, '
        'preferiblemente, una superficie plana y aspera que permita lanzar los '
        'dados de una forma cómoda sin que se caigan ni se deslizen.\n'
        '\n'
        'Este es un juego que se desarrolla por rondas, por lo que los dados '
        'deben ser tirados una vez por jugador en el sentido de la ronda que '
        'que formen.\n'
        '\n'
        'Por cada ronda, cada jugador tendrá hasta 3 tiros para intentar formar '
        'juegos de dados predefinidos que le sumarán puntos, siendo el jugador '
        'quien decida qué dados tirar en cualquiera de los tiros. Al final de las '
        'once rondas, ganará el jugador que más puntos haya hecho con los juegos '
        'que logró formar con los dados.\n'
        '\n'
        'En la mayoría de casos, los dados formarán juegos que pueden ser '
        'válidos para más de un tipo de combinación. El jugador es el que '
        'terminará decidiendo qué tipo de combinación es la que quiere '
        'anotarse, pero debe ser solo una de ellas.\n'
        '\n'
        'En más de una ocasión, el jugador puede no tener suerte y terminar '
        'sin haber formado una combinación de dados válida. En este caso en '
        'donde el jugador está sin opciones, debe optar por tacharse una celda '
        'en donde se inhabilita dicha celda, impidiendo que se puedan sumar '
        'puntos en la misma por el resto de la partida.',
  ),
  Slide(
    title: 'Combinaciones o juegos posibles',
    description:
        '>  Numéricos: son los correspondientes a la fila del 1 al 6 en la tabla y '
        'se forman sacando dados de un mismo valor. En caso de haber buscado una '
        'combinación y haber fallado, se puede buscar el dado de menor valor y '
        'anotarselo como una combinación de 1 dado en la celda correspondiente.\n'
        '\n'
        '>  Escalera: Se forma cuando todos los dados estan ordenados en escalera '
        'del 1 al 5 o del 2 al 6.\n'
        '\n'
        '>  Full: Es formado cuando se sacan 3 dados de un valor A y otros 2 del '
        'valor B.\n'
        '\n'
        '>  Poker: Se forma cuando se sacan 4 dados del valor A y 1 del valor B. \n'
        '\n'
        '>  Generala: Se forma cuando se sacan 5 dados iguales. Si los cinco '
        'salieron de una sola tirada, ese jugador gana automaticamente la partida.\n'
        '\n'
        '>  Doble Generala: Se forma cuando, habiendo formado generala, la misma '
        'vuelve a salir. Tambien aplica la regla para cuando sale en una tirada.',
  ),
];

class GeneralaRulesScreen extends StatelessWidget {
  const GeneralaRulesScreen({super.key});

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
