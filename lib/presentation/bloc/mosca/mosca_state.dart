part of 'mosca_cubit.dart';

class MoscaState extends Equatable {
  final List<MoscaPlayer> players;
  final String message;

  const MoscaState({
    this.players = const [],
    this.message = '',
  });

  List<String> get names => players.map((e) => e.name).toList();

  int get higestPlayingScore {
    final playingScores = players.where((player) => player.currentScore >= 0);
    
    try {
      return playingScores.map((e) => e.currentScore).reduce(max);
    } catch (e) {
      return 15;
    }
  }

  MoscaState copyWith({
    List<MoscaPlayer>? players,
    String? message,
  }) =>
      MoscaState(
        players: players ?? this.players,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [players, message];
}
