import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class AddBook extends BookEvent {
  final Book book;

  const AddBook({
    required this.book,
  });

  @override
  List<Object> get props => [book];

  @override
  String toString() => 'BookAdd {book : $book}';
}

class SearchBook extends BookEvent {
  final String queryData;

  const SearchBook({
    required this.queryData,
  });

  @override
  List<Object> get props => [queryData];

  @override
  String toString() => 'SearchBook {queryData : $queryData}';
}

class GetBook extends BookEvent {
  final int bookId;

  const GetBook({
    required this.bookId,
  });

  @override
  List<Object> get props => [bookId];

  @override
  String toString() => 'GetBook {id : $bookId}';
}

class UpdateBook extends BookEvent {
  final Book book;
  final String status;

  const UpdateBook({
    required this.book,
    required this.status,
  });

  @override
  List<Object> get props => [
        book,
        status,
      ];

  @override
  String toString() => 'UpdateBook {book : $book, status: $status}';
}
