import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import '../../domain/entities/entities.dart';

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

  final InventoryTypes type;

  final InventoryStatus status;

  final BookType bookType;

  final List<String> authors;

  BookModel({
    this.id,
    this.typeId,
    this.numberOfPages,
    this.isbn,
    this.title,
    this.subject,
    this.publisher,
    this.language,
    this.publishDate,
    this.type,
    this.status,
    this.bookType,
    this.authors,
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
