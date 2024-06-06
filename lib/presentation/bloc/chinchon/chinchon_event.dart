part of 'chinchon_bloc.dart';

sealed class ChinchonEvent extends Equatable {
  const ChinchonEvent();

  @override
  List<Object> get props => [];
}

class ToggleScoreLimit extends ChinchonEvent {}

class RegisterRound extends ChinchonEvent {
  final Map<String, int> scores;

  const RegisterRound(this.scores);
}

class NewPlayer extends ChinchonEvent {
  final String name;
  const NewPlayer(this.name);
}

class RemovePlayer extends ChinchonEvent {
  final String playerName;

  const RemovePlayer(this.playerName);
}

class CancelPlay extends ChinchonEvent {}

class Reset extends ChinchonEvent {}