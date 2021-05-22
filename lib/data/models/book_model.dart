import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

/// [BookModel] represent tha data provided by our data providers.
///
@entity
class BookModel extends Equatable {
  @primaryKey
  final int id;
  final int typeId;
  final int numberOfPages;

  final String isbn;
  final String title;
  final String subject;
  final String publisher;
  final String language;
  final String publishDate;
  final String type;
  final String status;
  final String bookType;
  final String authors;

  BookModel({
    required this.id,
    required this.typeId,
    required this.numberOfPages,
    required this.isbn,
    required this.title,
    required this.subject,
    required this.publisher,
    required this.language,
    required this.publishDate,
    required this.type,
    required this.status,
    required this.bookType,
    required this.authors,
  });

  @override
  List<Object> get props => [
        id,
        typeId,
        numberOfPages,
        isbn,
        title,
        subject,
        publisher,
        language,
        publishDate,
        type,
        status,
        bookType,
        authors,
      ];

  @override
  String toString() => 'BookModel {id: $id, typeId: $typeId, numberOfPages:$numberOfPages, '
      'isbn: $isbn, title:$title, subject: $subject, publisher: $publisher, '
      'language: $language, publishDate:$publishDate, type:$type, status:$status, '
      'bookType: $bookType, authors: $authors}';
}
