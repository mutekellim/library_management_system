import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/dao.dart';
import '../models/models.dart';

part 'database.g.dart';

@Database(version: 1, entities: [BookModel, JournalModel, MemberModel])
abstract class AppDatabase extends FloorDatabase {
  BookModelDao get bookModelDao;

  JournalModelDao get journalModelDao;

  MemberModelDao get memberModelDao;
}
