import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();

  @override
  List<Object> get props => [];
}


class AuthorizationInit extends AuthorizationEvent {}

class AuthorizationByCard extends AuthorizationEvent {
  final String cardId;

  const AuthorizationByCard({
    required this.cardId,
  });

  @override
  List<Object> get props => [cardId];

  @override
  String toString() => 'AuthorizationByCard {cardId : $cardId}';
}

class UpdateMember extends AuthorizationEvent {
  final int inventoryId;
  final String action;

  const UpdateMember({
    required this.inventoryId,
    required this.action,
  });

  @override
  List<Object> get props => [
    inventoryId,
    action,
  ];

  @override
  String toString() =>
      'UpdateMember {inventoryId : $inventoryId, action:$action}';
}