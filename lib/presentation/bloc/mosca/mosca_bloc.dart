import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_timbus_annotations/domain/entities/mosca_player.dart';

part 'mosca_event.dart';
part 'mosca_state.dart';

class MoscaBloc extends Bloc<MoscaEvent, MoscaState> {
  MoscaBloc() : super(const MoscaState()) {
    on<AddPlayer>(_addPlayerHandler);

    on<RegisterNewRound>(_onRegisterNewRoundHandler);

    on<DeletePlayer>(_onDeletePlayerHandler);

    on<UndoPlay>(_onUndoPlayHandler);

    on<ResetGame>(_onResetHandler);
  }

  bool registerNewScoreTrigger(Map<String, int> scores) {
    if (scores.keys.length != state.numberOfPlayers) return false;

    add(RegisterNewRound(scores));
    return true;
  }

  void _addPlayerHandler(AddPlayer event, Emitter<MoscaState> emit) {
    if (state.numberOfPlayers == 0) {
      emit(state.copyWith(players: [
        MoscaPlayer(
          name: event.playerName,
        ),
      ]));
    } else {
      final newPlayer = MoscaPlayer(
        name: event.playerName,
        currentScore: state.higherScore,
      );
      emit(state.copyWith(players: [...state.players, newPlayer]));
    }
  }

  void _onRegisterNewRoundHandler(
      RegisterNewRound event, Emitter<MoscaState> emit) {
    final newScores = <MoscaPlayer>[];

    for (final player in state.players) {
      newScores.add(player.copyWith(
        scoreHistory: [player.currentScore, ...player.scoreHistory],
        currentScore: player.currentScore + event.scores[player.name]!,
      ));
    }

    emit(state.copyWith(players: newScores));
  }

  void _onDeletePlayerHandler(DeletePlayer event, Emitter<MoscaState> emit) {
    final playerIndex = state.names.indexOf(event.playerName);

    if (playerIndex == -1) return;

    final newPlayersList = List<MoscaPlayer>.from(state.players)
      ..removeWhere((element) => element.name == event.playerName);
    emit(state.copyWith(players: newPlayersList));
  }

  void _onUndoPlayHandler(UndoPlay event, Emitter<MoscaState> emit) {
    final newPlayersList = <MoscaPlayer>[];

    for (final player in state.players) {

      if (player.scoreHistory.isEmpty) {
        newPlayersList.add(player.copyWith(
          // When a player is recently added in the middle of the match, this
          // will allow them to update their current score acording to the next
          // higer current score.
          currentScore: state.histories.map((aHistory) {
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

  void _onResetHandler(ResetGame event, Emitter<MoscaState> emit) {
    emit(state.copyWith(players: []));
  }
}
