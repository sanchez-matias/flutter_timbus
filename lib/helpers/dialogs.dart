import 'package:flutter/material.dart';
import 'package:flutter_timbus_annotations/widgets/choice_menu.dart';

Future<String?> showNewPlayerDialog(BuildContext context) async {
  final textController = TextEditingController(text: '');

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Nuevo Jugador'),
      content: TextField(
        autofocus: true,
        controller: textController,
        onChanged: (value) {
          textController.text = value;
        },
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            if (textController.text.trim() == '') return;

            Navigator.of(context).pop();
          },
          label: const Text('Agregar'),
          icon: const Icon(Icons.done),
        ),
      ],
    ),
  );

  return textController.text.trim().toUpperCase();
}

Future<void> showNewRoundDialog(
  BuildContext context,
  List<String> names,
) async {
  if (!context.mounted) return;

  if (names.length <= 1) {
    _showNotEnoughPlayersDialog(context);
  }

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Anota una nueva ronda'),
      content: SizedBox(
        width: 400.0,
        height: 30 + (50 * names.length).toDouble(),
        child: ChoicePopUpMenu(names: names),
      ),
      actions: [
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.done),
            label: const Text('Listo'))
      ],
    ),
  );
}

Future<void> _showNotEnoughPlayersDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => const AlertDialog(
        content: SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '¡Debes agregar al menos 2 jugadores a la partida!',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text('Si no, no es divertido')
        ],
      ),
    )),
  );
}

Future<void> showBadInputDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => const AlertDialog(
      title: Text('Puntajes mal ingresados'),
      content: Text(
          'Debes ingresar el puntaje correspondiente para todos los jugadores, incluso cuando no ha jugado la ronda.'),
    ),
  );
}

Future<String?> showDeletePlayerDialog(
  BuildContext context,
  List<String> names,
) async {
  String? deletedPlayer;

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Seleccione el jugador retirado'),
      content: SizedBox(
        width: 400.0,
        height: 30 + (50 * names.length).toDouble(),
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(names[index]),
            onTap: () {
              deletedPlayer = names[index];
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    ),
  );

  return deletedPlayer;
}

Future<bool> showAreYouSureToDeleteDialog(BuildContext context) async {
  bool sure = false;

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('¿Estás seguro?'),
      content: const Text(
          'Una vez eliminado no vas a poder recuperar al jugador. Solo podrás crear uno nuevo que entra colado.'),
      actions: [
        OutlinedButton.icon(
            onPressed: () {
              sure = false;
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear),
            label: const Text('No')),
        FilledButton.icon(
          onPressed: () {
            sure = true;
            Navigator.pop(context);
          },
          icon: const Icon(Icons.done),
          label: const Text('Sí'),
        ),
      ],
    ),
  );

  return sure;
}

Future<bool> showAreYouSureToUndoDialog(BuildContext context) async {
  bool sure = false;

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('¿Estás seguro?'),
      content: const Text(
          'Una vez deshecha no vas a poder recuperar los puntajes de la ronda.'),
      actions: [
        OutlinedButton.icon(
            onPressed: () {
              sure = false;
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear),
            label: const Text('No')),
        FilledButton.icon(
          onPressed: () {
            sure = true;
            Navigator.pop(context);
          },
          icon: const Icon(Icons.done),
          label: const Text('Sí'),
        ),
      ],
    ),
  );

  return sure;
}
