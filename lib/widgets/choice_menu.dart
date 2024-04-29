import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/bloc/new_score/new_score_cubit.dart';

class ChoicePopUpMenu extends StatefulWidget {
  final List<String> names;

  const ChoicePopUpMenu({super.key, required this.names});

  @override
  State<ChoicePopUpMenu> createState() => _ChoicePopUpMenuState();
}

class _ChoicePopUpMenuState extends State<ChoicePopUpMenu> {
  String selectedPlayer = '';
  final List<int> possibleScores = [5, 1, 0, -1, -2, -3, -4, -5];

  @override
  Widget build(BuildContext context) {
    final newScoreCubit = BlocProvider.of<NewScoreCubit>(context);

    return MenuAnchor(
      menuChildren: List.generate(
        possibleScores.length,
        (index) => MenuItemButton(
            child: Text(possibleScores[index].toString(), style: const TextStyle(fontSize: 18)),
            onPressed: () {
              newScoreCubit
                  .registerNewScore({selectedPlayer: possibleScores[index]});
              setState(() {});
            })),
      builder: (context, controller, child) {
        return ListView.builder(
            itemCount: widget.names.length,
            itemBuilder: (context, index) {
              final name = widget.names[index];

              return ListTile(
                title: Text(widget.names[index], style: const TextStyle(fontWeight: FontWeight.w900),),
                trailing: Text(
                  newScoreCubit.state[name] == null
                      ? 'Sin Puntaje'
                      : '${newScoreCubit.state[name]}',
                  style: const TextStyle(fontSize: 15),
                ),
                onTap: () {
                  setState(() {
                    selectedPlayer = widget.names[index];
                  });
                  // print('SELECTED PLAYER: $selectedPlayer');
                  controller.open(position: Offset.fromDirection(0));
                },
              );
            });
      },
    );
  }
}
