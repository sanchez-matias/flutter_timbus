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
        actions: [
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 85, left: 20),
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

          await showNewRoundDialog(context, moscaBloc.state.names);
          final isValid =
              moscaBloc.registerNewScoreTrigger(newScoreCubit.state);
          if (!isValid) {
            // ignore: use_build_context_synchronously
            await showBadInputDialog(context);
          }
          newScoreCubit.resetState();
        },
        child: const Icon(Icons.add),
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
            Text(
              names[index],
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
            Text(
              points[index].toString(),
              style: const TextStyle(
                  fontSize: 23, color: Colors.red, fontWeight: FontWeight.bold),
            ),
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
