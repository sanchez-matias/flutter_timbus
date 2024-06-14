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

class DeletePlayer extends MoscaEvent {
  final String playerName;

  const DeletePlayer(this.playerName);
}

class UndoPlay extends MoscaEvent {}

class ResetGame extends MoscaEvent {}

class InitMosca extends MoscaEvent {}
