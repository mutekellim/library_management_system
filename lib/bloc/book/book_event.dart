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