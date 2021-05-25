// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../../core/errors/failures.dart';

/// [InventoryRepository] class is an abstract layer between
/// data layer and domain layer.
///
/// Serves as a common interface for its subclasses.
abstract class InventoryRepository {
  Future<Either<Failure, List<Inventory>>> searchByTitle(String title);

  Future<Either<Failure, List<Inventory>>> searchBySubject(String subject);

  Future<Either<Failure, List<Inventory>>> searchByType(String type);

  Future<Either<Failure, List<Inventory>>> searchByPubDate(String publishDate);

}


