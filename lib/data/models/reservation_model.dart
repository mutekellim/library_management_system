import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class ReservationModel extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int reservationId;
  final int memberId;
  final int inventoryId;
  final int reservationDate;

  ReservationModel({
    required this.reservationId,
    required this.memberId,
    required this.inventoryId,
    required this.reservationDate,

  });

  @override
  List<Object> get props => [
    reservationId,
    memberId,
    inventoryId,
    reservationId,
  ];

  @override
  String toString() =>
      'ReservationModel { reservationId: $reservationId, '
          'memberId: $memberId, inventoryDvd: $inventoryId, reservationDate: $reservationDate, }';
}
