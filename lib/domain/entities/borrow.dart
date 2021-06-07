import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class Borrow extends Equatable {
  final int borrowId;
  final int memberId;
  final int inventoryId;
  final String borrowDate;
  final int invType;

  Borrow({
    required this.borrowId,
    required this.memberId,
    required this.inventoryId,
    required this.borrowDate,
    required this.invType
  });

  Borrow copyWith({
    int? borrowId,
    int? memberId,
    int? inventoryId,
    String? borrowDate,
    int? invType,


  }) =>
      Borrow(
        borrowId: borrowId ?? this.borrowId,
        memberId: memberId ?? this.memberId,
        inventoryId: inventoryId ?? this.inventoryId,
        borrowDate: borrowDate ?? this.borrowDate,
        invType: invType ?? this.invType,
      );

  @override
  List<Object> get props => [
        borrowId,
        memberId,
        inventoryId,
        borrowDate,
        invType
      ];

  @override
  String toString() =>
      'Borrow {borrowId: $borrowId, memberId: $memberId, '
      'inventoryId: $inventoryId, borrowDate: $borrowDate, invType: $invType }';

  BorrowModel toModel() => BorrowModel(
    borrowId: borrowId,
    memberId: memberId,
    inventoryId: inventoryId,
    borrowDate: borrowDate,
    invType: invType,
  );

  static Borrow fromModel(BorrowModel model) => Borrow(
    borrowId: model.borrowId,
    memberId: model.memberId,
    inventoryId: model.inventoryId,
    borrowDate: model.borrowDate,
    invType: model.invType,
  );
}
