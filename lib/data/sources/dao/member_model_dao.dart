import 'package:floor/floor.dart';

import '../../models/models.dart';

@dao
abstract class MemberModelDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveMember(MemberModel member);
}