import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_timbus_annotations/data/datasources/storage_datasource.dart';
import 'package:flutter_timbus_annotations/data/repositories/storage_repository_impl.dart';
import 'package:flutter_timbus_annotations/domain/entities/generala_player.dart';

part 'generala_state.dart';

class GeneralaCubit extends Cubit<GeneralaState> {
  final _repository = StorageRepositoryImpl(StorageDatasourceImpl());

  GeneralaCubit() : super(const GeneralaState());

  void init() async {
    final players = await _repository.getGeneralaPlayers();
    emit(state.copyWith(players: players));
  }

  void addPlayers(List<String> names) async {
    List<GeneralaPlayer> playersList = [];

    for (final name in names) {
      playersList.add(GeneralaPlayer(name: name));
    }

    if (playersList.isEmpty || playersList.length == 1) return;
    emit(state.copyWith(players: playersList));
    await _repository.addGeneralaPlayers(playersList);
  }

  void changeCellValue({
    required int playerIndex,
    required int rowIndex,
    required GeneralaCell newValue,
  }) async {
    var playersListCopy = List<GeneralaPlayer>.from(state.players).toList();
    final player = state.players[playerIndex];
    final selectedMapKey = player.scoresMap.keys.toList()[rowIndex];
    final updatedPlayer =
        player.copyWith(newScores: {selectedMapKey: newValue});

    playersListCopy.removeAt(playerIndex);
    playersListCopy.insert(playerIndex, updatedPlayer);
    emit(state.copyWith(players: playersListCopy));

    await _repository.updateGeneralaPlayers(state.players);
  }

  void reset() async {
    emit(state.copyWith(players: const []));
    await _repository.resetGeneralaMatch();
  }
}
