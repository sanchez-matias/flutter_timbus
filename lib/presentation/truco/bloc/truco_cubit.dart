import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'truco_state.dart';

class TrucoCubit extends Cubit<TrucoState> {
  TrucoCubit() : super(const TrucoState());

  void addPointToUs(int addedScore) {
    final usScore = state.scores[0];
    if (addedScore == 1 && usScore == state.scoreLimit) return;
    if (addedScore == -1 && usScore == 0) return;

    emit(state.copyWith(
      scores: [usScore+addedScore, state.scores[1]]
    ));
  }

  void addPointToThem(int addedScore) {
    final themScore = state.scores[1];
    if (addedScore == 1 && themScore == state.scoreLimit) return;
    if (addedScore == -1 && themScore == 0) return;

    emit(state.copyWith(
      scores: [state.scores[0], themScore+addedScore]
    ));
  }

  void resetGame() {
    emit(state.copyWith(
      scores: [0, 0]
    ));
  }

  void changeScoreLimit(int newLimit) {
    if (state.scores[0] > newLimit) {
      emit(state.copyWith(
        scores: [newLimit, state.scores[1]]
      ));
    }

    if (state.scores[1] > newLimit) {
      emit(state.copyWith(
        scores: [state.scores[0], newLimit]
      ));
    }

    emit(state.copyWith(
      scoreLimit: newLimit,
    ));
  }
}
