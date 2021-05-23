// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';

/// [JournalRepositoryImpl] class is an implementation of [JournalRepository] and
/// implements [InventoryRepository] interface as well.
///
/// Gets data from an [SQLite] database.
///
/// Returns [DatabaseFailure] when an error occurred.
class JournalRepositoryImpl implements JournalRepository {
  @override
  Future<Either<Failure, List<Journal>>> searchByPubDate(String publishDate) {
    // TODO: implement searchByPubDate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Journal>>> searchBySubject(String subject) {
    // TODO: implement searchBySubject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Journal>>> searchByTitle(String title) {
    // TODO: implement searchByTitle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Journal>>> searchByType(String type) {
    // TODO: implement searchByType
    throw UnimplementedError();
  }
}
