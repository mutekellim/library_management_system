import 'package:library_management_system/domain/repositories/inventory_repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/repositories.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';

/// [DvdRepository] class is an abstract layer between
/// data layer and domain layer.
///
abstract class DvdRepository extends InventoryRepository {
  Future<Either<Failure, Dvd>> addDvd(Dvd dvd);
}
