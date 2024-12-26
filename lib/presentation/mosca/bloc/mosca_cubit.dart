import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_timbus_annotations/domain/entities/mosca_player.dart';
import 'package:flutter_timbus_annotations/domain/repositories/storage_repository.dart';

part 'mosca_state.dart';

class MoscaCubit extends Cubit<MoscaState> {
  final StorageRepository _repository;

  MoscaCubit(this._repository) : super(const MoscaState()) {
    _getPlayersFromDb();
  }

  Future<void> _getPlayersFromDb() async {
    final players = await _repository.getMoscaPlayers();

    emit(state.copyWith(
      players: players,
      message: '',
    ));
  }

  void emitMessage(String message) {
    emit(state.copyWith(
      message: message,
    ));
  }

  Future<void> resetGame() async {
    await _repository.resetMoscaMatch();
    _getPlayersFromDb();
  }

  Future<void> deletePlayer(int id) async {
    await _repository.deleteMoscaPlayer(id);
    _getPlayersFromDb();
  }

  Future<void> restartGame() async {
    final players = <MoscaPlayer>[];

    for (final player in state.players) {
      players.add(
        player.copyWith(
          currentScore: 15,
          scoreHistory: [],
        )
      );
    }

    await _repository.updateMoscaPlayers(players);
    _getPlayersFromDb();
  }

  Future<void> addPlayer(String name) async {
    // The player name must not exist into the current match.
    if (state.names.any((player) => player == name)) {
      emitMessage('El nombre no puede repetirse');
      return;
    }

    // The players who join a started game, must join with the highest score
    // of non-eliminated players.
    if (state.players.isEmpty) {
      await _repository.updateMoscaPlayers([MoscaPlayer(name: name.toUpperCase())]);
    } else {
      await _repository.updateMoscaPlayers([MoscaPlayer(
        name: name.toUpperCase(),
        currentScore: state.higestPlayingScore,
      )]);
    }

    _getPlayersFromDb();
  }

  Future<void> registerNewRound(Map<String, int> roundScores) async {
    if (!roundScores.values.any((element) => element != 0)) {
      emitMessage('Los puntajes no pueden ser todos cero');
      return;
    }

    // if (roundScores.length != state.players.length) {
    //   emitMessage('Deben cargarse los ${state.players.length} puntajes juntos');
    //   return;
    // }

    final newScores = <MoscaPlayer>[];

    for (final player in state.players) {
      final roundScore = roundScores[player.name];

      // If there are eliminated players, they will be skipped here.
      if (roundScore != null) {
        newScores.add(player.copyWith(
          scoreHistory: [player.currentScore, ...player.scoreHistory],
          currentScore: player.currentScore + roundScore,
        ));
      }
    }

    await _repository.updateMoscaPlayers(newScores);
    _getPlayersFromDb();
  }

  Future<void> undoRound() async {}

}
