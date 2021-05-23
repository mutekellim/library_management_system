// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';

/// [BookRepository] class is an abstract layer between
/// data layer and domain layer.
///
abstract class BookRepository {
  Future<Either<Failure, void>> addBook(Book book);
}
