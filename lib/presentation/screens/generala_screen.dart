import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/presentation/bloc/blocs.dart';
import 'package:flutter_timbus_annotations/presentation/helpers/dialogs.dart';
import 'package:flutter_timbus_annotations/presentation/widgets/generala_player_loader.dart';
import 'package:flutter_timbus_annotations/presentation/widgets/generala_radios.dart';

class GeneralaScreen extends StatelessWidget {
  const GeneralaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final generalaCubit = BlocProvider.of<GeneralaCubit>(context);

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
          actions: [
            IconButton(
              tooltip: 'Reiniciar',
              onPressed: () async {
                if (generalaCubit.state.players.isEmpty) return;
                final areYouSure = await showAreYouSureDialog(context);
                if (!areYouSure) return;

                generalaCubit.reset();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ],
          title: const Text('Generala'),
        ),
        body: BlocBuilder<GeneralaCubit, GeneralaState>(
          builder: (context, state) {
            return state.players.isEmpty
                ? const GeneralaPlayerLoader()
                : _buildSubmitedPlayers(state);
          },
        ));
  }

  Widget _buildSubmitedPlayers(GeneralaState state) {
    const scoreNameRow = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      'Escalera',
      'Full',
      'Poker',
      'Generala',
      'Doble',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Table(
        columnWidths: const {0: FixedColumnWidth(80)},
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          // Names Row
          TableRow(
            children: [
              const SizedBox(),
              ...List.generate(
                  state.players.length,
                  (index) => Text(
                        state.names[index].toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      )),
            ],
          ),

          // Scores Rows
          ...List.generate(
            11,
            (rowIndex) => TableRow(children: [
              Text(
                scoreNameRow[rowIndex],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              ...List.generate(
                  state.players.length,
                  (columnIndex) => TableCell(
                        selectedPlayer: columnIndex,
                        selectedRow: rowIndex,
                      )),
            ]),
          ),

          // Global Scores Row
          TableRow(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              children: [
                const Text(
                  'TOTALES',
                  textAlign: TextAlign.right,
                ),
                ...List.generate(
                    state.players.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            state.globalScores[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ))
              ]),
        ],
      ),
    );
  }
}

class TableCell extends StatelessWidget {
  final int selectedPlayer;
  final int selectedRow;

  const TableCell({
    super.key,
    required this.selectedPlayer,
    required this.selectedRow,
  });

  Future<void> showSetScoreDialog(BuildContext context, int intialValue) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: const Text('Ingrese su puntaje'),
          content: GeneralaRadios(
            playerIndex: selectedPlayer,
            selectedRow: selectedRow,
            initialValue: intialValue,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final generalaCubit = BlocProvider.of<GeneralaCubit>(context);
    final player = generalaCubit.state.players[selectedPlayer];

    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          color: player.isCellCrossedOut(selectedRow)
              ? Colors.red
              : player.scoresList[selectedRow] == 0
                  ? Colors.grey
                  : Colors.green,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            if (!context.mounted) return;
            await showSetScoreDialog(context, player.scoresList[selectedRow]);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              player.isCellCrossedOut(selectedRow)
                  ? 'X'
                  : player.scoresList[selectedRow].toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
