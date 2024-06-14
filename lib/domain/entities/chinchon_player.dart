import 'package:isar/isar.dart';

part 'chinchon_player.g.dart';

@collection
class ChinchonPlayer {
  Id id = Isar.autoIncrement;

  final String name;
  final int currentScore;
  final List<int> scoreHistory;

  ChinchonPlayer({
    this.name = 'player',
    this.currentScore = 0,
    this.scoreHistory = const [],
  });

  bool get isPlayerAbove100 => currentScore >= 100;

  bool get isPlayerAbove50 => currentScore >= 50;

  ChinchonPlayer copyWith({
    String? name,
    int? currentScore,
    List<int>? scoreHistory,
  }) =>
      ChinchonPlayer(
        name: name ?? this.name,
        currentScore: currentScore ?? this.currentScore,
        scoreHistory: scoreHistory ?? this.scoreHistory,
      );
}
