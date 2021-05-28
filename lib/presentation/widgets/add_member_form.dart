import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

typedef OnSaveCallback<T> = Function(T value);

class AddMemberForm extends StatefulWidget {
  final OnSaveCallback onSave;

  AddMemberForm({
    required this.onSave,
  });

  @override
  _AddMemberFormState createState() => _AddMemberFormState();
}

class _AddMemberFormState extends State<AddMemberForm> {
  final _memberIdController = TextEditingController();
  final _balanceAmountController = TextEditingController();
  //final _noInvLoanedController = TextEditingController();
  final _cardIdController = TextEditingController();
  final _memberTypeController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  final _facultyController = TextEditingController();
  final _departmentController = TextEditingController();
  final _dateOfMembershipController = TextEditingController();
  String _memberType = "Academician";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _memberIdController.dispose();
    _balanceAmountController.dispose();
    //_noInvLoanedController.dispose();
    _cardIdController.dispose();
    _memberTypeController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    _mailController.dispose();
    _facultyController.dispose();
    _departmentController.dispose();
    _dateOfMembershipController.dispose();
  }

  Member _addMember() {
    return Member(
      memberId: int.parse(_memberIdController.text.trim()),
      balanceAmount: int.parse(_balanceAmountController.text.trim()),
      //noInvLoaned: int.parse(_noInvLoanedController.text.trim()),
      noInvLoaned: 0,
      cardId: _cardIdController.text.trim(),
     //memberType: _memberTypeController.text.trim(),
      memberType: _memberType,
      name: _nameController.text.trim(),
      surname: _surnameController.text.trim(),
      phone: _phoneController.text.trim(),
      mail: _mailController.text.trim(),
      faculty:_facultyController.text.trim(),
      department: _departmentController.text.trim(),
      dateOfMembership: _dateOfMembershipController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextFormField(
          controller: _memberIdController,
          decoration: new InputDecoration(
            labelText: "Member Id",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _balanceAmountController,
          decoration: new InputDecoration(
            labelText: "Balance Amount",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        /*
        //Automatically assigned as 0
        TextFormField(
          controller: _noInvLoanedController,
          decoration: new InputDecoration(
            labelText: "No Inv Loaned",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        */
        TextFormField(
          controller: _cardIdController,
          decoration: new InputDecoration(
            labelText: "Card Id",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        /*
        TextFormField(
          controller: _memberTypeController,
          decoration: new InputDecoration(
            labelText: "Member Type",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        */
        DropdownButton<String>(
            value: _memberType,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
            setState(() {
              _memberType = newValue!;
            });
            },
            items: <String>['Academician', 'Officer', 'Student']
                .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        TextFormField(
          controller: _nameController,
          decoration: new InputDecoration(
            labelText: "Name",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _surnameController,
          decoration: new InputDecoration(
            labelText: "Surname",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _phoneController,
          decoration: new InputDecoration(
            labelText: "Phone",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _mailController,
          decoration: new InputDecoration(
            labelText: "Mail",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _facultyController,
          decoration: new InputDecoration(
            labelText: "Faculty",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _departmentController,
          decoration: new InputDecoration(
            labelText: "Department",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _dateOfMembershipController,
          decoration: new InputDecoration(
            labelText: "Date",
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
            widget.onSave(_addMember());
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
    _memberIdController.clear();
    _balanceAmountController.clear();
    //_noInvLoanedController.clear();
    _cardIdController.clear();
    _memberTypeController.clear();
    _nameController.clear();
    _surnameController.clear();
    _phoneController.clear();
    _mailController.clear();
    _facultyController.clear();
    _departmentController.clear();
    _dateOfMembershipController.clear();
  }
}
