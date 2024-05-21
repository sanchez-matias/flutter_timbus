import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_timbus_annotations/entities/generala_player.dart';

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

  void changeBoxValue({
    required int playerIndex,
    required int rowIndex,
    required int newValue,
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

  void crossOutCell({
    required int playerIndex,
    required int rowIndex,
  }) {
    var playersListCopy = List<GeneralaPlayer>.from(state.players).toList();
    final player = state.players[playerIndex];
    final updatedPlayer = player.copyWith(
      newScores: {},
      crossedOutCells: [...player.crossedOutCells, rowIndex],
    );

    playersListCopy.removeAt(playerIndex);
    playersListCopy.insert(playerIndex, updatedPlayer);
    emit(state.copyWith(players: playersListCopy));
  }

  void removeCrossOut({
    required int playerIndex,
    required int rowIndex,
  }) {
    var playersListCopy = List<GeneralaPlayer>.from(state.players).toList();
    final crossesListCopy = playersListCopy[playerIndex].crossedOutCells;
    crossesListCopy.remove(rowIndex);

    final playerCopy = state.players[playerIndex].copyWith(
      newScores: {},
      crossedOutCells: crossesListCopy,
    );

    playersListCopy.removeAt(playerIndex);
    playersListCopy.insert(playerIndex, playerCopy);

    emit(state.copyWith(
      players: playersListCopy,
    ));
    

    
  }

  void reset() {
    emit(state.copyWith(players: const []));
  }
}
