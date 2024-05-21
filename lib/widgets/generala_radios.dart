import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timbus_annotations/bloc/blocs.dart';

class GeneralaRadios extends StatelessWidget {
  final int selectedRow;
  final int initialValue;
  final int playerIndex;

  const GeneralaRadios({
    super.key,
    required this.selectedRow,
    required this.initialValue,
    required this.playerIndex,
  });

  bool get isNumericType => selectedRow >= 0 && selectedRow <= 5;

  // This get will return the default score of the straight, full, generala or double.
  int get nonNumericScoreValue {
    switch (selectedRow) {
      case 6:
        return 20;
      case 7:
        return 30;
      case 8:
        return 50;
      case 9:
        return 100;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final generalaCubit = BlocProvider.of<GeneralaCubit>(context);
    final selectedPlayer = generalaCubit.state.players[playerIndex];

    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        // Zero option
        _buildCustomRadioButton(
          label: '0',
          value: 0,
          groupValue: selectedPlayer.isCellCrossedOut(selectedRow)
            ? 0
            : selectedPlayer.scoresList[selectedRow],
          onChanged: (p0) async {
            generalaCubit.changeBoxValue(
              playerIndex: playerIndex,
              rowIndex: selectedRow,
              newValue: 0,
            );

            generalaCubit.removeCrossOut(
              playerIndex: playerIndex,
              rowIndex: playerIndex,
            );

            await Future.delayed(const Duration(milliseconds: 200));
            if (!context.mounted) return;
            Navigator.pop(context);
          },
        ),

        // Numeric score options
        ...List.generate(
            isNumericType ? 5 : 0,
            (index) => _buildCustomRadioButton(
                  label: '${(index + 1) * (selectedRow + 1)}',
                  value: (index + 1) * (selectedRow + 1),
                  groupValue: selectedPlayer.scoresList[selectedRow],
                  onChanged: (value) async {
                    generalaCubit.changeBoxValue(
                      playerIndex: playerIndex,
                      rowIndex: selectedRow,
                      newValue: value!,
                    );

                    generalaCubit.removeCrossOut(
                      playerIndex: playerIndex,
                      rowIndex: playerIndex,
                    );

                    await Future.delayed(const Duration(milliseconds: 200));
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                )),

        // Non-numeric score options
        ...List.generate(
            isNumericType ? 0 : 2,
            (index) => _buildCustomRadioButton(
                  label: index == 0 ? 'Armada' : 'Servida',
                  value: nonNumericScoreValue + (5 * index),
                  groupValue: selectedPlayer.scoresList[selectedRow],
                  onChanged: (value) async {
                    if (!context.mounted) return;
                    generalaCubit.changeBoxValue(
                      playerIndex: playerIndex,
                      rowIndex: selectedRow,
                      newValue: value!,
                    );

                    await Future.delayed(const Duration(milliseconds: 200));
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                )),

        // This is the last option in the scores list, which represents the option to cross out a cell.
        _buildCustomRadioButton(
          label: 'X',
          value: -1,
          groupValue: selectedPlayer.isCellCrossedOut(selectedRow)
            ? 0
            : selectedPlayer.scoresList[selectedRow],
          onChanged: (p0) async {
            generalaCubit.changeBoxValue(
              playerIndex: playerIndex,
              rowIndex: selectedRow,
              newValue: 0,
            );

            generalaCubit.crossOutCell(
              playerIndex: playerIndex,
              rowIndex: selectedRow,
            );

            await Future.delayed(const Duration(milliseconds: 200));
            if (!context.mounted) return;
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  Widget _buildCustomRadioButton({
    required String label,
    required int value,
    required int groupValue,
    void Function(int?)? onChanged,
  }) =>
      Column(
        children: [
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      );
}
