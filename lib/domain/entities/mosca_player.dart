import 'package:isar/isar.dart';

part 'mosca_player.g.dart';

@collection
class MoscaPlayer {
  Id id = Isar.autoIncrement;
  final String name;
  final int currentScore;
  final List<int> scoreHistory;

  MoscaPlayer({
    this.id = Isar.autoIncrement,
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
        id: id,
        name: name ?? this.name,
        currentScore: currentScore ?? this.currentScore,
        scoreHistory: scoreHistory ?? this.scoreHistory,
      );
  
  @override
  String toString() => '${name.toUpperCase()}: $currentScore pts - $scoreHistory';
}
