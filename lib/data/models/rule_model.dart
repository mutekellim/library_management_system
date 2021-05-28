import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class RuleModel extends Equatable {
  @primaryKey
  final int ruleId;

  final int invBook;
  final int invDvd;
  final int invJournal;

  final int loanPeriodForAcademic;
  final int loanPeriodForOfficer;
  final int loanPeriodForStudent;

  final int nOfLoanForAcademic;
  final int nOfLoanForOfficer;
  final int nOfLoanForStudent;

  final double penaltyAmountForAcademic;
  final double penaltyAmountForOfficer;
  final double penaltyAmountForStudent;

  RuleModel({
    required this.ruleId,

    required this.invBook,
    required this.invDvd,
    required this.invJournal,

    required this.loanPeriodForAcademic,
    required this.loanPeriodForOfficer,
    required this.loanPeriodForStudent,

    required this.nOfLoanForAcademic,
    required this.nOfLoanForOfficer,
    required this.nOfLoanForStudent,

    required this.penaltyAmountForAcademic,
    required this.penaltyAmountForOfficer,
    required this.penaltyAmountForStudent,
  });

  @override
  List<Object> get props => [
    ruleId,
    invBook,
    invDvd,
    invJournal,
    loanPeriodForAcademic,
    loanPeriodForOfficer,
    loanPeriodForStudent,
    nOfLoanForAcademic,
    nOfLoanForOfficer,
    nOfLoanForStudent,
    penaltyAmountForAcademic,
    penaltyAmountForOfficer,
    penaltyAmountForStudent,
  ];

  @override
  String toString() =>
      'RuleModel {ruleId: $ruleId, '
          'invBook: $invBook, invDvd: $invDvd, invJournal: $invJournal, '
          'loanPeriodForAcademic: $loanPeriodForAcademic, loanPeriodForOfficer: $loanPeriodForOfficer, loanPeriodForStudent: $loanPeriodForStudent, '
          'nOfLoanForAcademic: $nOfLoanForAcademic, nOfLoanForOfficer: $nOfLoanForOfficer, nOfLoanForStudent:, $nOfLoanForStudent, '
          'penaltyAmountForAcademic: $penaltyAmountForAcademic, penaltyAmountForOfficer: $penaltyAmountForOfficer, penaltyAmountForStudent: $penaltyAmountForStudent }';
}
