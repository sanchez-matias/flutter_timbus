import 'package:flutter_timbus_annotations/data/datasources/storage_datasource.dart';
import 'package:flutter_timbus_annotations/domain/entities/chinchon_player.dart';
import 'package:flutter_timbus_annotations/domain/entities/generala_player.dart';
import 'package:flutter_timbus_annotations/domain/entities/mosca_player.dart';
import 'package:flutter_timbus_annotations/domain/repositories/storage_repository.dart';

class StorageRepositoryImpl extends StorageRepository {
  final StorageDatasource _datasource;

  StorageRepositoryImpl(this._datasource);
  
  @override
  Future<void> deleteMoscaPlayer(int id) {
    return _datasource.deleteMoscaPlayer(id);
  }
  
  @override
  Future<List<MoscaPlayer>> getMoscaPlayers() {
    return _datasource.getMoscaPlayers();
  }
  
  @override
  Future<void> resetMoscaMatch() {
    return _datasource.resetMoscaMatch();
  }
  
  @override
  Future<void> updateMoscaPlayers(List<MoscaPlayer> players) {
    return _datasource.updateMoscaPlayers(players);
  }

  @override
  Future<void> deleteChinchonPlayer(int id) {
    return _datasource.deleteChinchonPlayer(id);
  }

  @override
  Future<List<ChinchonPlayer>> getChinchonPlayers() {
    return _datasource.getChinchonPlayers();
  }

  @override
  Future<void> resetChinchonMatch() {
    return _datasource.resetChinchonMatch();
  }

  @override
  Future<void> updateChinchonPlayers(List<ChinchonPlayer> players){
    return _datasource.updateChinchonPlayers(players);
  }

  @override
  Future<void> setGeneralaPlayers(List<GeneralaPlayer> players) {
    return _datasource.setGeneralaPlayers( players);
  }

  @override
  Future<void> updateGeneralaPlayer(GeneralaPlayer player) {
    return _datasource.updateGeneralaPlayer(player);
  }

  @override
  Future<void> clearGeneralaMatch() {
    return _datasource.clearGeneralaMatch();
  }
  
  @override
  Future<List<GeneralaPlayer>> getGeneralaPlayers() {
    return _datasource.getGeneralaPlayers();
  }

}
