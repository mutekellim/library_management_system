import 'entities.dart';

enum BookType {
  Textbook,
  Others,
}

/// [Book] class is plain dart class which will be used in Flutter application.
///
class Book extends Inventory {
  final int numberOfPages;

  final List<String> authors;

  final BookType bookType;

  Book({
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
        numberOfPages,
        authors,
        bookType,
      ];

  @override
  String toString() =>
      'Book {id : $id, typeId : $typeId, isbn:$isbn, title:$title, subject: $subject, publisher: $publisher, '
      'publishDate: $publishDate, type: $type, status:$status, numberOfPages: $numberOfPages, '
      'authors: $authors, bookType: $bookType}';

  @override
  InventoryStatus get inventoryStatus => status;
}