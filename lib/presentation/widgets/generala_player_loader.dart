import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/presentation/bloc/blocs.dart';

class GeneralaPlayerLoader extends StatefulWidget {
  const GeneralaPlayerLoader({super.key});

  @override
  State<GeneralaPlayerLoader> createState() => _GeneralaPlayerLoaderState();
}

class _GeneralaPlayerLoaderState extends State<GeneralaPlayerLoader> {
  final _controller = TextEditingController();
  final List<String> _namesList = [];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        const Text(
          'Ingrese el nombre de cada jugador',
          style: TextStyle(fontSize: 20),
        ),

        const SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  maxLength: 10,
                  controller: _controller,
                  autocorrect: false,
                ),
              ),

              const SizedBox(width: 20),

              IconButton.filled(
                color: Colors.white,
                onPressed: () {
                  if (_controller.text.isEmpty || _controller.text == '') return;
                  _namesList.add(_controller.text);
                  _controller.text = '';
                  setState(() {});
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        SingleChildScrollView(
          child: Wrap(
            children: List<Widget>.generate(
              _namesList.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Chip(
                  backgroundColor: Colors.blue.shade100,
                  label: Text(_namesList[index]),
                  onDeleted: () {
                    _namesList.removeAt(index);
                    setState(() {});
                  },
                  deleteIcon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 30),

        FilledButton(
          onPressed: _namesList.isEmpty || _namesList.length == 1
              ? null
              : () {
                  if (_namesList.isEmpty) return;
                  context.read<GeneralaCubit>().addPlayers(_namesList);
                },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text(
              'COMENZAR',
              style: TextStyle(fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}
