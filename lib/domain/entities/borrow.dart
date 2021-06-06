import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class Borrow extends Equatable {
  final int borrowId;
  final int memberId;
  final int inventoryId;
  final String borrowDate;

  Borrow({
    required this.borrowId,
    required this.memberId,
    required this.inventoryId,
    required this.borrowDate,
  });

  Borrow copyWith({
    int? borrowId,
    int? memberId,
    int? inventoryId,
    String? borrowDate,

  }) =>
      Borrow(
        borrowId: borrowId ?? this.borrowId,
        memberId: memberId ?? this.memberId,
        inventoryId: inventoryId ?? this.inventoryId,
        borrowDate: borrowDate ?? this.borrowDate,
      );

  @override
  List<Object> get props => [
        borrowId,
        memberId,
        inventoryId,
        borrowDate,
      ];

  @override
  String toString() =>
      'Borrow {borrowId: $borrowId, memberId: $memberId, '
      'inventoryId: $inventoryId, borrowDate: $borrowDate, }';

  BorrowModel toModel() => BorrowModel(
    borrowId: borrowId,
    memberId: memberId,
    inventoryId: inventoryId,
    borrowDate: borrowDate,
  );

  static Borrow fromModel(BorrowModel model) => Borrow(
    borrowId: model.borrowId,
    memberId: model.memberId,
    inventoryId: model.inventoryId,
    borrowDate: model.borrowDate,
  );
}
