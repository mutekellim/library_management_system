import 'entities.dart';

/// [Journal] class is plain dart class which will be used in Flutter application.
///
class Journal extends Inventory {
  final String volume;
  final String issue;

  Journal({
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
    required this.volume,
    required this.issue,
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
    volume,
    issue,
  ];

  @override
  String toString() =>
      'Journal {id : $id, typeId : $typeId, isbn:$isbn, title:$title, subject: $subject, publisher: $publisher, '
          'publishDate: $publishDate, type: $type, status:$status, volume: $volume, issue: $issue}';

}
