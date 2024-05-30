part of 'chinchon_bloc.dart';

enum ScoreLimit {upTo50, upTo100}

class ChinchonState extends Equatable {
  final List<ChinchonPlayer> players;
  final ScoreLimit limit;


  const ChinchonState({
    this.players = const [],
    this.limit = ScoreLimit.upTo100,
  });

  List<String> get names => players.map((player) => player.name).toList();

  List<int> get currentScores =>
      players.map((player) => player.currentScore).toList();

  List<List<int>> get histories =>
      players.map((player) => player.scoreHistory).toList();

  int get higherScore => currentScores.reduce(max);

  List<ChinchonPlayer> get eliminatedPlayers {
    if (limit == ScoreLimit.upTo100) {
      return players.where((player) => player.isPlayerAbove100).toList();
    } else {
      return players.where((player) => player.isPlayerAbove50).toList();
    }
  }

  List<String> get eliminatedPlayersNames => eliminatedPlayers.map((player) => player.name).toList();

  ChinchonState copyWith({
    List<ChinchonPlayer>? players,
    ScoreLimit? limit,
  }) =>
      ChinchonState(
        players: players ?? this.players,
        limit: limit ?? this.limit,
      );

  @override
  List<Object> get props => [names, currentScores, limit];
}
