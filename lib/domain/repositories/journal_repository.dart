// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../../domain/repositories/repositories.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';
/// [JournalRepository] class is an abstract layer between
/// data layer and domain layer.
///
abstract class JournalRepository extends InventoryRepository {
  Future<Either<Failure, Journal>> addJournal(Journal journal);

  Future<Either<Failure, Journal>> updateJournal(Journal journal);

  Future<Either<Failure, List<Journal>>> searchJournal(String queryData);
}
