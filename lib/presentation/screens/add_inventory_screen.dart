import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/book/book.dart';
import 'package:library_management_system/bloc/journal/journal.dart';
import 'package:library_management_system/bloc/dvd/dvd.dart';
import 'package:library_management_system/presentation/widgets/add_inventory_form.dart';

import '../../core/constants.dart';
import 'screens.dart';

//TODO 3- Inventory listesinden secilen inventory'e ait form goruntulenecek.
class AddInventoryScreen extends StatefulWidget {
  static const String routeName = '/add-inventory-screen';

  @override
  _AddInventoryScreenState createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen> {

  String chosenInventory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Inventory'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              setState(() {
                chosenInventory = result;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: INVENTORY_TYPE_BOOK,
                child: Text('Book'),
              ),
              const PopupMenuItem<String>(
                value: INVENTORY_TYPE_JOURNAL,
                child: Text('Journal'),
              ),
              const PopupMenuItem<String>(
                value: INVENTORY_TYPE_DVD,
                child: Text('Dvd'),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: buildAddInventory(context),
      ),
    );
  }

  Widget addBook() {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookInitial || state is AddBookSuccess) {
          // Form widget to add book
          return AddInventoryForm(
            activeForm: INVENTORY_TYPE_BOOK,
            onSave: (addedBook) {
              BlocProvider.of<BookBloc>(context)
                  .add(AddBook(book: addedBook));
            },
          );
        } else if (state is BookFailure) {
          // Failure widget to show failure message
          return Center(child: Text('${state.message}'));
        }
        return Center(child: Text('Unexpected Error!'));
      },
    );
  }

  Widget addJournal() {
    return BlocBuilder<JournalBloc, JournalState>(
      builder: (context, state) {
        if (state is JournalInitial || state is AddJournalSuccess) {
          // Form widget to add book
          return AddInventoryForm(
            activeForm: INVENTORY_TYPE_JOURNAL,
            onSave: (addedJournal) {
              BlocProvider.of<JournalBloc>(context)
                  .add(AddJournal(journal: addedJournal));
            },
          );
        } else if (state is JournalFailure) {
          // Failure widget to show failure message
          return Center(child: Text('${state.message}'));
        }
        return Center(child: Text('Unexpected Error!'));
      },
    );
  }

  Widget addDvd() {
    return BlocBuilder<DvdBloc, DvdState>(
      builder: (context, state) {
        if (state is DvdInitial || state is AddDvdSuccess) {
          // Form widget to add dvd
          return AddInventoryForm(
            activeForm: INVENTORY_TYPE_DVD,
            onSave: (addedDvd) {
              BlocProvider.of<DvdBloc>(context)
                  .add(AddDvd(dvd: addedDvd));
            },
          );
        } else if (state is DvdFailure) {
          // Failure widget to show failure message
          return Center(child: Text('${state.message}'));
        }
        return Center(child: Text('Unexpected Error!'));
      },
    );
  }

  //TODO 4- Add others inventories
  Widget buildAddInventory(BuildContext context) {
    switch(chosenInventory) {
      case INVENTORY_TYPE_BOOK:
        return addBook();
      case INVENTORY_TYPE_JOURNAL:
        return addJournal();
      case INVENTORY_TYPE_DVD:
        return addDvd();
      default:
        return Center(child: Text('Please choose category!'),);
    }
  }
}
