import 'package:equatable/equatable.dart';

enum InventoryTypes {
  Book,
  Journal,
  DVD,
}

enum InventoryStatus {
  Available,
  Reserved,
  Loaned,
  Lost,
}

/// [Inventory] class is abstract plain dart class.
///
abstract class Inventory extends Equatable {
  final int id;
  final int typeId;

  final String isbn;
  final String title;
  final String subject;
  final String publisher;
  final String language;
  final String publishDate;

  final InventoryTypes type;

  final InventoryStatus status;

  const Inventory({
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
  });

  InventoryStatus get inventoryStatus;
}
