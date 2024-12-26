import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/presentation/mosca/bloc/mosca_cubit.dart';
import 'package:flutter_timbus_annotations/presentation/shared/helpers/helpers.dart';
import 'package:flutter_timbus_annotations/presentation/shared/widgets/widgets.dart';

class MoscaScreen extends StatelessWidget {
  const MoscaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moscaBloc = context.watch<MoscaCubit>();

    final activePlayers = moscaBloc.state.players
        .where((player) => player.currentScore > 0)
        .map((player) => player.name)
        .toList();

    final menuController = MenuController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('La Mosca'),
        actions: [
          _GameOptionsMenu(
            controller: menuController,
            child: IconButton(
              onPressed: () => menuController.open(),
              icon: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),

      body: const _PlayersView(),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Anotar nueva jugada',
        onPressed: activePlayers.isEmpty
          ? null
          : () => showDialog(
            barrierDismissible: false,
            context: context,
                  builder: (context) => _ChoicePopUpMenu(
                    names: activePlayers,
                  ),
                ),
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,

      bottomNavigationBar: const _BottomAppBar(),
    );
  }
}

class _PlayersView extends StatelessWidget {
  const _PlayersView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MoscaCubit>().state;

    if (state.players.isEmpty) {
      return const Center(
        child: Text('No hay jugadores cargados'),
      );
    }
 
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: state.players.length,
        itemBuilder: (context, index) {
          final player = state.players[index];
      
          return ScoreColumn(
            name: player.name,
            currentScore: player.currentScore,
            scoreHistory: player.scoreHistory,
            isPlayerEliminated: player.currentScore <= 0,
          );
        },
      ),
    );
  }
}

class _BottomAppBar extends StatelessWidget {
  const _BottomAppBar();

  @override
  Widget build(BuildContext context) {
    final moscaBloc = context.watch<MoscaCubit>();
    final isStateEmpty = moscaBloc.state.players.isEmpty;

    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => NewPlayerDialog(
                callback: context.read<MoscaCubit>().addPlayer,
              ),
            ),
            icon: const Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            tooltip: 'Agregar jugador',
          ),
    
          const SizedBox(width: 20),
    
          IconButton(
            onPressed: isStateEmpty
              ? null
              : () => showDialog(
                  context: context,
                  builder: (context) => DeletePlayersDialog(
                    players: moscaBloc.state.players,
                    callback: context.read<MoscaCubit>().deletePlayer,
                  ),
              ),
            icon: const Icon(
              Icons.person_remove,
              color: Colors.white,
            ),
            tooltip: 'Eliminar jugador',
          ),
    
          const SizedBox(width: 20),

          IconButton(
            onPressed: isStateEmpty
                ? null
                : () => showDialog(
                      context: context,
                      builder: (context) => AreYouSureDialog(
                        callback: context.read<MoscaCubit>().undoRound,
                      ),
                    ),
            icon: const Icon(
              Icons.undo,
              color: Colors.white,
            ),
            tooltip: 'Deshacer última jugada',
          ),
        ],
      ),
    );
  }
}

class _ChoicePopUpMenu extends StatefulWidget {
  final List<String> names;

  const _ChoicePopUpMenu({required this.names});

  @override
  State<_ChoicePopUpMenu> createState() => _ChoicePopUpMenuState();
}

class _ChoicePopUpMenuState extends State<_ChoicePopUpMenu> {
  final List<int> possibleScores = [5, 1, 0, -1, -2, -3, -4, -5];

  Map<String, int> roundsScores = {};
  String selectedPlayer = '';

  @override
  void initState() {
    for (final name in widget.names) {
      roundsScores[name] = 0;
    }

    super.initState();
  }

  int scoresSum(List<int> scores) {
    if (scores.isEmpty) return 0;

    var counter = 0; 
    for (var score in scores) {
      counter = counter + score;
    }
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    // Every round must sum -5 between all the players who won at least 1 round.
    final isInputValid = -5 == scoresSum(
      roundsScores.values.where((score) => score < 0).toList(),
    );

    final size = MediaQuery.sizeOf(context);

    return AlertDialog(
      title: const Text('Nueva ronda'),
      content: MenuAnchor(
        menuChildren: List.generate(
          possibleScores.length,
          (index) => MenuItemButton(
            child: Text(
              possibleScores[index].toString(),
              style: const TextStyle(fontSize: 18),
            ),
            onPressed: () {
              if (selectedPlayer == '') return;
              final selectedScore = possibleScores[index];

              setState(() {
                roundsScores[selectedPlayer] = selectedScore;
              });
            },
          ),
        ),
        builder: (context, controller, child) {
          return SizedBox(
            height: 50 + (50 * widget.names.length).toDouble(),
            width: size.width * 0.7,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.names.length,
              itemBuilder: (context, index) {
                  final name = widget.names[index];
                  
                  return ListTile(
                    title: Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    trailing: Text(
                      roundsScores[name].toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      setState(() {
                        selectedPlayer = name;
                      });
                      controller.open(position: Offset.fromDirection(0));
                    },
                );
              },
            ),
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),

        FilledButton.icon(
          onPressed: !isInputValid
            ? null
            : () {
              context.read<MoscaCubit>()
                .registerNewRound(roundsScores);

              Navigator.pop(context);
            },
          label: const Text('Aceptar'),
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }
}

class _GameOptionsMenu extends StatelessWidget {
  final Widget child;
  final MenuController controller;

  const _GameOptionsMenu({
    required this.child,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final moscaBloc = context.watch<MoscaCubit>();
    final isStateEmpty = moscaBloc.state.players.isEmpty;

    return MenuAnchor(
      controller: controller,
      menuChildren: [

        MenuItemButton(
          leadingIcon: const Icon(Icons.list_alt),
          child: const Text('Ver reglas del juego'),
          onPressed: () {
            Navigator.pushNamed(context, 'mosca_rules');
          },
        ),

        MenuItemButton(
          leadingIcon: const Icon(Icons.change_circle_outlined),
          onPressed: isStateEmpty
              ? null
              : () => showDialog(
                  context: context,
                  builder: (context) => AreYouSureDialog(
                    callback: context.read<MoscaCubit>().restartGame,
                  ),
                ),
          child: const Text('Volver a Empezar'),
        ),

        MenuItemButton(
          leadingIcon: const Icon(Icons.delete),
          onPressed: isStateEmpty
              ? null
              : () => showDialog(
                  context: context,
                  builder: (context) => AreYouSureDialog(
                    callback: context.read<MoscaCubit>().resetGame,
                  ),
                ),
          child: const Text('Descartar partida'),
        ),
      ],
      child: child,
    );
  }
}