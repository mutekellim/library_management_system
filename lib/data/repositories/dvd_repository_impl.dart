// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../sources/dao/dao.dart';

/// [DvdRepositoryImpl] class is an implementation of [DvdRepository] and
/// implements [InventoryRepository] interface as well.
///
/// Gets data from an [SQLite] database.
///
/// Returns [DatabaseFailure] when an error occurred.
class DvdRepositoryImpl implements DvdRepository {
  final DvdModelDao localDataSource;

  DvdRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Dvd>>> searchByPubDate(
      String publishDate) async {
    try {
      final dvdList = await localDataSource.searchByPubDate(publishDate);
      return Right(
          dvdList.map((dvdModel) => Dvd.fromModel(dvdModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Dvd>>> searchBySubject(String subject) async {
    try {
      final dvdList = await localDataSource.searchBySubject(subject);
      return Right(
          dvdList.map((dvdModel) => Dvd.fromModel(dvdModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Dvd>>> searchByTitle(String title) async {
    try {
      final dvdList = await localDataSource.searchByTitle(title);
      return Right(
          dvdList.map((dvdModel) => Dvd.fromModel(dvdModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Dvd>> addDvd(Dvd dvd) async {
    try {
      await localDataSource.saveDvd(dvd.toModel());
      return Right(dvd);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, Dvd>> updateDvd(Dvd dvd) async {
    try {
      await localDataSource.saveDvd(dvd.toModel());
      return Right(dvd);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }


  @override
  Future<Either<Failure, List<Dvd>>> searchDvd(String queryData) async {
    try {
      final dvdList = await localDataSource.searchDvd(queryData);
      return Right(
          dvdList.map((dvdModel) => Dvd.fromModel(dvdModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }
}
