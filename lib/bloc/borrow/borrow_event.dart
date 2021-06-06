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
  final Borrow borrow;

  const RemoveBorrow({
    required this.borrow,
  });

  @override
  List<Object> get props => [borrow];

  @override
  String toString() => 'RemoveBorrow {borrow : $borrow}';
}


