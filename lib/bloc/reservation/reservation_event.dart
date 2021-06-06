import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

class AddReservation extends ReservationEvent {
  final Reservation reservation;

  const AddReservation({
    required this.reservation,
  });

  @override
  List<Object> get props => [reservation];

  @override
  String toString() => 'AddReservation {reservation : $reservation}';
}

class RemoveReservation extends ReservationEvent {
  final Reservation reservation;

  const RemoveReservation({
    required this.reservation,
  });

  @override
  List<Object> get props => [reservation];

  @override
  String toString() => 'RemoveReservation {reservation : $reservation}';
}


