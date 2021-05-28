import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

typedef OnSaveCallback<T> = Function(T value);

class RuleForm extends StatefulWidget {
  final OnSaveCallback onSave;

  RuleForm({
    required this.onSave,
  });

  @override
  _RuleFormState createState() => _RuleFormState();
}

class _RuleFormState extends State<RuleForm> {
  final _ruleId = 1;
  bool _invBook=true;
  bool _invDvd=false;
  bool _invJournal=true ;

  final _loanPeriodForAcademic = TextEditingController();
  final _loanPeriodForOfficer = TextEditingController();
  final _loanPeriodForStudent = TextEditingController();

  final _nOfLoanForAcademic = TextEditingController();
  final _nOfLoanForOfficer = TextEditingController();
  final _nOfLoanForStudent = TextEditingController();

  final _penaltyAmountForAcademic = TextEditingController();
  final _penaltyAmountForOfficer = TextEditingController();
  final _penaltyAmountForStudent = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _loanPeriodForAcademic.dispose();
    _loanPeriodForOfficer.dispose();
    _loanPeriodForStudent.dispose();

    _nOfLoanForAcademic.dispose();
    _nOfLoanForOfficer.dispose();
    _nOfLoanForStudent.dispose();

    _penaltyAmountForAcademic.dispose();
    _penaltyAmountForOfficer.dispose();
    _penaltyAmountForStudent.dispose();
  }

  Rule _addOrUpdateRule() {
    return Rule(
      ruleId:_ruleId,
      invBook:_invBook?1:0,
      invDvd: _invDvd?1:0,
      invJournal:_invJournal?1:0,

      loanPeriodForAcademic:  int.parse(_loanPeriodForAcademic.text.trim()),
      loanPeriodForOfficer:  int.parse(_loanPeriodForOfficer.text.trim()),
      loanPeriodForStudent:  int.parse(_loanPeriodForStudent.text.trim()),

      nOfLoanForAcademic:  int.parse(_nOfLoanForAcademic.text.trim()),
      nOfLoanForOfficer:  int.parse(_nOfLoanForOfficer.text.trim()),
      nOfLoanForStudent:  int.parse(_nOfLoanForStudent.text.trim()),

      penaltyAmountForAcademic:  double.parse(_penaltyAmountForAcademic.text.trim()),
      penaltyAmountForOfficer:  double.parse(_penaltyAmountForOfficer.text.trim()),
      penaltyAmountForStudent:  double.parse(_penaltyAmountForStudent.text.trim()),


    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Switch(
          value: _invBook,
          onChanged: (value) {
            setState(() {
              _invBook = value;
            });
          },
          activeTrackColor: Colors.yellow,
          activeColor: Colors.orangeAccent,
        ),
        Switch(
          value: _invJournal,
          onChanged: (value) {
            setState(() {
              _invJournal = value;
            });
          },
          activeTrackColor: Colors.yellow,
          activeColor: Colors.orangeAccent,
        ),
        Switch(
          value: _invDvd,
          onChanged: (value) {
            setState(() {
              _invDvd = value;
            });
          },
          activeTrackColor: Colors.yellow,
          activeColor: Colors.orangeAccent,
        ),

        TextFormField(
          controller: _loanPeriodForAcademic,
          decoration: new InputDecoration(
            labelText: "Loan Period for Academician",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _loanPeriodForOfficer,
          decoration: new InputDecoration(
            labelText: "Loan Period for Officer",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _loanPeriodForStudent,
          decoration: new InputDecoration(
            labelText: "Loan Period for Students",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),

        TextFormField(
          controller: _nOfLoanForAcademic,
          decoration: new InputDecoration(
            labelText: "# of loan for Academician",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _nOfLoanForOfficer,
          decoration: new InputDecoration(
            labelText: "# of loan for Officer",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _nOfLoanForStudent,
          decoration: new InputDecoration(
            labelText: "# of loan for Students",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),

        TextFormField(
          controller: _penaltyAmountForAcademic,
          decoration: new InputDecoration(
            labelText: "Penalty Price for Academician",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _penaltyAmountForOfficer,
          decoration: new InputDecoration(
            labelText: "Penalty Price for Officer",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _penaltyAmountForStudent,
          decoration: new InputDecoration(
            labelText: "Penalty Price for Students",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),

        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            //widget.onSave(_addMember());
            _clearControllers();
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text(
                'Member is added successfully!',
              )));
          },
          child: Text('Save'),
        ),
      ],
    );
  }

  void _clearControllers() {
    _loanPeriodForAcademic.clear();
    _loanPeriodForOfficer.clear();
    _loanPeriodForStudent.clear();

    _nOfLoanForAcademic.clear();
    _nOfLoanForOfficer.clear();
    _nOfLoanForStudent.clear();

    _penaltyAmountForAcademic.clear();
    _penaltyAmountForOfficer.clear();
    _penaltyAmountForStudent.clear();

  }
}
