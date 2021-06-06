// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

import '../sources/dao/dao.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl extends ReservationRepository {
  ReservationModelDao localDataSource;

  ReservationRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Reservation>> addReservation(Reservation reservation) async {
    try {
      await localDataSource.saveReservation(reservation.toModel());
      return Right(reservation);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> removeReservation(int reservationId) async {
    try {
      await localDataSource.deleteReservation(reservationId);
      return Right(reservationId);
    } catch (_) {
      return Left(DatabaseFailure());
    }
  }

}
