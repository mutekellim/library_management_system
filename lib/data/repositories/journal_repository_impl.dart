// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../sources/dao/dao.dart';

/// [JournalRepositoryImpl] class is an implementation of [JournalRepository] and
/// implements [InventoryRepository] interface as well.
///
/// Gets data from an [SQLite] database.
///
/// Returns [DatabaseFailure] when an error occurred.
class JournalRepositoryImpl implements JournalRepository {
  final JournalModelDao localDataSource;

  JournalRepositoryImpl({
    required this.localDataSource,
  });

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
  Future<Either<Failure, Journal>> addJournal(Journal journal) async {
    try {
      await localDataSource.saveJournal(journal.toModel());
      return Right(journal);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Journal>> updateJournal(Journal journal) async {
    try {
      await localDataSource.saveJournal(journal.toModel());
      return Right(journal);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Journal>>> searchJournal(String queryData) async {
    try {
      final journalList = await localDataSource.searchJournal(queryData);
      return Right(
          journalList.map((journalModel) => Journal.fromModel(journalModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }
}
