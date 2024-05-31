class MoscaPlayer {
  final String name;
  final int currentScore;
  final List<int> scoreHistory;

  MoscaPlayer({
    this.name = 'player',
    this.currentScore = 15,
    this.scoreHistory = const [],
  });

  MoscaPlayer copyWith({
    String? name,
    int? currentScore,
    List<int>? scoreHistory,
  }) =>
      MoscaPlayer(
        name: name ?? this.name,
        currentScore: currentScore ?? this.currentScore,
        scoreHistory: scoreHistory ?? this.scoreHistory,
      );
  
  @override
  String toString() => '${name.toUpperCase()}: $currentScore pts - $scoreHistory';
}
