part of 'generala_cubit.dart';

class GeneralaState extends Equatable {
  final List<GeneralaPlayer> players;

  const GeneralaState({
    this.players = const [],
  });

  List<String> get names => players.map((player) => player.name).toList();

  List<String> get globalScores => players.map((player) => player.globalScore.toString()).toList();

  GeneralaState copyWith({
    List<GeneralaPlayer>? players,
  }) =>
      GeneralaState(
        players: players ?? this.players,
      );

  @override
  List<Object> get props => [players];
}
