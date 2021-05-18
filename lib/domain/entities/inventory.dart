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
    this.id,
    this.typeId,
    this.isbn,
    this.title,
    this.subject,
    this.publisher,
    this.language,
    this.publishDate,
    this.type,
    this.status,
  });

  InventoryStatus get inventoryStatus;
}
