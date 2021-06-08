import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class BorrowModel extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int borrowId;
  final int memberId;
  final int inventoryId;
  final String title;
  final String borrowDate;
  final int invType;

  BorrowModel({
    required this.borrowId,
    required this.memberId,
    required this.inventoryId,
    required this.title,
    required this.borrowDate,
    required this.invType,

  });

  @override
  List<Object> get props => [
    borrowId,
    memberId,
    inventoryId,
    title,
    borrowDate,
    invType
  ];

  @override
  String toString() =>
      'BorrowModel { borrowId: $borrowId, '
          'memberId: $memberId, inventoryDvd: $inventoryId, title: $title, borrowDate: $borrowDate, invType: $invType, }';
}
