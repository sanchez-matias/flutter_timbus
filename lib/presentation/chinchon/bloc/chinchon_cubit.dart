import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_timbus_annotations/domain/entities/chinchon_player.dart';
import 'package:flutter_timbus_annotations/domain/repositories/storage_repository.dart';

part 'chinchon_state.dart';

class ChinchonCubit extends Cubit<ChinchonState> {
  final StorageRepository _repository;

  ChinchonCubit(this._repository) : super(const ChinchonState()) {
    _getPlayersFromDb();
  }

  Future<void> _getPlayersFromDb() async {
    final players = await _repository.getChinchonPlayers();

    emit(state.copyWith(
      players: players,
      message: '',
    ));
  }

  void changeScoreLimit(int newLimit) {
    emit(state.copyWith(
      limit: newLimit,
    ));
  }

  void emitMessage(String message) {
    emit(state.copyWith(
      message: message,
    ));
  }

  Future<void> deleteMatch() async {
    await _repository.resetChinchonMatch();
    _getPlayersFromDb();
  }

  Future<void> deletePlayer(int id) async {
    await _repository.deleteChinchonPlayer(id);
    _getPlayersFromDb();
  }

  Future<void> addNewPlayer(String name) async {
    // The player name must not exist into the current match.
    if (state.names.any((player) => player == name)) {
      emitMessage('El nombre no puede repetirse');
      return;
    }

    // The players who join a started game, must join with the highest score
    // of non-eliminated players.
    if (state.players.isEmpty) {
      await _repository.updateChinchonPlayers([ChinchonPlayer(name: name.toUpperCase())]);
    } else {
      await _repository.updateChinchonPlayers([ChinchonPlayer(
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

    final newScores = <ChinchonPlayer>[];

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

    await _repository.updateChinchonPlayers(newScores);
    _getPlayersFromDb();
  }

  Future<void> undoPlay() async {
    if (state.areAllZero || state.players.isEmpty) return;

    final newPlayersList = <ChinchonPlayer>[];

    for (final player in state.players) {
      // If any of the players in the match has no entries in their history
      // then it means that they have been recently added to the match, so
      // we need to change their initial score according to the highest one
      // in the previous round.
      if (player.scoreHistory.isEmpty) {
        newPlayersList.add(player.copyWith(
          currentScore: state.players
              .map((player) {
                if (player.scoreHistory.isEmpty) return -1;

                return player.scoreHistory[0];
              })
              .reduce(max),
        ));
      } else {
        newPlayersList.add(player.copyWith(
          currentScore: player.scoreHistory.first,
          scoreHistory: List<int>.from(player.scoreHistory)..removeAt(0),
        ));
      }

      await _repository.updateChinchonPlayers(newPlayersList);
      _getPlayersFromDb();
    }
  }

  Future<void> setAllZero() async {
    final players = <ChinchonPlayer>[];

    for (final player in state.players) {
      players.add(
        player.copyWith(
          currentScore: 0,
          scoreHistory: [],
        )
      );
    }

    await _repository.updateChinchonPlayers(players);
    _getPlayersFromDb();
  }
}
