import 'package:equatable/equatable.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class AddBookSuccess extends BookState {
  final String message;

  final int bookId;

  const AddBookSuccess({
    required this.message,
    required this.bookId,
  });

  @override
  List<Object> get props => [
        message,
        bookId,
      ];

  @override
  String toString() => 'AddBookSuccess : {message : $message, bookId: $bookId}';
}

class BookFailure extends BookState {
  final String message;

  const BookFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AddBookFailure : {message : $message}';
}
