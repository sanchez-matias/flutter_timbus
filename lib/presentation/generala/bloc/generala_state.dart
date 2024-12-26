part of 'generala_cubit.dart';

class GeneralaState extends Equatable {
  final List<GeneralaPlayer> players;
  final String message;

  const GeneralaState({
    this.players = const [],
    this.message = '',
  });

  bool get isTableDirty => !players.any((player) {
    final cells = player.scoresMap.values.toList();
    final result = cells.any((cell) => cell.isCrossedOut || cell.selectedOption != 0);

    return result;
  });

  GeneralaState copyWith({
    List<GeneralaPlayer>? players,
    String? message,
  }) =>
      GeneralaState(
        players: players ?? this.players,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [players, message];
}
