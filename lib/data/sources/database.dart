import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/dao.dart';
import '../models/models.dart';

part 'database.g.dart';

@Database(version: 1, entities: [BookModel, JournalModel,DvdModel, MemberModel, RuleModel, BorrowModel, ReservationModel])
abstract class AppDatabase extends FloorDatabase {
  BookModelDao get bookModelDao;

  JournalModelDao get journalModelDao;

  DvdModelDao get dvdModelDao;

  MemberModelDao get memberModelDao;

  RuleModelDao get ruleModelDao;

  BorrowModelDao get borrowModelDao;

  ReservationModelDao get reservationModelDao;

}
