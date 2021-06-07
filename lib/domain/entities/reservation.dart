import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class Reservation extends Equatable {
  final int reservationId;
  final int memberId;
  final int inventoryId;
  final int reservationDate;

  Reservation({
    required this.reservationId,
    required this.memberId,
    required this.inventoryId,
    required this.reservationDate,
  });

  Reservation copyWith({
    int? reservationId,
    int? memberId,
    int? inventoryId,
    int? reservationDate,

  }) =>
      Reservation(
        reservationId: reservationId ?? this.reservationId,
        memberId: memberId ?? this.memberId,
        inventoryId: inventoryId ?? this.inventoryId,
        reservationDate: reservationDate ?? this.reservationDate,
      );

  @override
  List<Object> get props => [
        reservationId,
        memberId,
        inventoryId,
        reservationDate,
      ];

  @override
  String toString() =>
      'Reservation {reservationId: $reservationId, memberId: $memberId, '
      'inventoryId: $inventoryId, reservationDate: $reservationDate, }';

  ReservationModel toModel() => ReservationModel(
    reservationId: reservationId,
    memberId: memberId,
    inventoryId: inventoryId,
    reservationDate: reservationDate,
  );

  static Reservation fromModel(ReservationModel model) => Reservation(
    reservationId: model.reservationId,
    memberId: model.memberId,
    inventoryId: model.inventoryId,
    reservationDate: model.reservationDate,
  );
}
