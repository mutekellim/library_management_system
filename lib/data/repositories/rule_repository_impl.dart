// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../sources/dao/dao.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/rule_repository.dart';

class RuleRepositoryImpl extends RuleRepository {
  RuleModelDao localDataSource;

  RuleRepositoryImpl({
    required this.localDataSource,
  });

  Future<Either<Failure, Rule>> addRule(Rule rule) async {
    try {
      await localDataSource.addRule(rule.toModel());
      return Right(rule);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  Future<Either<Failure, Rule>> updateRule(Rule rule) async {
    try {
      await localDataSource.updateRule(rule.toModel());
      return Right(rule);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  Future<Either<Failure, Rule>> getRule(int ruleId) async {
    try {
      final rule = await localDataSource.getRule(ruleId);
      if(rule!=null)
        return Right(Rule.fromModel(rule));
      else
        return Right(null);

    } catch (_) {
      print(_.toString());
      return Left(DatabaseFailure());
    }
  }
}
