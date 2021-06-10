import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class BorrowEvent extends Equatable {
  const BorrowEvent();

  @override
  List<Object> get props => [];
}

class AddBorrow extends BorrowEvent {
  final Borrow borrow;

  const AddBorrow({
    required this.borrow,
  });

  @override
  List<Object> get props => [borrow];

  @override
  String toString() => 'AddBorrow {borrow : $borrow}';
}

class RemoveBorrow extends BorrowEvent {
  final int inventoryId;
  final int invType;

  const RemoveBorrow({
    required this.inventoryId,
    required this.invType,
  });

  @override
  List<Object> get props => [inventoryId, invType];

  @override
  String toString() => 'RemoveBorrow {inventoryId: $inventoryId, invType: $invType, }';
}

class GetBorrows extends BorrowEvent {
  final int memberId;

  const GetBorrows({
    required this.memberId,
  });

  @override
  List<Object> get props => [memberId];

  @override
  String toString() => 'GetBorrows {memberId : $memberId }';
}

class GetBorrowByInv extends BorrowEvent {
  final int inventoryId;
  final int invType;
  const GetBorrowByInv({
    required this.inventoryId,
    required this.invType,
  });

  @override
  List<Object> get props => [inventoryId, invType];

  @override
  String toString() => 'GetBorrowByInv {inventoryId : $inventoryId, invType:$invType }';
}
