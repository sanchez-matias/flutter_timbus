import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_timbus_annotations/entities/mosca_player.dart';

part 'mosca_event.dart';
part 'mosca_state.dart';

class MoscaBloc extends Bloc<MoscaEvent, MoscaState> {
  MoscaBloc() : super(const MoscaState()) {
    on<AddPlayer>(_addPlayerHandler);

    on<RegisterNewRound>(_onRegisterNewRoundHandler);
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
}
