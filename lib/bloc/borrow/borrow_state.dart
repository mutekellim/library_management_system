import 'package:equatable/equatable.dart';
import 'package:library_management_system/domain/entities/borrow.dart';

abstract class BorrowState extends Equatable {
  const BorrowState();

  @override
  List<Object> get props => [];
}

class BorrowInitial extends BorrowState {}

class AddBorrowSuccess extends BorrowState {
  final String message;

  final int borrowId;

  const AddBorrowSuccess({
    required this.message,
    required this.borrowId,
  });

  @override
  List<Object> get props => [
    message,
    borrowId,
  ];

  @override
  String toString() => 'AddBorrowSuccess : {message : $message, borrowId: $borrowId}';
}

class RemoveBorrowSuccess extends BorrowState {
  final String message;
  final int? count;

  const RemoveBorrowSuccess({
    required this.message,
    required this.count,
  });

  @override
  List<Object> get props => [
    message,
    count!,

  ];

  @override
  String toString() => 'RemoveBorrowSuccess : {message : $message, count: $count, }';
}

class BorrowLoadSuccess extends BorrowState {
  final List<Borrow> borrowList;

  const BorrowLoadSuccess({
    required this.borrowList,
  });

  @override
  List<Object> get props => [
    borrowList,
  ];

  @override
  String toString() => 'BorrowLoadSuccess : {borrowList : $borrowList}';
}

class GetBorrowByInvSuccess extends BorrowState {
  final Borrow borrow;

  const GetBorrowByInvSuccess({
    required this.borrow,
  });

  @override
  List<Object> get props => [
    borrow,
  ];

  @override
  String toString() => 'GetBorrowByInvSuccess : {borrow : $borrow}';
}

class BorrowFailure extends BorrowState {
  final String message;

  const BorrowFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'BorrowFailure : {message : $message}';
}
