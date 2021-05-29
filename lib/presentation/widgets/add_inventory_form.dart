import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

typedef OnSaveCallback<T> = Function(T value);

class AddInventoryForm extends StatefulWidget {
  final OnSaveCallback onSave;

  AddInventoryForm({
    required this.onSave,
  });

  @override
  _AddInventoryFormState createState() => _AddInventoryFormState();
}

class _AddInventoryFormState extends State<AddInventoryForm> {
  final _idController = TextEditingController();
  final _typeIdController = TextEditingController();
  final _isbnController = TextEditingController();
  final _titleController = TextEditingController();
  final _subjectController = TextEditingController();
  final _publisherController = TextEditingController();
  final _languageController = TextEditingController();
  final _publishDateController = TextEditingController();
  final _typeController = TextEditingController();
  final _statusController = TextEditingController();

  // Book specifics
  final _numberOfPagesController = TextEditingController();
  final _authorsController = TextEditingController();
  final _bookTypeController = TextEditingController();

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
    _typeIdController.dispose();
    _isbnController.dispose();
    _titleController.dispose();
    _subjectController.dispose();
    _publisherController.dispose();
    _languageController.dispose();
    _publishDateController.dispose();
    _typeController.dispose();
    _statusController.dispose();
    _numberOfPagesController.dispose();
    _authorsController.dispose();
    _bookTypeController.dispose();
  }

  Book _addBook() {
    return Book(
      id: int.parse(_idController.text.trim()),
      typeId: int.parse(_typeIdController.text.trim()),
      isbn: _isbnController.text.trim(),
      title: _titleController.text.trim(),
      subject: _subjectController.text.trim(),
      publisher: _publisherController.text.trim(),
      language: _languageController.text.trim(),
      publishDate: _publishDateController.text.trim(),
      type: _typeController.text.trim(),
      status: _statusController.text.trim(),
      numberOfPages: int.parse(_numberOfPagesController.text.trim()),
      authors: _authorsController.text.split(','),
      bookType: _bookTypeController.text.trim(),
    );
  }

  Journal _addJournal() {
    return Journal(
      id: int.parse(_idController.text.trim()),
      typeId: int.parse(_typeIdController.text.trim()),
      isbn: _isbnController.text.trim(),
      title: _titleController.text.trim(),
      subject: _subjectController.text.trim(),
      publisher: _publisherController.text.trim(),
      language: _languageController.text.trim(),
      publishDate: _publishDateController.text.trim(),
      type: _typeController.text.trim(),
      status: _statusController.text.trim(),
      volume: _volumeController.text.trim(),
      issue: _issueController.text.trim(),
    );
  }

  Dvd _addDvd() {
    return Dvd(
      id: int.parse(_idController.text.trim()),
      typeId: int.parse(_typeIdController.text.trim()),
      isbn: _isbnController.text.trim(),
      title: _titleController.text.trim(),
      subject: _subjectController.text.trim(),
      publisher: _publisherController.text.trim(),
      language: _languageController.text.trim(),
      publishDate: _publishDateController.text.trim(),
      type: _typeController.text.trim(),
      status: _statusController.text.trim(),
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
          controller: _typeIdController,
          decoration: new InputDecoration(
            labelText: "Type Id",
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
        TextFormField(
          controller: _typeController,
          decoration: new InputDecoration(
            labelText: "Type",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _statusController,
          decoration: new InputDecoration(
            labelText: "Status",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _numberOfPagesController,
          decoration: new InputDecoration(
            labelText: "Page number",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _authorsController,
          decoration: new InputDecoration(
            labelText: "Authors",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _bookTypeController,
          decoration: new InputDecoration(
            labelText: "Book Type",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _volumeController,
          decoration: new InputDecoration(
            labelText: "Volume",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _issueController,
          decoration: new InputDecoration(
            labelText: "Issue",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _durationController,
          decoration: new InputDecoration(
            labelText: "Duration",
            labelStyle: TextStyle(
              color: Colors.grey[900],
            ),
          ),
        ),
        TextFormField(
          controller: _directorController,
          decoration: new InputDecoration(
            labelText: "Director",
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
            widget.onSave(_addBook());
            _clearControllers();
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text(
                'Book is added successfully!',
              )));
          },
          child: Text('Save'),
        ),
      ],
    );
  }

  void _clearControllers() {
    _idController.clear();
    _typeIdController.clear();
    _isbnController.clear();
    _titleController.clear();
    _subjectController.clear();
    _publisherController.clear();
    _languageController.clear();
    _publishDateController.clear();
    _typeController.clear();
    _statusController.clear();
    _numberOfPagesController.clear();
    _authorsController.clear();
    _bookTypeController.clear();
  }
}
