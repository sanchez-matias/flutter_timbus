import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/presentation/bloc/chinchon/chinchon_bloc.dart';
import 'package:flutter_timbus_annotations/presentation/bloc/new_score/new_score_cubit.dart';
import 'package:flutter_timbus_annotations/presentation/helpers/dialogs.dart';

class ChinchonScreen extends StatelessWidget {
  const ChinchonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chinchonBloc = BlocProvider.of<ChinchonBloc>(context);
    final newScoreCubit = BlocProvider.of<NewScoreCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text('Chinchón'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
        child: BlocBuilder<ChinchonBloc, ChinchonState>(
          builder: (context, state) {
            if (state.players.isEmpty) {
              return const Center(
                child: Text('No hay judores. Por favor cargue dos o más.'),
              );
            }

            return _buildScores(
              state: state,
              names: state.names.map((name) {
                if (name.length > 4) {
                  return name.substring(0, 4);
                } else {
                  return name;
                }
              }).toList(),
              points: state.currentScores,
              histories: state.histories,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () async {
              if (!context.mounted) return;

              final name = await showNewPlayerDialog(context);
              if (name == null || name == '') return;
              chinchonBloc.add(NewPlayer(name));
            },
            icon: const Icon(Icons.person_add, color: Colors.white),
          ),

          const SizedBox(width: 20),

          IconButton(
            onPressed: () async {
              if (chinchonBloc.state.players.isEmpty) return;
              final deletedPlayer = await showDeletePlayerDialog(
                  context, chinchonBloc.state.names);
              if (deletedPlayer == null) return;

              if (!context.mounted) return;
              final areYouSure = await showAreYouSureToDeleteDialog(context);

              if (!areYouSure) return;
              chinchonBloc.add(RemovePlayer(deletedPlayer));
            },
            icon: const Icon(Icons.person_remove, color: Colors.white),
          ),

          const SizedBox(width: 20),

          IconButton(
            onPressed: () async {
              if (chinchonBloc.state.histories
                  .where((aScoreHistory) => aScoreHistory.isNotEmpty)
                  .isEmpty) return;

              if (!context.mounted) return;
              final areYouSure = await showAreYouSureToUndoDialog(context);

              if (!areYouSure) return;
              chinchonBloc.add(CancelPlay());
            },
            icon: const Icon(Icons.undo, color: Colors.white),
          ),

        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (chinchonBloc.state.players.isEmpty) return;
          await chinchonNewRoundDialog(context, chinchonBloc.state.names);
          final isValid =
              chinchonBloc.registerNewScoreTrigger(newScoreCubit.state);
          if (!isValid) {
            if (!context.mounted) return;
            await showBadInputDialog(context);
          }
          newScoreCubit.resetState();
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }

  Widget _buildScores({
    required ChinchonState state,
    required List<String> names,
    required List<int> points,
    required List<List<int>> histories,
  }) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: state.players.length,
      itemBuilder: (context, index) {
        final playerHistory =
            histories[index].isEmpty ? ['...'] : histories[index];

        return Column(
          children: [
            // Player Name
            Text(
              names[index],
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),

            // Player current score
            Text(
              points[index].toString(),
              style: const TextStyle(
                  fontSize: 23, color: Colors.red, fontWeight: FontWeight.bold),
            ),

            // Player history of score
            ...List.generate(playerHistory.length,
                (historyIndex) => Text(playerHistory[historyIndex].toString())),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const VerticalDivider(),
    );
  }
}
