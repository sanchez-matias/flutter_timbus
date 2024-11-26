import 'package:flutter_timbus_annotations/domain/entities/chinchon_player.dart';
import 'package:flutter_timbus_annotations/domain/entities/generala_player.dart';
import 'package:flutter_timbus_annotations/domain/entities/mosca_player.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract class StorageDatasource {
  Future<List<MoscaPlayer>> getMoscaPlayers();

  Future<void> updateMoscaPlayers(List<MoscaPlayer> players);

  Future<void> resetMoscaMatch();

  Future<void> deleteMoscaPlayer(int id);

  Future<List<ChinchonPlayer>> getChinchonPlayers();

  Future<void> updateChinchonPlayers(List<ChinchonPlayer> players);

  Future<void> resetChinchonMatch();

  Future<void> deleteChinchonPlayer(int id);

  //! Eliminar players
  Future<void> addGeneralaPlayers(List<GeneralaPlayer> players);

  Future<void> updateGeneralaPlayers(List<GeneralaPlayer> players);

  Future<void> resetGeneralaMatch();

  Future<List<GeneralaPlayer>> getGeneralaPlayers();
}

class StorageDatasourceImpl implements StorageDatasource {
  late Future<Isar> db;

  StorageDatasourceImpl() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MoscaPlayerSchema, ChinchonPlayerSchema, GeneralaPlayerSchema],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  //* MOSCA
  @override
  Future<void> updateMoscaPlayers(List<MoscaPlayer> players) async {
    final isar = await db;
    await isar.writeTxn(() => isar.moscaPlayers.putAll(players));
  }

  @override
  Future<List<MoscaPlayer>> getMoscaPlayers() async {
    final isar = await db;
    return isar.moscaPlayers.where().findAll();
  }

  @override
  Future<void> resetMoscaMatch() async {
    final isar = await db;
     await isar.writeTxn(() => isar.moscaPlayers.clear());
  }

  @override
  Future<void> deleteMoscaPlayer(int id) async {
    final isar = await db;
    await isar.writeTxn(() => isar.moscaPlayers.delete(id));
  }

  //* CHINCHON
  @override
  Future<void> deleteChinchonPlayer(int id) async {
    final isar = await db;
    isar.writeTxn(() => isar.chinchonPlayers.delete(id));
  }

  @override
  Future<List<ChinchonPlayer>> getChinchonPlayers() async {
    final isar = await db;
    return isar.chinchonPlayers.where().findAll();
  }

  @override
  Future<void> resetChinchonMatch() async {
    final isar = await db;
    isar.writeTxn(() => isar.chinchonPlayers.clear());
  }

  @override
  Future<void> updateChinchonPlayers(List<ChinchonPlayer> players) async {
    await resetChinchonMatch();
    final isar = await db;

    isar.writeTxn(() => isar.chinchonPlayers.putAll(players));
  }

  //* GENERALA
  @override
  Future<void> addGeneralaPlayers(List<GeneralaPlayer> players) async {
    final isar = await db;
    isar.writeTxn(() => isar.generalaPlayers.putAll(players));
  }

  @override
  Future<void> updateGeneralaPlayers(List<GeneralaPlayer> players) async {
    await resetGeneralaMatch();
    final isar = await db;
    isar.writeTxn(() => isar.generalaPlayers.putAll(players));
  }

  @override
  Future<void> resetGeneralaMatch() async {
    final isar = await db;
    isar.writeTxn(() => isar.generalaPlayers.clear());
  }

  @override
  Future<List<GeneralaPlayer>> getGeneralaPlayers() async {
    final isar = await db;
    return isar.generalaPlayers.where().findAll();
  }
}
