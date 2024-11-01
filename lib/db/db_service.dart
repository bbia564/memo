import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../entity/speech_bean.dart';

class DatabaseService extends GetxService {
  late Database db;
  final faker = Faker();

  Future<DatabaseService> init() async {
    await initDB();
    return this;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'speech_db.db');

    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await createTable(db);
    });
  }

  createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS speech (id INTEGER PRIMARY KEY,name TEXT,color TEXT,time INTEGER,persons TEXT,created_at TEXT)');
    await createDefaultData(db);
  }

  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

  createDefaultData(Database db) async {
    List<String> names = [
      "Design of Future Cities and Sustainable Development",
      "Artificial Intelligence and Ethics",
      "Mental Health in the Digital Age",
      "The Future of Space Exploration",
      "Convergence of Art and Technology",
    ];
    List<String> colors = ['F16554', '43C472', 'F59733', 'FCCC44', '4FAAF1', '007AFC', '69A92B'];
    for (var i = 0; i < names.length; i++) {
      var name = names[i];
      var color = faker.randomGenerator.element<String>(colors);
      var person1 = faker.person.name();
      var person2 = faker.person.name();
      var person3 = faker.person.name();
      var time = faker.randomGenerator.integer(60, min: 20);
      var cuDate = DateTime.now();
      DateTime randomDate =
          faker.date.dateTimeBetween(cuDate.subtract(const Duration(hours: 2)), cuDate);
      await db.insert('speech', {
        'name': name,
        'color': color,
        'time': time,
        'persons': "$person1,$person2,$person3",
        'created_at': formatter.format(randomDate),
      });
    }
  }

  add(
    String name,
    String color,
    int time,
    String person,
  ) async {
    await db.insert('speech', {
      'name': name,
      'color': color,
      'time': time,
      'persons': person,
      'created_at': formatter.format(DateTime.now()),
    });
  }

  Future<int> update(Map<String, Object?> valuesToUpdate, int id) async {
    int count = await db.update("speech", valuesToUpdate, where: 'id = ?', whereArgs: [id]);
    return count;
  }

  Future<int> delete(int id) async {
    int count = await db.delete("speech", where: 'id = ?', whereArgs: [id]);
    return count;
  }

  clean() async {
    await db.delete('speech');
  }

  closer() async {
    await db.close();
  }

  Future<List<SpeechBean>> getAllSpeeches() async {
    var result = await db.query('speech', orderBy: 'id DESC');
    return result.map((e) => SpeechBean.fromJson(e)).toList();
  }
}
