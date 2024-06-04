import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_timbus_annotations/domain/entities/generala_player.dart';

part 'generala_state.dart';

class GeneralaCubit extends Cubit<GeneralaState> {
  GeneralaCubit() : super(const GeneralaState());

  void addPlayers(List<String> names) {
    List<GeneralaPlayer> playersList = [];

    for (final name in names) {
      playersList.add(GeneralaPlayer(name: name));
    }

    if (playersList.isEmpty || playersList.length == 1) return;
    emit(state.copyWith(players: playersList));
  }

  void changeCellValue({
    required int playerIndex,
    required int rowIndex,
    required GeneralaCell newValue,
  }) {
    var playersListCopy = List<GeneralaPlayer>.from(state.players).toList();
    final player = state.players[playerIndex];
    final selectedMapKey = player.scoresMap.keys.toList()[rowIndex];
    final updatedPlayer =
        player.copyWith(newScores: {selectedMapKey: newValue});

    playersListCopy.removeAt(playerIndex);
    playersListCopy.insert(playerIndex, updatedPlayer);
    emit(state.copyWith(players: playersListCopy));
  }

  

  void reset() {
    emit(state.copyWith(players: const []));
  }
}
