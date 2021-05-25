import 'package:floor/floor.dart';

import '../../models/models.dart';

@dao
abstract class DvdModelDao {

  @Query('SELECT * FROM DvdModel WHERE publishDate = :publishDate')
  Future<List<DvdModel>> searchByPubDate(String publishDate);

  @Query('SELECT * FROM DvdModel WHERE subject LIKE :subject')
  Future<List<DvdModel>> searchBySubject(String subject);

  @Query('SELECT * FROM DvdModel WHERE title LIKE :title')
  Future<List<DvdModel>> searchByTitle(String title);

  @Query('SELECT * FROM DvdModel WHERE type = :type')
  Future<List<DvdModel>> searchByType(String type);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveDvd(DvdModel game);
}