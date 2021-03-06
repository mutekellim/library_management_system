import 'package:floor/floor.dart';

import '../../models/models.dart';

@dao
abstract class BookModelDao {

  @Query('SELECT * FROM BookModel WHERE publishDate = :publishDate')
  Future<List<BookModel>> searchByPubDate(String publishDate);

  @Query('SELECT * FROM BookModel WHERE subject LIKE :subject')
  Future<List<BookModel>> searchBySubject(String subject);

  @Query('SELECT * FROM BookModel WHERE title LIKE :title')
  Future<List<BookModel>> searchByTitle(String title);

  @Query('SELECT * FROM BookModel WHERE title LIKE :queryData OR subject LIKE :queryData OR publishDate LIKE :queryData')
  Future<List<BookModel>> searchBook(String queryData);

  @Query('SELECT * FROM BookModel WHERE id= :bookId')
  Future<List<BookModel>> getBook(int bookId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveBook(BookModel game);
}