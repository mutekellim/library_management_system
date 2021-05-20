import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

/// [BookRepositoryImpl] class is an implementation of [BookRepository] and
/// implements [InventoryRepository] interface as well.
///
/// Gets data from an [SQLite] database.
///
/// Returns [DatabaseFailure] when an error occured.
class BookRepositoryImpl implements BookRepository, InventoryRepository {
  @override
  Future<Either<Failure, List<Book>>> searchByPubDate(String date) {
    // TODO: implement searchByPubDate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> searchBySubject(String subject) {
    // TODO: implement searchBySubject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> searchByTitle(String title) {
    // TODO: implement searchByTitle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Book>>> searchByType(InventoryTypes type) {
    // TODO: implement searchByType
    throw UnimplementedError();
  }
}
