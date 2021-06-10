import 'package:equatable/equatable.dart';
import 'package:library_management_system/domain/entities/entities.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoadProgress extends BookState {}

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

class BookLoadSuccess extends BookState {
  final List<Book> bookList;

  const BookLoadSuccess({
    required this.bookList,
  });

  @override
  List<Object> get props => [
        bookList,
      ];

  @override
  String toString() => 'BookLoadSuccess : {bookList : $bookList}';
}

class GetBookSuccess extends BookState {
  final List<Book> bookList;

  const GetBookSuccess({
    required this.bookList,
  });

  @override
  List<Object> get props => [
    bookList,
  ];

  @override
  String toString() => 'GetBookSuccess : {bookList : $bookList}';
}

class BookFailure extends BookState {
  final String message;

  const BookFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'BookFailure : {message : $message}';
}
