part of 'mosca_bloc.dart';

class MoscaState extends Equatable {
  final List<MoscaPlayer> players;

  const MoscaState({
    this.players = const [],
  });

  List<String> get names => players.map((player) => player.name).toList();

  List<int> get currentScores =>
      players.map((player) => player.currentScore).toList();

  List<List<int>> get histories =>
      players.map((player) => player.scoreHistory).toList();

  int get numberOfPlayers => players.length;

  int get higherScore => currentScores.reduce(max);

  MoscaState copyWith({
    List<MoscaPlayer>? players,
    Map<String, int>? tempRoundScores,
  }) =>
      MoscaState(
        players: players ?? this.players,
      );

  @override
  List<Object?> get props => [names, currentScores];
}
