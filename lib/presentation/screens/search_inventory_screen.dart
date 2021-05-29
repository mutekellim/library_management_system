import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/list_item.dart';
import '../../bloc/book/book.dart';

class SearchInventoryScreen extends StatefulWidget {
  static const String routeName = '/search-inventory-screen';

  @override
  _SearchInventoryScreenState createState() => _SearchInventoryScreenState();
}

class _SearchInventoryScreenState extends State<SearchInventoryScreen> {
  final searchController = TextEditingController();

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
              return ListItem(selectedInventory: state.bookList[index]);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Inventory'),
        elevation: 0.2,
      ),
      body: Column(
        children: [
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
                      BlocProvider.of<BookBloc>(context)
                          .add(SearchBook(queryData: searchController.text));
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
          SingleChildScrollView(
              padding: EdgeInsets.only(top: 20),
              child: Container(child: _buildBookListBody(context))),
        ],
      ),
    );
  }
}
