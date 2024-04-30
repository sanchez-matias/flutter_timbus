import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/bloc/mosca/mosca_bloc.dart';
import 'package:flutter_timbus_annotations/bloc/new_score/new_score_cubit.dart';
import 'package:flutter_timbus_annotations/helpers/dialogs.dart';

class MoscaScreen extends StatelessWidget {
  const MoscaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moscaBloc = BlocProvider.of<MoscaBloc>(context);
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
        title: const Text('La Mosca'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20),
        child: BlocBuilder<MoscaBloc, MoscaState>(
          builder: (context, state) {
            if (state.players.isEmpty) {
              return const Center(
                child: Text('No hay jugadores ni puntajes registrados'),
              );
            }

            return _buildScores(
              state: state,
              histories: moscaBloc.state.histories,
              names: state.names.map((name) {
                if (name.length > 4) {
                  return name.substring(0, 4);
                } else {
                  return name;
                }
              }).toList(),
              points: state.currentScores,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Anotar nueva jugada',
        onPressed: () async {
          if (!context.mounted) return;

          if ( moscaBloc.state.players.isEmpty) return;
          await showNewRoundDialog(context, moscaBloc.state.names);
          final isValid = moscaBloc.registerNewScoreTrigger(newScoreCubit.state);
          if (!isValid){
            // ignore: use_build_context_synchronously
            await showBadInputDialog(context);
          }
          newScoreCubit.resetState();
        },
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,

      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              onPressed: () async {
                if (!context.mounted) return;

                final name = await showNewPlayerDialog(context);
                if (name == null || name == '') return;
                moscaBloc.add(AddPlayer(name));
              },
              icon: const Icon(
                Icons.person_add,
                color: Colors.white,
              ),
              tooltip: 'Agregar jugador',
            ),

            const SizedBox(width: 20),

            IconButton(
              onPressed: () async {
                if (!context.mounted) return;
                final deletedPlayer = await showDeletePlayerDialog(context, moscaBloc.state.names);
                if (deletedPlayer == null) return;

                if (!context.mounted) return;
                final areYouSure = await showAreYouSureToDeleteDialog(context);

                if (!areYouSure) return;
                moscaBloc.add(DeletePlayer(deletedPlayer));
              },
              icon: const Icon(
                Icons.person_remove,
                color: Colors.white,
              ),
              tooltip: 'Eliminar jugador',
            ),

            const SizedBox(width: 20),

            IconButton(
              onPressed: () async {
                if (moscaBloc.state.histories.where((aScoreHistory) => aScoreHistory.isNotEmpty).isEmpty) return;

                if (!context.mounted) return;
                final areYouSure = await showAreYouSureToUndoDialog(context);

                if (!areYouSure) return;
                moscaBloc.add(UndoPlay());
              },
              icon: const Icon(
                Icons.undo,
                color: Colors.white,
              ),
              tooltip: 'Deshacer última jugada',
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildScores({
    required MoscaState state,
    required List<String> names,
    required List<int> points,
    required List<List<int>> histories,
  }) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: state.numberOfPlayers,
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
