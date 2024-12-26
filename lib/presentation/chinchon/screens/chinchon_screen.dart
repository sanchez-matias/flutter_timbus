import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/presentation/chinchon/bloc/chinchon_cubit.dart';
import 'package:flutter_timbus_annotations/presentation/shared/helpers/helpers.dart';
import 'package:flutter_timbus_annotations/presentation/shared/widgets/widgets.dart';

class ChinchonScreen extends StatelessWidget {
  const ChinchonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chinchonBloc = context.watch<ChinchonCubit>();
    final isStateEmpty = chinchonBloc.state.players.isEmpty;

    final activePlayers = chinchonBloc.state.players
        .where((player) => player.currentScore < chinchonBloc.state.limit)
        .map((player) => player.name)
        .toList();

    final menuController = MenuController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Chinchón'),
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
      bottomNavigationBar: const _CustomBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: isStateEmpty || activePlayers.isEmpty
            ? null
            : () {
              showDialog(
                  context: context,
                  builder: (context) =>
                      TextFieldsInputDialog(
                        playersNames: activePlayers,
                        callback: context.read<ChinchonCubit>().registerNewRound,
                    ),
                );
            },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}

class _CustomBottomAppBar extends StatelessWidget {
  const _CustomBottomAppBar();

  @override
  Widget build(BuildContext context) {
    final chinchonBloc = context.watch<ChinchonCubit>();
    final isStateEmpty = chinchonBloc.state.players.isEmpty;

    return BottomAppBar(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => NewPlayerDialog(
              callback: context.read<ChinchonCubit>().addNewPlayer,
            ),
          ),
          icon: const Icon(Icons.person_add, color: Colors.white),
        ),

        const SizedBox(width: 20),

        IconButton(
          onPressed: isStateEmpty
            ? null
            : () => showDialog(
              context: context,
                    builder: (context) => DeletePlayersDialog(
                      players: chinchonBloc.state.players,
                      callback: context.read<ChinchonCubit>().deletePlayer,
                    ),
            ),
          icon: const Icon(Icons.person_remove, color: Colors.white),
        ),

        const SizedBox(width: 20),

        IconButton(
          onPressed: isStateEmpty || chinchonBloc.state.areAllZero
              ? null
              : () => showDialog(
                    context: context,
                    builder: (context) => AreYouSureDialog(
                      callback: context.read<ChinchonCubit>().undoPlay,
                    ),
                  ),
          icon: const Icon(Icons.undo, color: Colors.white),
        ),
      ],
    ));
  }
}

class _PlayersView extends StatelessWidget {
  const _PlayersView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ChinchonCubit>().state;

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
            isPlayerEliminated: player.currentScore >= state.limit,
          );
        },
      ),
    );
  }
}

// enum ScoreLimitOption {
//   fifty(50),
//   seventy(70),
//   oneHundred(100);
  
//   const ScoreLimitOption(this.value);

//   final int value;
// }

class _GameOptionsMenu extends StatelessWidget {
  final Widget child;
  final MenuController controller;

  const _GameOptionsMenu({
    required this.child,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final chinchonBloc = context.watch<ChinchonCubit>();
    final isStateEmpty = chinchonBloc.state.players.isEmpty;
    final areAllZero = chinchonBloc.state.areAllZero;

    return MenuAnchor(
      controller: controller,
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Icon(Icons.onetwothree),
          child: const Text('Cambiar Límite'),
          onPressed: () async {
            final newLimit = await showDialog<int>(
              context: context,
              builder: (context) => const _ScoreLimitChanger(),
            );

            if (context.mounted && newLimit != null) {
              context.read<ChinchonCubit>().changeScoreLimit(newLimit);
            }
          },
        ),

        MenuItemButton(
          leadingIcon: const Icon(Icons.list_alt),
          child: const Text('Ver reglas del juego'),
          onPressed: () {
            Navigator.pushNamed(context, 'chinchon_rules');
          },
        ),

        MenuItemButton(
          leadingIcon: const Icon(Icons.change_circle_outlined),
          onPressed: isStateEmpty || areAllZero
              ? null
              : () => showDialog(
                  context: context,
                  builder: (context) => AreYouSureDialog(
                    callback: context.read<ChinchonCubit>().setAllZero,
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
                    callback: context.read<ChinchonCubit>().deleteMatch,
                  ),
                ),
          child: const Text('Descartar partida'),
        ),
      ],
      child: child,
    );
  }
}

class _ScoreLimitChanger extends StatelessWidget {
  const _ScoreLimitChanger();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final chinchonBloc = context.watch<ChinchonCubit>();
    final scoreLimit = chinchonBloc.state.limit;

    return AlertDialog(
      title: const Text('Nuevo límite de puntos'),
      content: SizedBox(
        height: size.height * 0.21,
        child: Column(
          children: [
              RadioListTile.adaptive(
                value: 50,
                title: const Text('50'),
                groupValue: scoreLimit,
                onChanged: (value) {
                  if (value == null) return;
    
                  context.read<ChinchonCubit>().changeScoreLimit(value);
                },
              ),
    
              RadioListTile.adaptive(
                value: 70,
                title: const Text('70'),
                groupValue: scoreLimit,
                onChanged: (value) {
                  if (value == null) return;
    
                  context.read<ChinchonCubit>().changeScoreLimit(value);
                },
              ),
    
              RadioListTile.adaptive(
                value: 100,
                title: const Text('100'),
                groupValue: scoreLimit,
                onChanged: (value) {
                  if (value == null) return;
    
                  context.read<ChinchonCubit>().changeScoreLimit(value);
                },
              ),
          ],
        )
      ),
    );
  }
}
