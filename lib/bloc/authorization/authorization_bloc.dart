// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../core/errors/failures.dart';
import '../../core/constants.dart';
import 'authorization.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final MemberRepository memberRepository;
  Member? _member;

  AuthorizationBloc({required this.memberRepository})
      : super(AuthorizationInitial());

  @override
  Stream<AuthorizationState> mapEventToState(AuthorizationEvent event) async* {
    if (event is AuthorizationByCard) {
      yield* _mapAuthorizationByCardToState(event);
    } else if (event is AuthorizationInit) {
      yield AuthorizationInitial();
    } else if (event is UpdateMember) {
      yield* _mapUpdateMemberToState(event);
    }
  }

  Stream<AuthorizationState> _mapAuthorizationByCardToState( AuthorizationByCard event) async* {
    final Either<Failure, Member> failureOrMember =
        await memberRepository.getMemberByCardId(event.cardId);
    yield failureOrMember.fold(
        (failure) => AuthorizationFailure(message: DATABASE_FAILURE_MESSAGE),
        (member) {
      _member = member;
      return AuthorizationSuccess(member: member);
    });
  }

  Stream<AuthorizationState> _mapUpdateMemberToState( UpdateMember event) async* {
    final Either<Failure, Member> failureOrMember = await memberRepository
        .addMember(updateMember(event.action, event.inventoryId, event.nOfInvLoaned, event.balanceAmount)!);
    yield failureOrMember.fold(
      (failure) => AuthorizationFailure(message: DATABASE_FAILURE_MESSAGE),
      (member) => AuthorizationSuccess(member: member),
    );
  }

  Member? updateMember(String action, int id, int noInvLoaned, int balanceAmount) {
    if (action == ACTION_RESERVED) {
      return _member?.copyWith(
          reservedInventoryList: _member!.reservedInventoryList..add(id));
    } else if (action == ACTION_LOANED) {
      return _member?.copyWith(
          borrowedInventoryList: _member!.borrowedInventoryList..add(id));
    } else if (action == ACTION_RETURN) {
      return _member?.copyWith(
          borrowedInventoryList: _member!.borrowedInventoryList..remove(id), noInvLoaned:noInvLoaned, balanceAmount:balanceAmount );
    }
  }
}
