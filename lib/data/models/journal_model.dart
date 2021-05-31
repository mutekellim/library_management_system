import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

/// [BookModel] represent tha data provided by our data providers.
///
@entity
class JournalModel extends Equatable {
  @primaryKey
  final int id;
  final int typeId;

  final String isbn;
  final String title;
  final String subject;
  final String publisher;
  final String language;
  final String publishDate;
  final String status;
  final String volume;
  final String issue;


  JournalModel({
    required this.id,
    required this.typeId,
    required this.isbn,
    required this.title,
    required this.subject,
    required this.publisher,
    required this.language,
    required this.publishDate,
    required this.status,
    required this.volume,
    required this.issue,
  });

  @override
  List<Object> get props => [
    id,
    typeId,
    isbn,
    title,
    subject,
    publisher,
    language,
    publishDate,
    status,
    volume,
    issue,
  ];

  @override
  String toString() => 'BookModel {id: $id, typeId: $typeId, '
      'isbn: $isbn, title:$title, subject: $subject, publisher: $publisher, '
      'language: $language, publishDate:$publishDate, status:$status, '
      'bookType: $volume, authors: $issue}';
}
