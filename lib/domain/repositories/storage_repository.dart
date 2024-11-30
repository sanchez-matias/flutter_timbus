import 'package:flutter_timbus_annotations/domain/entities/chinchon_player.dart';
import 'package:flutter_timbus_annotations/domain/entities/generala_player.dart';
import 'package:flutter_timbus_annotations/domain/entities/mosca_player.dart';

abstract class StorageRepository {
  Future<List<MoscaPlayer>> getMoscaPlayers();

  Future<void> updateMoscaPlayers(List<MoscaPlayer> players);

  Future<void> resetMoscaMatch();

  Future<void> deleteMoscaPlayer(int id);

  Future<List<ChinchonPlayer>> getChinchonPlayers();

  Future<void> updateChinchonPlayers(List<ChinchonPlayer> players);

  Future<void> resetChinchonMatch();

  Future<void> deleteChinchonPlayer(int id);

  Future<List<GeneralaPlayer>> getGeneralaPlayers();

  Future<void> setGeneralaPlayers(List<GeneralaPlayer> players);

  Future<void> updateGeneralaPlayer(GeneralaPlayer player);

  Future<void> clearGeneralaMatch();
}
