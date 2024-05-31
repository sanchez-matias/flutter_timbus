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
          child: TextField(
            controller: _controller,
            autocorrect: false,
          ),
        ),

        const SizedBox(height: 15),

        IconButton.filled(

          onPressed: () {
            if (_controller.text.isEmpty || _controller.text == '') return;
            _namesList.add(_controller.text);
            setState(() {});
            _controller.text = '';
          },
          icon: const Icon(Icons.add),
        ),

        SingleChildScrollView(
          child: Wrap(
            children: List<Widget>.generate(
              _namesList.length,
              (index) => Padding(
                padding: const EdgeInsets.all(3),
                child: Chip(
                  backgroundColor: Colors.transparent,
                  label: Text(_namesList[index]),
                ),
              ),
            ),
          ),
        ),

        MaterialButton(
          shape: const StadiumBorder(),
          onPressed: _namesList.isEmpty
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
