// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';

/// [RuleRepository] class is an abstract layer between
/// data layer and domain layer.
///
abstract class RuleRepository {
  Future<Either<Failure, Rule>> addRule(Rule rule);
  Future<Either<Failure, Rule>> updateRule(Rule rule);
  Future<Either<Failure, Rule>> getRule(int ruleId);
}
