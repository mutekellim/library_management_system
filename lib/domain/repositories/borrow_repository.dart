// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';

/// [BorrowRepository] class is an abstract layer between
/// data layer and domain layer.
///
abstract class BorrowRepository {
  Future<Either<Failure, Borrow>> addBorrow(Borrow borrow);
  Future<Either<Failure, int?>> removeBorrow(int inventoryId, int invType);
  Future<Either<Failure, List<Borrow>>> getBorrows(int memberId);
  Future<Either<Failure, Borrow>> getBorrowByInv(int inventoryId, int invType);
}
