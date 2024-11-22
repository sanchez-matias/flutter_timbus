import 'package:flutter_timbus_annotations/domain/entities/chinchon_player.dart';

abstract class ChinchonStorageRepository {
  Future<List<ChinchonPlayer>> getPlayers();

  Future<void> updatePlayersScore(List<ChinchonPlayer> players);

  Future<void> resetMatch();

  Future<void> deletePlayer(int id);

  Future<void> addPlayer(ChinchonPlayer newPlayer);
}
