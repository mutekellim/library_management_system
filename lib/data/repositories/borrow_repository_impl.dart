// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:library_management_system/globals.dart';

import '../sources/dao/dao.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/borrow_repository.dart';

class BorrowRepositoryImpl extends BorrowRepository {
  BorrowModelDao localDataSource;

  BorrowRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Borrow>> addBorrow(Borrow borrow) async {
    try {
      await localDataSource.saveBorrow(borrow.toModel());
      return Right(borrow);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> removeBorrow(int borrowId) async {
    try {
      await localDataSource.deleteBorrow(borrowId);
      return Right(borrowId);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Borrow>>> getBorrows(int memberId) async {
    try {
      final borrowList = await localDataSource.getBorrows(memberId);
      return Right(
          borrowList.map((borrowModel) => Borrow.fromModel(borrowModel)).toList());
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

}
