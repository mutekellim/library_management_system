// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../core/errors/failures.dart';
import '../../core/constants.dart';
import 'member.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final MemberRepository memberRepository;

  MemberBloc({required this.memberRepository}) : super(MemberInitial());

  @override
  Stream<MemberState> mapEventToState(MemberEvent event) async* {
    if (event is AddMember) {
      yield* _mapMemberAddToState(event);
    } else if (event is GetMemberByCardId) {
      yield* _mapGetMemberByCardIdToState(event);
    }
  }

  Stream<MemberState> _mapMemberAddToState(AddMember event) async* {
    final Either<Failure, Member> failureOrMember =
    await memberRepository.addMember(event.member);
    yield failureOrMember.fold(
          (failure) => MemberFailure(message: DATABASE_FAILURE_MESSAGE),
          (member) => AddMemberSuccess(message: ADD_SUCCESS, memberId: member.memberId),
    );
  }

  Stream<MemberState> _mapGetMemberByCardIdToState(GetMemberByCardId event) async* {
    final Either<Failure, Member> failureOrMember =
    await memberRepository.getMemberByCardId(event.cardId);
    yield failureOrMember.fold(
          (failure) => MemberFailure(message: DATABASE_FAILURE_MESSAGE),
          (member) => GetMemberSuccess(member: member),
    );
  }
}
