import 'package:flutter/material.dart';
import 'package:flutter_timbus_annotations/presentation/helpers/are_you_sure_dialog.dart';

class DeletePlayersDialog extends StatelessWidget {
  // Players variable must contain a list of players that have the
  // id and name parameters.
  final List<dynamic> players;
  final void Function(int id) callback;

  const DeletePlayersDialog({
    super.key,
    required this.players,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Seleccione el jugador retirado'),
      content: SizedBox(
        width: 400.0,
        height: 30 + (50 * players.length).toDouble(),
        child: ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(players[index].name),
            onTap: () async {
              if (context.mounted) {
                Navigator.of(context).pop();
              }

              await showDialog(
                context: context,
                builder: (context) => AreYouSureDialog(
                  callback: callback,
                  id: players[index].id,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
