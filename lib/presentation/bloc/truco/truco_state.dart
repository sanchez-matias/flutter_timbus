part of 'truco_cubit.dart';

class TrucoState extends Equatable {
  final List<int> scores;
  final int scoreLimit;

  const TrucoState({
    this.scores = const [0, 0],
    this.scoreLimit = 30,
  });

  bool get isMatchClear => scores[0] == 0 && scores[1] == 0;

  TrucoState copyWith({
    List<int>? scores,
    int? scoreLimit,
  }) => TrucoState(
    scores: scores ?? this.scores,
    scoreLimit: scoreLimit ?? this.scoreLimit,
  );

  @override
  List<Object> get props => [scores, scoreLimit];
}
