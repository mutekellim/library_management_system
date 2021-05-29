import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class RuleEvent extends Equatable {
  const RuleEvent();

  @override
  List<Object> get props => [];
}

class AddRule extends RuleEvent {
  final Rule rule;

  const AddRule({
    required this.rule,
  });

  @override
  List<Object> get props => [rule];

  @override
  String toString() => 'AddRule {rule : $rule}';
}

class UpdateRule extends RuleEvent {
  final Rule rule;

  const UpdateRule({
    required this.rule,
  });

  @override
  List<Object> get props => [rule];

  @override
  String toString() => 'UpdateRule {rule : $rule}';
}

class GetRule extends RuleEvent {
  final int ruleId;

  const GetRule({
    required this.ruleId,
  });

  @override
  List<Object> get props => [ruleId];

  @override
  String toString() => 'GetRule {ruleId : $ruleId}';
}
