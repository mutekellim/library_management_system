import 'entities.dart';

/// [Dvd] class is plain dart class which will be used in Flutter application.
///
class Dvd extends Inventory {
  final int duration;

  final String director;

  Dvd({
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
    this.duration,
    this.director,
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

  @override
  InventoryStatus get inventoryStatus => status;
}
