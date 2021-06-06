import 'package:equatable/equatable.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {}

class AddReservationSuccess extends ReservationState {
  final String message;

  final int reservationId;

  const AddReservationSuccess({
    required this.message,
    required this.reservationId,
  });

  @override
  List<Object> get props => [
    message,
    reservationId,
  ];

  @override
  String toString() => 'AddReservationSuccess : {message : $message, reservationId: $reservationId}';
}

class RemoveReservationSuccess extends ReservationState {
  final String message;

  final int reservationId;

  const RemoveReservationSuccess({
    required this.message,
    required this.reservationId,
  });

  @override
  List<Object> get props => [
    message,
    reservationId,
  ];

  @override
  String toString() => 'AddReservationSuccess : {message : $message, reservationId: $reservationId}';
}

class ReservationFailure extends ReservationState {
  final String message;

  const ReservationFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'ReservationFailure : {message : $message}';
}
