// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:library_management_system/domain/entities/reservation.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';

/// [ReservationRepository] class is an abstract layer between
/// data layer and domain layer.
///
abstract class ReservationRepository {
  Future<Either<Failure, Reservation>> addReservation(Reservation reservation);
  Future<Either<Failure, int>> removeReservation(int reservationId);
}
