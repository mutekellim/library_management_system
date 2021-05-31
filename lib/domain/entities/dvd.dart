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
          status: status,
        );

  Dvd copyWith({
    int? id,
    int? typeId,
    String? isbn,
    String? title,
    String? subject,
    String? publisher,
    String? language,
    String? publishDate,
    String? status,
    int? duration,
    String? director,
  }) {
    return Dvd(
      id: id ?? this.id,
      typeId: typeId ?? this.typeId,
      isbn: isbn ?? this.isbn,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      publisher: publisher ?? this.publisher,
      language: language ?? this.language,
      publishDate: publishDate ?? this.publishDate,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      director: director ?? this.director,
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
        duration,
        director,
      ];

  @override
  String toString() =>
      'Dvd {id : $id, typeId : $typeId, isbn:$isbn, title:$title, subject: $subject, publisher: $publisher, '
      'publishDate: $publishDate,  status:$status, duration: $duration, director: $director}';

  DvdModel toModel() => DvdModel(
    id: id,
    typeId: typeId,
    isbn: isbn,
    title: title,
    subject: subject,
    publisher: publisher,
    language: language,
    publishDate: publishDate,
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
    status: model.status,
    duration: model.duration,
    director: model.director,
  );
}
