import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_timbus_annotations/entities/chinchon_player.dart';

part 'chinchon_event.dart';
part 'chinchon_state.dart';

class ChinchonBloc extends Bloc<ChinchonEvent, ChinchonState> {
  ChinchonBloc() : super(const ChinchonState()) {
    on<ToggleScoreLimit>(_onToggleLimitHandler);
    on<RegisterRound>(_onRegisterRoundHandler);
    on<NewPlayer>(_onAddPlayerHandler);
    on<RemovePlayer>(_onDeletePlayerHandler);
    on<CancelPlay>(_onUndoPlayHandler);
  }

  bool registerNewScoreTrigger(Map<String, int> scores) {
    if (scores.length != state.players.length) return false;

    add(RegisterRound(scores));
    return true;
  }

  void _onToggleLimitHandler(
    ToggleScoreLimit event,
    Emitter<ChinchonState> emit,
  ) {
    if (state.limit == ScoreLimit.upTo100) {
      emit(state.copyWith(limit: ScoreLimit.upTo50));
    } else {
      emit(state.copyWith(limit: ScoreLimit.upTo100));
    }
  }

  void _onRegisterRoundHandler(
    RegisterRound event,
    Emitter<ChinchonState> emit,
  ) {
    final newScores = <ChinchonPlayer>[];

    for (final player in state.players) {
      newScores.add(player.copyWith(
        scoreHistory: [player.currentScore, ...player.scoreHistory],
        currentScore: player.currentScore + event.scores[player.name]!,
      ));
    }

    emit(state.copyWith(players: newScores));
  }

  void _onAddPlayerHandler(
    NewPlayer event,
    Emitter<ChinchonState> emit,
  ) {
    if (state.players.isEmpty) {
      emit(state.copyWith(players: [
        ChinchonPlayer(
          name: event.name,
        ),
      ]));
    } else {
      final newPlayer = ChinchonPlayer(
        name: event.name,
        currentScore: state.higherScore,
      );
      emit(state.copyWith(players: [...state.players, newPlayer]));
    }
  }

  void _onDeletePlayerHandler(
    RemovePlayer event,
    Emitter<ChinchonState> emit,
  ) {
    final playerIndex = state.names.indexOf(event.playerName);

    if (playerIndex == -1) return;

    final newPlayersList = List<ChinchonPlayer>.from(state.players)
      ..removeWhere((element) => element.name == event.playerName);
    emit(state.copyWith(players: newPlayersList));
  }

  void _onUndoPlayHandler(
    CancelPlay event,
    Emitter<ChinchonState> emit,
  ) {
    final newPlayersList = <ChinchonPlayer>[];

    for (final player in state.players) {
      if (player.scoreHistory.isEmpty) {
        newPlayersList.add(player.copyWith(
          currentScore: state.histories
              .map((aHistory) {
                if (aHistory.isEmpty) return -1;

                return aHistory[0];
              })
              .toList()
              .reduce(max),
        ));
      } else {
        newPlayersList.add(player.copyWith(
          currentScore: player.scoreHistory.first,
          scoreHistory: List<int>.from(player.scoreHistory)..removeAt(0),
        ));
      }
    }

    emit(state.copyWith(players: newPlayersList));
  }
}
