import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class BorrowModel extends Equatable {
  @primaryKey
  final int borrowId;
  final int memberId;
  final int inventoryId;
  final String borrowDate;

  BorrowModel({
    required this.borrowId,
    required this.memberId,
    required this.inventoryId,
    required this.borrowDate,

  });

  @override
  List<Object> get props => [
    borrowId,
    memberId,
    inventoryId,
    borrowDate,
  ];

  @override
  String toString() =>
      'BorrowModel { borrowId: $borrowId, '
          'memberId: $memberId, inventoryDvd: $inventoryId, borrowDate: $borrowDate, }';
}
