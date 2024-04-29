part of 'mosca_bloc.dart';

sealed class MoscaEvent extends Equatable {
  const MoscaEvent();

  @override
  List<Object> get props => [];
}

class AddPlayer extends MoscaEvent {
  final String playerName;

  const AddPlayer(this.playerName);
}

class RegisterNewRound extends MoscaEvent {
  final Map<String, int> scores;

  const RegisterNewRound(this.scores);
}

// TODO: Change player name