import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_timbus_annotations/domain/entities/generala_player.dart';
import 'package:flutter_timbus_annotations/domain/repositories/storage_repository.dart';

part 'generala_state.dart';

class GeneralaCubit extends Cubit<GeneralaState> {
  final StorageRepository _repository;

  GeneralaCubit(this._repository) : super(const GeneralaState()) {
    _getPlayersFromDb();
  }

  void _getPlayersFromDb() async {
    final players = await _repository.getGeneralaPlayers();
    emit(state.copyWith(players: players));
  }

  void emitMessage(String message) {
    emit(state.copyWith(
      message: message,
    ));
  }

  Future<void> addPlayers(List<String> names) async {
    if (names.length <= 1) {
      emitMessage('Deben cargarse al menos dos jugadores');
      return;
    }

    List<GeneralaPlayer> playersList = [];

    for (final name in names) {
      playersList.add(GeneralaPlayer(name: name.toUpperCase()));
    }

    await _repository.setGeneralaPlayers(playersList);
    _getPlayersFromDb();
  }

  Future<void> changeCellValue({
    required GeneralaPlayer player,
    required GeneralaCell newValue,
  }) async {
    final updatedPlayer = player.copyWith(newScores: {
      '${newValue.rowValue}': newValue,
    });

    await _repository.updateGeneralaPlayer(updatedPlayer);

    _getPlayersFromDb();
  }

  Future<void> deleteMatch() async {
    await _repository.clearGeneralaMatch();
    _getPlayersFromDb();
  }

  Future<void> resetMatch() async {
    final resetPlayers = <GeneralaPlayer>[];

    for (final player in state.players) {
      resetPlayers.add(player.copyWith(
        newScores: {
          '1': const GeneralaCell(rowValue: 1),
          '2': const GeneralaCell(rowValue: 2),
          '3': const GeneralaCell(rowValue: 3),
          '4': const GeneralaCell(rowValue: 4),
          '5': const GeneralaCell(rowValue: 5),
          '6': const GeneralaCell(rowValue: 6),
          '20': const GeneralaCell(rowValue: 20),
          '30': const GeneralaCell(rowValue: 30),
          '40': const GeneralaCell(rowValue: 40),
          '50': const GeneralaCell(rowValue: 50),
          '100': const GeneralaCell(rowValue: 100),
        },
      ));
    }

    await _repository.setGeneralaPlayers(resetPlayers);
    _getPlayersFromDb();
  }
}
