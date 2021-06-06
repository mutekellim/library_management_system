// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../core/errors/failures.dart';
import '../../core/constants.dart';
import 'reservation.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final ReservationRepository reservationRepository;

  ReservationBloc({required this.reservationRepository}) : super(ReservationInitial());

  @override
  Stream<ReservationState> mapEventToState(ReservationEvent event) async* {
    if (event is AddReservation) {
      yield* _mapReservationAddToState(event);
    }
    else if (event is RemoveReservation) {
      yield* _mapReservationRemoveToState(event);
    }

  }

  Stream<ReservationState> _mapReservationAddToState(AddReservation event) async* {
    final Either<Failure, Reservation> failureOrReservation=
    await reservationRepository.addReservation(event.reservation);
    yield failureOrReservation.fold(
          (failure) => ReservationFailure(message: DATABASE_FAILURE_MESSAGE),
          (reservation) => AddReservationSuccess(message: ADD_SUCCESS, reservationId: reservation.reservationId),
    );
  }

  Stream<ReservationState> _mapReservationRemoveToState(RemoveReservation event) async* {
    final Either<Failure, Reservation> failureOrReservation =
    await reservationRepository.addReservation(event.reservation);
    yield failureOrReservation.fold(
          (failure) => ReservationFailure(message: DATABASE_FAILURE_MESSAGE),
          (reservation) => RemoveReservationSuccess(message: ADD_SUCCESS, reservationId: reservation.reservationId),
    );
  }
}
