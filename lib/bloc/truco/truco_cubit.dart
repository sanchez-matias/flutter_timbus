import 'package:flutter_bloc/flutter_bloc.dart';

class TrucoCubit extends Cubit<List<int>> {
  TrucoCubit() : super([0, 0]);

  void addPointToUs(int score) {
    final us = state[0];
    if (score > 0 && us == 30) return;
    if (score < 0 && us == 0) return;

    emit([us + score, state[1]]);
  }

  void addPointToThem(int score) {
    final them = state[1];
    if (score > 0 && them == 30) return;
    if (score < 0 && them == 0) return;

    emit([state[0], them + score]);
  }

  void resetGame() {
    emit([0, 0]);
  }
}
