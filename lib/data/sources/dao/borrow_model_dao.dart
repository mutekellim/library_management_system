import 'package:floor/floor.dart';

import '../../models/models.dart';

@dao
abstract class BorrowModelDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveBorrow(BorrowModel borrow);

  @Query('Delete * FROM ReservationModel WHERE borrowId = :borrowId')
  Future<void> deleteBorrow(int borrowId);

  @Query('SELECT * FROM BorrowModel WHERE memberId = :memberId')
  Future<List<BorrowModel>> getBorrows(int memberId);

}