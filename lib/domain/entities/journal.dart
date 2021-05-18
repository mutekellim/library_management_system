import 'entities.dart';

/// [Journal] class is plain dart class which will be used in Flutter application.
///
class Journal extends Inventory {
  final String volume;
  final String issue;

  Journal({
    int id,
    int typeId,
    String isbn,
    String title,
    String subject,
    String publisher,
    String language,
    String publishDate,
    InventoryTypes type,
    InventoryStatus status,
    this.volume,
    this.issue,
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

  @override
  InventoryStatus get inventoryStatus => status;
}
