import 'package:floor/floor.dart';

import '../../models/models.dart';

@dao
abstract class BorrowModelDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveBorrow(BorrowModel borrow);

  @Query('Delete FROM BorrowModel WHERE inventoryId = :inventoryId AND invType = :invType')
  Future<int?> deleteBorrow(int inventoryId, int invType);

  @Query('SELECT * FROM BorrowModel WHERE memberId = :memberId')
  Future<List<BorrowModel>> getBorrows(int memberId);

  @Query('SELECT * FROM BorrowModel WHERE inventoryId = :inventoryId ND invType = :invType')
  Future<List<BorrowModel>> getBorrowByInv(int inventoryId, int invType);
}