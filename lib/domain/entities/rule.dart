import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class Rule extends Equatable {
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

  final double penaltyPrice;

  Rule({
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

    required this.penaltyPrice,

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
      penaltyPrice,

  ];

  @override
  String toString() =>
      'RuleModel {ruleId: $ruleId, '
          'invBook: $invBook, invDvd: $invDvd, invJournal: $invJournal, '
          'loanPeriodForAcademic: $loanPeriodForAcademic, loanPeriodForOfficer: $loanPeriodForOfficer, loanPeriodForStudent: $loanPeriodForStudent, '
          'nOfLoanForAcademic: $nOfLoanForAcademic, nOfLoanForOfficer: $nOfLoanForOfficer, nOfLoanForStudent:, $nOfLoanForStudent, '
          'penaltyPrice: $penaltyPrice}';


 RuleModel toModel() => RuleModel(
        ruleId: ruleId,
        invBook: invBook,
        invDvd: invDvd,
        invJournal: invJournal,
        loanPeriodForAcademic: loanPeriodForAcademic,
        loanPeriodForOfficer: loanPeriodForOfficer,
        loanPeriodForStudent: loanPeriodForStudent,
        nOfLoanForAcademic: nOfLoanForAcademic,
        nOfLoanForOfficer: nOfLoanForOfficer,
        nOfLoanForStudent: nOfLoanForStudent,
        penaltyPrice: penaltyPrice,
      );

  static Rule fromModel(RuleModel model) => Rule(
        ruleId: model.ruleId,
        invBook: model.invBook,
        invDvd: model.invDvd,
        invJournal: model.invJournal,
        loanPeriodForAcademic: model.loanPeriodForAcademic,
        loanPeriodForOfficer: model.loanPeriodForOfficer,
        loanPeriodForStudent: model.loanPeriodForStudent,
        nOfLoanForAcademic: model.nOfLoanForAcademic ,
        nOfLoanForOfficer: model.nOfLoanForOfficer,
        nOfLoanForStudent: model.nOfLoanForStudent ,
        penaltyPrice: model.penaltyPrice,
      );
}
