// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../sources/dao/dao.dart';

/// [BookRepositoryImpl] class is an implementation of [BookRepository] and
/// implements [InventoryRepository] interface as well.
///
/// Gets data from an [SQLite] database.
///
/// Returns [DatabaseFailure] when an error occurred.
class BookRepositoryImpl implements BookRepository {
  final BookModelDao localDataSource;

  BookRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Book>>> searchByPubDate( String publishDate) async {
    try {
      final bookList = await localDataSource.searchByPubDate(publishDate);
      return Right(
          bookList.map((bookModel) => Book.fromModel(bookModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> searchBySubject(String subject) async {
    try {
      final bookList = await localDataSource.searchBySubject(subject);
      return Right(
          bookList.map((bookModel) => Book.fromModel(bookModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> searchByTitle(String title) async {
    try {
      final bookList = await localDataSource.searchByTitle(title);
      return Right(
          bookList.map((bookModel) => Book.fromModel(bookModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Book>> addBook(Book book) async {
    try {
      await localDataSource.saveBook(book.toModel());
      return Right(book);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Book>> updateBook(Book book) async {
    try {
      await localDataSource.saveBook(book.toModel());
      return Right(book);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> searchBook(String queryData) async {
    try {
      final bookList = await localDataSource.searchBook(queryData);
      return Right(
          bookList.map((bookModel) => Book.fromModel(bookModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getBook(int bookId) async {
    try {
      final bookList = await localDataSource.getBook(bookId);
      return Right(
          bookList.map((bookModel) => Book.fromModel(bookModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }
}
