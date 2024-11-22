import 'package:flutter_timbus_annotations/domain/entities/chinchon_player.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class ChinchonStorageDatasource {
  Future<List<ChinchonPlayer>> getPlayers();

  Future<void> updatePlayersScore(List<ChinchonPlayer> players);

  Future<void> resetMatch();

  Future<void> deletePlayer(int id);

  Future<void> addPlayer(ChinchonPlayer newPlayer);
}

class ChinchonStorageDatasourceImpl extends ChinchonStorageDatasource {
  late Future<Isar> _db;

  ChinchonStorageDatasourceImpl() {
    _db = openDb();
  }

  Future<Isar> openDb() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [ChinchonPlayerSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<void> deletePlayer(int id) async {
    final isar = await _db;
    await isar.writeTxn(() => isar.chinchonPlayers.delete(id));
  }

  @override
  Future<List<ChinchonPlayer>> getPlayers() async {
    final isar = await _db;
    return isar.chinchonPlayers.where().findAll();
  }

  @override
  Future<void> resetMatch() async {
    final isar = await _db;
    await isar.writeTxn(() => isar.chinchonPlayers.clear());
  }

  @override
  Future<void> updatePlayersScore(List<ChinchonPlayer> players) async {
    final isar = await _db;

    await isar.writeTxn(() => isar.chinchonPlayers.putAll(players));
  }

  @override
  Future<void> addPlayer(ChinchonPlayer newPlayer) async {
    final isar = await _db;
    await isar.writeTxn(() => isar.chinchonPlayers.put(newPlayer));
  }
}
