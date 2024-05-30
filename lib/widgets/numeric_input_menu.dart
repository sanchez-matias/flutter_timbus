import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/bloc/blocs.dart';

class NumericInputMenu extends StatefulWidget {
  final List<String> names;
  const NumericInputMenu({super.key, required this.names});

  @override
  State<NumericInputMenu> createState() => _NumericInputMenuState();
}

class _NumericInputMenuState extends State<NumericInputMenu> {
  final List<TextEditingController> _controllers = [];
  final List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.names.length; i++) {
      _controllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newScoreCubit = BlocProvider.of<NewScoreCubit>(context);

    return ListView.separated(
      itemCount: widget.names.length,
      itemBuilder: (context, index) => Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              autofocus: index == 0 ? true : false,
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  isDense: true,
                  labelText: widget.names[index],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              onEditingComplete: () {
                final value = int.tryParse(_controllers[index].text);
                if (value == null) return;

                newScoreCubit.registerNewScore({widget.names[index]: value});

                if (index + 1 == widget.names.length) {
                  FocusScope.of(context).unfocus();
                  return;
                }

                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              },
            ),
          ),

          const SizedBox(width: 20),

          OutlinedButton(
            onPressed: () {
              _controllers[index].text = '-10';
            },
            child: const Text('-10'),
          ),
        ],
      ),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 10),
    );
  }
}
