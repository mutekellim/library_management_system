import 'dart:convert';

import 'entities.dart';
import '../../data/models/models.dart';

/// [Book] class is plain dart class which will be used in Flutter application.
///
class Book extends Inventory {
  final int numberOfPages;

  final List<String> authors;

  final String bookType;

  Book({
    required int id,
    required int typeId,
    required String isbn,
    required String title,
    required String subject,
    required String publisher,
    required String language,
    required String publishDate,
    required String type,
    required String status,
    required this.numberOfPages,
    required this.authors,
    required this.bookType,
  }) : super(
          id: id,
          typeId: typeId,
          isbn: isbn,
          title: title,
          subject: subject,
          publisher: publisher,
          language: language,
          publishDate: publishDate,
          type: type,
          status: status,
        );

  @override
  List<Object> get props => [
        id,
        typeId,
        isbn,
        title,
        subject,
        publisher,
        publishDate,
        type,
        status,
        numberOfPages,
        authors,
        bookType,
      ];

  @override
  String toString() =>
      'Book {id : $id, typeId : $typeId, isbn:$isbn, title:$title, subject: $subject, publisher: $publisher, '
      'publishDate: $publishDate, type: $type, status:$status, numberOfPages: $numberOfPages, '
      'authors: $authors, bookType: $bookType}';


  BookModel toModel() => BookModel(
        id: id,
        typeId: typeId,
        numberOfPages: numberOfPages,
        isbn: isbn,
        title: title,
        subject: subject,
        publisher: publisher,
        language: language,
        publishDate: publishDate,
        type: type,
        status: status,
        bookType: bookType,
        authors: json.encode(authors),
      );


  static Book fromModel(BookModel model) => Book(
        id: model.id,
        typeId: model.typeId,
        isbn: model.isbn,
        title: model.title,
        subject: model.subject,
        publisher: model.publisher,
        language: model.language,
        publishDate: model.publishDate,
        type: model.type,
        status: model.status,
        numberOfPages: model.numberOfPages,
        authors: json.decode(model.authors),
        bookType: model.bookType,
      );
}
