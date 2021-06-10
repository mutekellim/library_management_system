import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class Borrow extends Equatable {
  final int memberId;
  final int inventoryId;
  final String title;
  final String borrowDate;
  final int invType;

  Borrow({
    required this.memberId,
    required this.inventoryId,
    required this.title,
    required this.borrowDate,
    required this.invType
  });

  Borrow copyWith({
    int? memberId,
    int? inventoryId,
    String? title,
    String? borrowDate,
    int? invType,


  }) =>
      Borrow(
        memberId: memberId ?? this.memberId,
        inventoryId: inventoryId ?? this.inventoryId,
        title: title ?? this.title,
        borrowDate: borrowDate ?? this.borrowDate,
        invType: invType ?? this.invType,
      );

  @override
  List<Object> get props => [
        memberId,
        inventoryId,
        title,
        borrowDate,
        invType
      ];

  @override
  String toString() =>
      'Borrow { memberId: $memberId,  inventoryId: $inventoryId, '
      'title: $title, borrowDate: $borrowDate, invType: $invType }';

  BorrowModel toModel() => BorrowModel(
    memberId: memberId,
    inventoryId: inventoryId,
    title: title,
    borrowDate: borrowDate,
    invType: invType,
  );

  static Borrow fromModel(BorrowModel model) => Borrow(
    memberId: model.memberId,
    inventoryId: model.inventoryId,
    title: model.title,
    borrowDate: model.borrowDate,
    invType: model.invType,
  );
}
