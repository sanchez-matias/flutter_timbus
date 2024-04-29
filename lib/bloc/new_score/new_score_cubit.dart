import 'package:flutter_bloc/flutter_bloc.dart';

class NewScoreCubit extends Cubit<Map<String, int>> {
  NewScoreCubit() : super({});

  void registerNewScore(Map<String, int> newScore) {
    emit({...state, ...newScore});
  }

  void resetState() {
    emit({});
  }
}
