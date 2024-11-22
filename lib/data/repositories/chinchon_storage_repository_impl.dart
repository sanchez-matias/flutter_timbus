import 'package:flutter_timbus_annotations/data/datasources/chinchon_storage_datasource.dart';
import 'package:flutter_timbus_annotations/domain/entities/chinchon_player.dart';
import 'package:flutter_timbus_annotations/domain/repositories/chinchon_storage_repository.dart';

class ChinchonStorageRepositoryImpl extends ChinchonStorageRepository {
  final ChinchonStorageDatasource _datasource;

  ChinchonStorageRepositoryImpl(this._datasource);

  @override
  Future<void> addPlayer(ChinchonPlayer newPlayer) {
    return _datasource.addPlayer(newPlayer);
  }

  @override
  Future<void> deletePlayer(int id) {
    return _datasource.deletePlayer(id);
  }

  @override
  Future<List<ChinchonPlayer>> getPlayers() {
    return _datasource.getPlayers();
  }

  @override
  Future<void> resetMatch() {
    return _datasource.resetMatch();
  }

  @override
  Future<void> updatePlayersScore(List<ChinchonPlayer> players) {
    return _datasource.updatePlayersScore(players);
  }
}
