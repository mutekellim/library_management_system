import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();

  @override
  List<Object> get props => [];
}

class AuthorizationInitial extends AuthorizationState {}


class AuthorizationSuccess extends AuthorizationState {
  final Member member;

  const AuthorizationSuccess({
    required this.member,
  });

  @override
  List<Object> get props => [
    member,
  ];

  @override
  String toString() => 'AuthorizationSuccess : {member : $member}';
}

class AuthorizationFailure extends AuthorizationState {
  final String message;

  const AuthorizationFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AuthorizationFailure : {message : $message}';
}
