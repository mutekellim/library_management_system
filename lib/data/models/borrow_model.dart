import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class BorrowModel extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int borrowId;
  final int memberId;
  final int inventoryId;
  final String borrowDate;
  final int invType;

  BorrowModel({
    required this.borrowId,
    required this.memberId,
    required this.inventoryId,
    required this.borrowDate,
    required this.invType,

  });

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
      'BorrowModel { borrowId: $borrowId, '
          'memberId: $memberId, inventoryDvd: $inventoryId, borrowDate: $borrowDate, invType: $invType, }';
}
