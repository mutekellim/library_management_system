import 'package:floor/floor.dart';

import '../../models/models.dart';

@dao
abstract class JournalModelDao {

  @Query('SELECT * FROM JournalModel WHERE publishDate = :publishDate')
  Future<List<JournalModel>> searchByPubDate(String publishDate);

  @Query('SELECT * FROM JournalModel WHERE subject LIKE :subject')
  Future<List<JournalModel>> searchBySubject(String subject);

  @Query('SELECT * FROM JournalModel WHERE title LIKE :title')
  Future<List<JournalModel>> searchByTitle(String title);

  @Query('SELECT * FROM JournalModel WHERE title LIKE :queryData OR subject LIKE :queryData OR publishDate LIKE :queryData')
  Future<List<JournalModel>> searchJournal(String queryData);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveJournal(JournalModel game);
}