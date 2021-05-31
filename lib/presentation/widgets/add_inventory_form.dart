import 'package:flutter/material.dart';
import 'package:library_management_system/core/constants.dart';

import '../../domain/entities/entities.dart';

typedef OnSaveCallback<T> = Function(T value);

class AddInventoryForm extends StatefulWidget {
  final OnSaveCallback onSave;
  final String activeForm;
  AddInventoryForm({
    required this.activeForm,
    required this.onSave,
  });

  @override
  _AddInventoryFormState createState() => _AddInventoryFormState();
}

class _AddInventoryFormState extends State<AddInventoryForm> {
  final _idController = TextEditingController();
  final _isbnController = TextEditingController();
  final _titleController = TextEditingController();
  final _subjectController = TextEditingController();
  final _publisherController = TextEditingController();
  final _languageController = TextEditingController();
  final _publishDateController = TextEditingController();

  // Book specifics
  final _numberOfPagesController = TextEditingController();
  final _authorsController = TextEditingController();
  String _bookType = "Others";

  //Journal Specifics
  final _volumeController = TextEditingController();
  final _issueController = TextEditingController();

  //Dvd Specifics
  final _durationController = TextEditingController();
  final _directorController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
    _isbnController.dispose();
    _titleController.dispose();
    _subjectController.dispose();
    _publisherController.dispose();
    _languageController.dispose();
    _publishDateController.dispose();
    _numberOfPagesController.dispose();
    _authorsController.dispose();

  }

  Book _addBook() {
    return Book(
      id: int.parse(_idController.text.trim()),
      typeId: 1,
      isbn: _isbnController.text.trim(),
      title: _titleController.text.trim(),
      subject: _subjectController.text.trim(),
      publisher: _publisherController.text.trim(),
      language: _languageController.text.trim(),
      publishDate: _publishDateController.text.trim(),
      status: INVENTORY_STATUS_AVAILABLE,
      numberOfPages: int.parse(_numberOfPagesController.text.trim()),
      authors: _authorsController.text.split(','),
      bookType: _bookType,
    );
  }

  Journal _addJournal() {
    return Journal(
      id: int.parse(_idController.text.trim()),
      typeId:2,
      isbn: _isbnController.text.trim(),
      title: _titleController.text.trim(),
      subject: _subjectController.text.trim(),
      publisher: _publisherController.text.trim(),
      language: _languageController.text.trim(),
      publishDate: _publishDateController.text.trim(),
      status: INVENTORY_STATUS_AVAILABLE,
      volume: _volumeController.text.trim(),
      issue: _issueController.text.trim(),
    );
  }

  Dvd _addDvd() {
    return Dvd(
      id: int.parse(_idController.text.trim()),
      typeId:3,
      isbn: _isbnController.text.trim(),
      title: _titleController.text.trim(),
      subject: _subjectController.text.trim(),
      publisher: _publisherController.text.trim(),
      language: _languageController.text.trim(),
      publishDate: _publishDateController.text.trim(),
      status: INVENTORY_STATUS_AVAILABLE,
      duration:int.parse(_durationController.text.trim()),
      director: _directorController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextFormField(
          controller: _idController,
          decoration: new InputDecoration(
            labelText: "Id",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _isbnController,
          decoration: new InputDecoration(
            labelText: "Isbn",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _titleController,
          decoration: new InputDecoration(
            labelText: "Title",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _subjectController,
          decoration: new InputDecoration(
            labelText: "Subject",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _publisherController,
          decoration: new InputDecoration(
            labelText: "Publisher",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _languageController,
          decoration: new InputDecoration(
            labelText: "Language",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _publishDateController,
          decoration: new InputDecoration(
            labelText: "Publish Date",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),

        //book specifics
        Visibility(
          visible: widget.activeForm==INVENTORY_TYPE_BOOK?true:false,
          child: TextFormField(
            controller: _numberOfPagesController,
            decoration: new InputDecoration(
              labelText: "Page number",
              labelStyle: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.activeForm==INVENTORY_TYPE_BOOK?true:false,
          child: TextFormField(
            controller: _authorsController,
            decoration: new InputDecoration(
              labelText: "Authors",
              labelStyle: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.activeForm==INVENTORY_TYPE_BOOK?true:false,
          child:
          DropdownButton<String>(
            value: _bookType,
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
                _bookType = newValue!;
              });
            },
            items: <String>['Others', 'Course Book']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        //journal specifics
        Visibility(
          visible: widget.activeForm==INVENTORY_TYPE_JOURNAL?true:false,
          child: TextFormField(
            controller: _volumeController,
            decoration: new InputDecoration(
              labelText: "Volume",
              labelStyle: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.activeForm==INVENTORY_TYPE_JOURNAL?true:false,
          child: TextFormField(
            controller: _issueController,
            decoration: new InputDecoration(
              labelText: "Issue",
              labelStyle: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
        ),
        //dvd specifics
        Visibility(
          visible: widget.activeForm==INVENTORY_TYPE_DVD?true:false,
          child: TextFormField(
            controller: _durationController,
            decoration: new InputDecoration(
              labelText: "Duration",
              labelStyle: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.activeForm==INVENTORY_TYPE_DVD?true:false,
          child: TextFormField(
            controller: _directorController,
            decoration: new InputDecoration(
              labelText: "Director",
              labelStyle: TextStyle(
                color: Colors.grey[900],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            switch(widget.activeForm){
              case INVENTORY_TYPE_BOOK:
                widget.onSave(_addBook());
                break;
              case INVENTORY_TYPE_JOURNAL:
                widget.onSave(_addJournal());
                break;
              case INVENTORY_TYPE_DVD:
                widget.onSave(_addDvd());
            }
            _clearControllers();
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text(
                'Inventory is added successfully!',
              )));
          },
          child: Text('Save'),
        ),
      ],
    );
  }

  void _clearControllers() {
    _idController.clear();
    //_typeIdController.clear();
    _isbnController.clear();
    _titleController.clear();
    _subjectController.clear();
    _publisherController.clear();
    _languageController.clear();
    _publishDateController.clear();
    _numberOfPagesController.clear();
    _authorsController.clear();
  }
}
