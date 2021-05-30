import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/authorization/authorization.dart';
import 'package:library_management_system/bloc/authorization/authorization_bloc.dart';
import 'package:library_management_system/bloc/book/book.dart';

import '../../domain/entities/entities.dart';
import '../../core/constants.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details-screen';

  bool getBookStatus(String status) =>
      status == INVENTORY_STATUS_AVAILABLE ? true : false;

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    return BlocBuilder<BookBloc, BookState>(builder: (context, state) {
      final selectedInventory = (state as BookLoadSuccess)
          .bookList
          .firstWhere((book) => book.id == id);
      return Scaffold(
        appBar: AppBar(
          title: Text('Inventory Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        child: Image.network(
                          '',
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 30.0, top: 30.0, bottom: 30.0),
                              child: const Placeholder(
                                color: Colors.grey,
                                fallbackHeight: 120,
                              ),
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 0),
                              child: Text('${selectedInventory.title}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child:
                                  Text('Status : ${selectedInventory.status}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: Text('Type : ${selectedInventory.type}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: Text(
                                  'Page number : ${selectedInventory.numberOfPages}'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      // color: Colors.black,
//                      color: Color.fromRGBO(58, 66, 86, 1.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Subject',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text('${selectedInventory.subject}'),
                  ),
                ),
                Row(
                  children: [
                    // TODO : make active if status is not available
                    Expanded(
                        child: ElevatedButton(
                            onPressed: !getBookStatus(selectedInventory.status)
                                ? () {
                                    BlocProvider.of<AuthorizationBloc>(context)
                                        .add(UpdateMember(
                                            inventoryId: selectedInventory.id,
                                            action: ACTION_RESERVED));
                                    BlocProvider.of<BookBloc>(context).add(
                                        UpdateBook(
                                            book: selectedInventory,
                                            status: INVENTORY_STATUS_RESERVED));
                                  }
                                : null,
                            child: Text('Reserve'))),
                    SizedBox(
                      width: 20,
                    ),
                    // TODO : make active if status is available
                    Expanded(
                        child: ElevatedButton(
                            onPressed: getBookStatus(selectedInventory.status)
                                ? () {
                                    BlocProvider.of<AuthorizationBloc>(context)
                                        .add(UpdateMember(
                                            inventoryId: selectedInventory.id,
                                            action: ACTION_LOANED));
                                    BlocProvider.of<BookBloc>(context).add(
                                        UpdateBook(
                                            book: selectedInventory,
                                            status: INVENTORY_STATUS_LOANED));
                                  }
                                : null,
                            child: Text('Borrow'))),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
