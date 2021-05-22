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
    required InventoryTypes type,
    required InventoryStatus status,
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

  @override
  InventoryStatus get inventoryStatus => status;
}
