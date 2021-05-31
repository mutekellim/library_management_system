import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/core/constants.dart';

import '../widgets/list_item.dart';
import '../../bloc/book/book.dart';
import '../../bloc/dvd/dvd.dart';
import '../../bloc/journal/journal.dart';

class SearchInventoryScreen extends StatefulWidget {
  static const String routeName = '/search-inventory-screen';

  @override
  _SearchInventoryScreenState createState() => _SearchInventoryScreenState();
}

class _SearchInventoryScreenState extends State<SearchInventoryScreen> {
  final searchController = TextEditingController();
  String _inventoryType=INVENTORY_TYPE_BOOK;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  Widget _buildBookListBody(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(builder: (context, state) {
      print('STATE : $state');
      if (state is BookInitial || state is AddBookSuccess) {
        return Center(child: Text('Please enter a search term above!'));
      }
      if (state is BookLoadProgress) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is BookLoadSuccess) {
        if (state.bookList.length > 0) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.bookList.length,
            itemBuilder: (context, index) {
              return ListItemBook(
                bookId: state.bookList[index].id,
                selectedInventory: state.bookList[index],
              );
            },
          );
        } else {
          return Center(child: Text('Sorry! Book isn\'t exist!'));
        }
      }
      if (state is BookFailure) {
        return Center(child: Text('Database error! Try again!'));
      } else {
        return Center(child: Text('Unexpected Error!'));
      }
    });
  }

  Widget _buildDvdListBody(BuildContext context) {
    return BlocBuilder<DvdBloc, DvdState>(builder: (context, state) {
      print('STATE : $state');
      if (state is DvdInitial || state is AddDvdSuccess) {
        return Center(child: Text('Please enter a search term above!'));
      }
      if (state is DvdLoadProgress) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is DvdLoadSuccess) {
        if (state.dvdList.length > 0) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.dvdList.length,
            itemBuilder: (context, index) {
              return ListItemDvd(
                dvdId: state.dvdList[index].id,
                selectedInventory: state.dvdList[index],
              );
            },
          );
        } else {
          return Center(child: Text('Sorry! Dvd isn\'t exist!'));
        }
      }
      if (state is DvdFailure) {
        return Center(child: Text('Database error! Try again!'));
      } else {
        return Center(child: Text('Unexpected Error!'));
      }
    });
  }

  Widget _buildJournalListBody(BuildContext context) {
    return BlocBuilder<JournalBloc, JournalState>(builder: (context, state) {
      print('STATE : $state');
      if (state is JournalInitial || state is AddJournalSuccess) {
        return Center(child: Text('Please enter a search term above!'));
      }
      if (state is JournalLoadProgress) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is JournalLoadSuccess) {
        if (state.journalList.length > 0) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.journalList.length,
            itemBuilder: (context, index) {
              return ListItemJournal(
                journalId: state.journalList[index].id,
                selectedInventory: state.journalList[index],
              );
            },
          );
        } else {
          return Center(child: Text('Sorry! Journal isn\'t exist!'));
        }
      }
      if (state is JournalFailure) {
        return Center(child: Text('Database error! Try again!'));
      } else {
        return Center(child: Text('Unexpected Error!'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Inventory'),
        elevation: 0.2,
      ),
      body: Column(
        children: [
          Container(
            width: 360,
            child:DropdownButton<String>(
              value: _inventoryType,
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
                  _inventoryType = newValue!;
                });
              },
              items: <String>[INVENTORY_TYPE_BOOK, INVENTORY_TYPE_JOURNAL , INVENTORY_TYPE_DVD]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a search term'),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 54.0,
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      switch(_inventoryType){
                        case INVENTORY_TYPE_BOOK:
                          BlocProvider.of<BookBloc>(context)
                              .add(SearchBook(queryData: searchController.text));
                          break;
                        case INVENTORY_TYPE_DVD:
                          BlocProvider.of<DvdBloc>(context)
                              .add(SearchDvd(queryData: searchController.text));
                          break;
                        case INVENTORY_TYPE_JOURNAL:
                          print("Journal");
                          BlocProvider.of<JournalBloc>(context)
                              .add(SearchJournal(queryData: searchController.text));
                          break;
                      }
                    } else {
                      // give an alert to enter a search term.
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Visibility(
              visible:_inventoryType==INVENTORY_TYPE_BOOK?true:false ,
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 20),
                  child:Container(child: _buildBookListBody(context))
              )
          ),
          Visibility(
              visible:_inventoryType==INVENTORY_TYPE_JOURNAL?true:false ,
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 20),
                  child:Container(child: _buildJournalListBody(context))
                  )
          ),
          Visibility(
              visible:_inventoryType==INVENTORY_TYPE_DVD?true:false ,
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 20),
                  child:Container(child: _buildDvdListBody(context))
              )
          ),
        ],
      ),
    );
  }
}
