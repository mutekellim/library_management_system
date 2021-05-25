import 'package:library_management_system/data/models/dvd_model.dart';

import 'entities.dart';

/// [Dvd] class is plain dart class which will be used in Flutter application.
///
class Dvd extends Inventory {
  final int duration;

  final String director;

  Dvd({
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
    required this.duration,
    required this.director,
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
        duration,
        director,
      ];

  @override
  String toString() =>
      'Dvd {id : $id, typeId : $typeId, isbn:$isbn, title:$title, subject: $subject, publisher: $publisher, '
      'publishDate: $publishDate, type: $type, status:$status, duration: $duration, director: $director}';

  DvdModel toModel() => DvdModel(
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
    duration: duration,
    director: director,
  );


  static Dvd fromModel(DvdModel model) => Dvd(
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
    duration: model.duration,
    director: model.director,
  );
}
