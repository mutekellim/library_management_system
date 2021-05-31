import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

typedef OnSaveCallback<T> = Function(T value);

class RuleForm extends StatefulWidget {
  final OnSaveCallback onSave;
  final Rule? rule;
  RuleForm({
    required this.onSave,
    required this.rule,
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

  final _penaltyPrice = TextEditingController();



  @override
  void initState() {
    if(widget.rule!=null){
      loadRule();
    }
    super.initState();
  }
  void loadRule(){
    _invBook=widget.rule!.invBook==1?true:false;
    _invDvd=widget.rule!.invDvd==1?true:false;
    _invJournal=widget.rule!.invJournal==1?true:false;
    _loanPeriodForAcademic.text = widget.rule!.loanPeriodForAcademic.toString();
    _loanPeriodForOfficer.text = widget.rule!.loanPeriodForOfficer.toString();
    _loanPeriodForStudent.text = widget.rule!.loanPeriodForStudent.toString();

    _nOfLoanForAcademic.text = widget.rule!.nOfLoanForAcademic.toString();
    _nOfLoanForOfficer.text = widget.rule!.nOfLoanForOfficer.toString();
    _nOfLoanForStudent.text = widget.rule!.nOfLoanForStudent.toString();

    _penaltyPrice.text = widget.rule!.penaltyPrice.toString();
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

    _penaltyPrice.dispose();
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

      penaltyPrice:  double.parse(_penaltyPrice.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Text("Books are allowed "),
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

          ],
        ),
        Row(
          children: [
            Text("Journals are allowed "),
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

          ],
        ),
        Row(
          children: [
            Text("DVDs are allowed "),
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

          ],
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
          controller: _penaltyPrice,
          decoration: new InputDecoration(
            labelText: "Penalty Price",
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
            widget.onSave(_addOrUpdateRule());
            //_clearControllers();
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text('Rules are updated successfully!',)
              ));

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

    _penaltyPrice.clear();

  }
}
