// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../../domain/repositories/repositories.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';

/// [BookRepository] class is an abstract layer between
/// data layer and domain layer.
///
abstract class BookRepository extends InventoryRepository {
  Future<Either<Failure, Book>> addBook(Book book);

  Future<Either<Failure, Book>> updateBook(Book book);

  Future<Either<Failure, List<Book>>> searchBook(String queryData);
}
