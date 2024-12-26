import 'package:flutter/material.dart';

class TextFieldsInputDialog extends StatefulWidget {
  final List<String> playersNames;
  final void Function(Map<String, int> scores) callback;

  const TextFieldsInputDialog({
    super.key,
    required this.playersNames,
    required this.callback,
  });

  @override
  State<TextFieldsInputDialog> createState() => _TextFieldsInputDialogState();
}

class _TextFieldsInputDialogState extends State<TextFieldsInputDialog> {
  final List<FocusNode> _focusNodes = [];
  Map<String, int> scores = {};

  @override
  void initState() {
    super.initState();
    
    for (var name in widget.playersNames) {
      scores[name] = 0;
    }

    for (int i = 0; i < widget.playersNames.length; i++) {
      _focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Anota una nueva ronda'),
      content: SizedBox(
        width: 400.0,
        height: 30 + (60 * widget.playersNames.length).toDouble(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView.builder(
            itemCount: widget.playersNames.length,
            itemBuilder: (BuildContext context, int index) {
              // TODO: Extract TextField widget
              return Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  focusNode: _focusNodes[index],
                  autofocus: index == 0 ? true : false,
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: widget.playersNames[index],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onChanged: (value) {
                    final query = int.tryParse(value);
                    if (query == null) return;
                
                    scores[widget.playersNames[index]] = query;
                    // newScoreCubit.registerNewScore({widget.names[index]: query});
                  },
                  onEditingComplete: () {
                    if (index + 1 == widget.playersNames.length) {
                      FocusScope.of(context).unfocus();
                      return;
                    }
                
                    FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                  },
                ),
              );
            },
          ),
        ),
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);

            widget.callback(scores);
          },
          icon: const Icon(Icons.done),
          label: const Text('Listo'),
        ),
      ],
    );
  }
}