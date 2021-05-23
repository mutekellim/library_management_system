import 'package:equatable/equatable.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class AddBookSuccess extends BookState {
  final String message;

  const AddBookSuccess({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AddBookSuccess : {message : $message}';
}

class BookFailure extends BookState {
  final String message;

  const BookFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AddBookFailure : {message : $message}';
}