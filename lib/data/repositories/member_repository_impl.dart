// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../sources/dao/dao.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/member_repository.dart';

class MemberRepositoryImpl extends MemberRepository {
  MemberModelDao localDataSource;

  MemberRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Member>> addMember(Member member) async {
    try {
      await localDataSource.saveMember(member.toModel());
      return Right(member);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }
}
