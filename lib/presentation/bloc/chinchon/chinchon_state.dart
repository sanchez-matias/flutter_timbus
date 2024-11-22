part of 'chinchon_cubit.dart';

class ChinchonState extends Equatable {
  final List<ChinchonPlayer> players;
  final int limit;
  final String message;

  const ChinchonState({
    this.players = const [],
    this.limit = 50,
    this.message = '',
  });

  bool get areAllZero => !players.any((player) => player.currentScore != 0);

  List<String> get names => players.map((player) => player.name).toList();

  List<int> get ids => players.map((player) => player.id).toList();

  int get higestPlayingScore {
    final playingScores = players.where((player) => player.currentScore < limit);
    
    try {
      return playingScores.map((e) => e.currentScore).reduce(max);
    } catch (e) {
      return 0;
    }
  }

  int get lowerScore => players.map((e) => e.currentScore).reduce(min);

  ChinchonState copyWith({
    List<ChinchonPlayer>? players,
    int? limit,
    String? message,
  }) =>
      ChinchonState(
        players: players ?? this.players,
        limit: limit ?? this.limit,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [players, limit, message];
}

