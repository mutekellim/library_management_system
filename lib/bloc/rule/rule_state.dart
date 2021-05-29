import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class RuleState extends Equatable {
  const RuleState();

  @override
  List<Object> get props => [];
}

class RuleInitial extends RuleState {}

class AddRuleSuccess extends RuleState {
  final String message;

  final int ruleId;

  const AddRuleSuccess({
    required this.message,
    required this.ruleId,
  });

  @override
  List<Object> get props => [
    message,
    ruleId,
  ];

  @override
  String toString() => 'AddRuleSuccess : {message : $message, ruleId: $ruleId}';
}

class UpdateRuleSuccess extends RuleState {
  final String message;

  final int ruleId;

  const UpdateRuleSuccess({
    required this.message,
    required this.ruleId,
  });

  @override
  List<Object> get props => [
    message,
    ruleId,
  ];

  @override
  String toString() => 'UpdateRuleSuccess : {message : $message, ruleId: $ruleId}';
}

class GetRuleSuccess extends RuleState {
  final Rule rule;

  const GetRuleSuccess({
    required this.rule,
  });

  @override
  List<Object> get props => [
    rule,
  ];

  @override
  String toString() => 'GetRuleSuccess : {rule : $rule}';
}

class RuleFailure extends RuleState {
  final String message;

  const RuleFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'RuleFailure : {message : $message}';
}
