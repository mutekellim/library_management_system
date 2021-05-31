import 'entities.dart';
import '../../data/models/models.dart';

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
    status: status,

  );

  Journal copyWith({
    int? id,
    int? typeId,
    String? isbn,
    String? title,
    String? subject,
    String? publisher,
    String? language,
    String? publishDate,
    String? status,
    String? volume,
    String? issue,
  }) {
    return Journal(
      id: id ?? this.id,
      typeId: typeId ?? this.typeId,
      isbn: isbn ?? this.isbn,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      publisher: publisher ?? this.publisher,
      language: language ?? this.language,
      publishDate: publishDate ?? this.publishDate,
      status: status ?? this.status,
      volume: volume ?? this.volume,
      issue: issue ?? this.issue,
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
    volume,
    issue,
  ];

  @override
  String toString() =>
      'Journal {id : $id, typeId : $typeId, isbn:$isbn, title:$title, subject: $subject, publisher: $publisher, '
          'publishDate: $publishDate, status:$status, volume: $volume, issue: $issue}';

  JournalModel toModel() => JournalModel(
    id: id,
    typeId: typeId,
    isbn: isbn,
    title: title,
    subject: subject,
    publisher: publisher,
    language: language,
    publishDate: publishDate,
    status: status,
    issue: issue,
    volume: volume,

  );

  static Journal fromModel(JournalModel model) => Journal(
    id: model.id,
    typeId: model.typeId,
    isbn: model.isbn,
    title: model.title,
    subject: model.subject,
    publisher: model.publisher,
    language: model.language,
    publishDate: model.publishDate,
    status: model.status,
    issue: model.issue,
    volume: model.volume,
  );
}
