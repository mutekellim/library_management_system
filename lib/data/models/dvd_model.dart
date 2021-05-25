import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

/// [DvdModel] represent tha data provided by our data providers.
///
@entity
class DvdModel extends Equatable {
  @primaryKey
  final int id;
  final int typeId;
  final String isbn;
  final String title;
  final String subject;
  final String publisher;
  final String language;
  final String publishDate;
  final String type;
  final String status;
  final String director;
  final int duration;

  DvdModel({
    required this.id,
    required this.typeId,
    required this.isbn,
    required this.title,
    required this.subject,
    required this.publisher,
    required this.language,
    required this.publishDate,
    required this.type,
    required this.status,
    required this.duration,
    required this.director,
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
        type,
        status,
        duration,
        director,
      ];

  @override
  String toString() => 'DvdModel {id: $id, typeId: $typeId, '
      'isbn: $isbn, title:$title, subject: $subject, publisher: $publisher, '
      'language: $language, publishDate:$publishDate, type:$type, status:$status, '
      'duration: $duration, direction: $director}';
}
