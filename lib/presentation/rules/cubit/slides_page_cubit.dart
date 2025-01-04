import 'package:flutter_bloc/flutter_bloc.dart';

class SlidesPageCubit extends Cubit<double> {
  SlidesPageCubit() : super(0);

  void reset() => emit(0);

  void changeValue(double? newValue) {
    if (newValue == null) return;
    emit(newValue);
  }
}
