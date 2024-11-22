import 'package:flutter/material.dart';

class AreYouSureDialog extends StatelessWidget {
  final Function callback;
  final int? id;

  const AreYouSureDialog({super.key, required this.callback, this.id});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('¿Estás seguro de realizar esta acción?'),
      actions: [
        OutlinedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear),
            label: const Text('No')),
        FilledButton.icon(
          onPressed: () {
            if (id == null) {
              callback();
            } else {
              callback(id);
            }
            
            Navigator.pop(context);
          },
          icon: const Icon(Icons.done),
          label: const Text('Sí'),
        ),
      ],
    );
  }
}
