import 'package:floor/floor.dart';

import '../../models/models.dart';

@dao
abstract class ReservationModelDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveReservation(ReservationModel reservation);

  @Query('Delete * FROM ReservationModel WHERE reservationId = :reservationId')
  Future<void> deleteReservation(int reservationId);

  /*
  @Query('SELECT * FROM ReservationModel WHERE reservationId = :reservationId')
  Future<ReservationModel?> getReservation(String reservationId);

  */
}