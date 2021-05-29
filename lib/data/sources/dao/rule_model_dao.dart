import 'package:floor/floor.dart';

import '../../models/models.dart';

@dao
abstract class RuleModelDao {

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addRule(RuleModel rule);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateRule(RuleModel rule);

  @Query('SELECT * FROM RuleModel WHERE ruleId = :ruleId')
  Future<RuleModel?> getRule(int ruleId);

}