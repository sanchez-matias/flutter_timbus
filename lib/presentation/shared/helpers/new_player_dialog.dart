import 'package:flutter/material.dart';

class NewPlayerDialog extends StatefulWidget {
  final void Function(String name) callback;

  const NewPlayerDialog({super.key, required this.callback});

  @override
  State<NewPlayerDialog> createState() => _NewPlayerDialogState();
}

class _NewPlayerDialogState extends State<NewPlayerDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nuevo Jugador'),
      content: TextField(
        autofocus: true,
        controller: _controller,
        onChanged: (value) {
          _controller.text = value;
        },
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            if (_controller.text.trim() != '') {
              widget.callback(_controller.text);
            }

            Navigator.of(context).pop();
          },
          label: const Text('Agregar'),
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }
}
