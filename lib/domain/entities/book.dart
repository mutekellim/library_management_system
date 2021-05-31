import 'dart:convert';

import 'entities.dart';
import '../../data/models/models.dart';

/// [Book] class is plain dart class which will be used in Flutter application.
///
class Book extends Inventory {
  final int numberOfPages;

  final List<dynamic> authors;

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
          status: status,
        );

  Book copyWith({
    int? id,
    int? typeId,
    String? isbn,
    String? title,
    String? subject,
    String? publisher,
    String? language,
    String? publishDate,
    String? status,
    int? numberOfPages,
    List<dynamic>? authors,
    String? bookType,
  }) {
    return Book(
      id: id ?? this.id,
      typeId: typeId ?? this.typeId,
      isbn: isbn ?? this.isbn,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      publisher: publisher ?? this.publisher,
      language: language ?? this.language,
      publishDate: publishDate ?? this.publishDate,
      status: status ?? this.status,
      numberOfPages: numberOfPages ?? this.numberOfPages,
      authors: authors ?? this.authors,
      bookType: bookType ?? this.bookType,
    );
  }

  @override
  List<Object> get props => [
        id,
        typeId,
        isbn,
        title,
        subject,
        publisher,
        publishDate,
        status,
        numberOfPages,
        authors,
        bookType,
      ];

  @override
  String toString() =>
      'Book {id : $id, typeId : $typeId, isbn:$isbn, title:$title, subject: $subject, publisher: $publisher, '
      'publishDate: $publishDate, status:$status, numberOfPages: $numberOfPages, '
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
        status: model.status,
        numberOfPages: model.numberOfPages,
        authors: json.decode(model.authors) as List<dynamic>,
        bookType: model.bookType,
      );
}
