// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../core/errors/failures.dart';
import '../../core/constants.dart';
import 'rule.dart';

class RuleBloc extends Bloc<RuleEvent, RuleState> {
  final RuleRepository ruleRepository;

  RuleBloc({required this.ruleRepository}) : super(RuleInitial());

  @override
  Stream<RuleState> mapEventToState(RuleEvent event) async* {
    if (event is AddRule) {
      yield* _mapRuleAddToState(event);
    }
    else if (event is UpdateRule) {
      yield* _mapRuleUpdateToState(event);
    }
    else if (event is GetRule) {
      yield* _mapGetRuleToState(event);
    }
  }

  Stream<RuleState> _mapRuleAddToState(AddRule event) async* {
    final Either<Failure, Rule> failureOrRule =
    await ruleRepository.addRule(event.rule);
    yield failureOrRule.fold(
          (failure) => RuleFailure(message: DATABASE_FAILURE_MESSAGE),
          (rule) => AddRuleSuccess(message: ADD_SUCCESS, ruleId: rule.ruleId),
    );
  }

  Stream<RuleState> _mapRuleUpdateToState(UpdateRule event) async* {
    final Either<Failure, Rule> failureOrRule =
    await ruleRepository.addRule(event.rule);
    yield failureOrRule.fold(
          (failure) => RuleFailure(message: DATABASE_FAILURE_MESSAGE),
          (rule) => UpdateRuleSuccess(message: UPDATE_SUCCESS, ruleId: rule.ruleId),
    );
  }

  Stream<RuleState> _mapGetRuleToState(GetRule event) async* {
    final Either<Failure, Rule> failureOrRule =
    await ruleRepository.getRule(event.ruleId);
    yield failureOrRule.fold(
          (failure) => RuleFailure(message: DATABASE_FAILURE_MESSAGE),
          (rule) => GetRuleSuccess(rule: rule),
    );
  }
}
