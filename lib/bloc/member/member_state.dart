import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class MemberState extends Equatable {
  const MemberState();

  @override
  List<Object> get props => [];
}

class MemberInitial extends MemberState {}

class AddMemberSuccess extends MemberState {
  final String message;

  final int memberId;

  const AddMemberSuccess({
    required this.message,
    required this.memberId,
  });

  @override
  List<Object> get props => [
    message,
    memberId,
  ];

  @override
  String toString() => 'AddMemberSuccess : {message : $message, memberId: $memberId}';
}

class GetMemberSuccess extends MemberState {
  final Member member;

  const GetMemberSuccess({
    required this.member,
  });

  @override
  List<Object> get props => [
    member,
  ];

  @override
  String toString() => 'GetMemberSuccess : {member : $member}';
}

class MemberFailure extends MemberState {
  final String message;

  const MemberFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'MemberFailure : {message : $message}';
}
