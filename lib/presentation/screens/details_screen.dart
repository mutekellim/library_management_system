
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/authorization/authorization.dart';
import 'package:library_management_system/bloc/authorization/authorization_bloc.dart';
import 'package:library_management_system/bloc/book/book.dart';
import 'package:library_management_system/bloc/borrow/borrow.dart';
import 'package:library_management_system/bloc/journal/journal.dart';
import 'package:library_management_system/bloc/dvd/dvd.dart';

import '../../domain/entities/entities.dart';
import '../../core/constants.dart';
import '../../globals.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details-screen';
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailsScreen> {

  int getMaxLoan(String memberType)=>
    memberType=="Academician"?gRule!.nOfLoanForAcademic:memberType=="Student"?gRule!.nOfLoanForStudent:gRule!.nOfLoanForOfficer;

  bool getStatus(String status) =>
      status == INVENTORY_STATUS_AVAILABLE ? true : false;

  @override
  Widget build(BuildContext context) {

    final Map args = ModalRoute.of(context)!.settings.arguments as Map;

    if(args['invType']==INVENTORY_TYPE_BOOK) {
      return BlocBuilder<BookBloc, BookState>(builder: (context, state) {
       if(state is BookLoadSuccess){
        final selectedInventory = state
            .bookList
            .firstWhere((book) => book.id == args['id']);
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
                            errorBuilder: (BuildContext context,
                                Object exception,
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
                                child: Text(
                                    'Page number : ${selectedInventory
                                        .numberOfPages}'),
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
                              onPressed: !getStatus(
                                  selectedInventory.status) ? () {
                                BlocProvider.of<AuthorizationBloc>(context)
                                    .add(UpdateMember(
                                    balanceAmount: gMember.balanceAmount,
                                    nOfInvLoaned: gMember.noInvLoaned+1,
                                    inventoryId: selectedInventory.id,
                                    action: ACTION_RESERVED)
                                );
                                BlocProvider.of<BookBloc>(context)
                                    .add(UpdateBook(
                                    book: selectedInventory,
                                    status: INVENTORY_STATUS_RESERVED)
                                );
                              } : null,
                              child: Text('Reserve'))),
                      SizedBox(
                        width: 20,
                      ),
                      // TODO : make active if status is available
                      Expanded(
                        child: ElevatedButton(
                          onPressed: getStatus(selectedInventory.status)
                              ? () {
                            Book book = state.bookList.firstWhere((
                                book) => book.id == args['id']);
                            int maxLoan=getMaxLoan(gMember.memberType);
                            if (book.bookType == "Course Book" && gMember.memberType != "Academician") {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                    content: Text(
                                      'Course Books are only for academicians!',
                                    )));
                            }
                            else if(gMember.balanceAmount<= 0) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                    content: Text(
                                      'Sorry, your credit is not sufficient!',
                                    )));
                            }
                            else if(gMember.borrowedInventoryList.length+1>maxLoan) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                    content: Text(
                                      'Sorry, you are allowed to borrow maximum $maxLoan books!',
                                    )));
                            }
                            else {

                              BlocProvider.of<AuthorizationBloc>(context)
                                  .add(UpdateMember(
                                  balanceAmount: gMember.balanceAmount,
                                  inventoryId: selectedInventory.id,
                                  nOfInvLoaned: gMember.noInvLoaned+1,
                                  action: ACTION_LOANED));

                               BlocProvider.of<BorrowBloc>(context).add(
                                  AddBorrow(borrow: new Borrow(
                                      memberId: gMember.memberId,
                                      inventoryId: selectedInventory.id,
                                      title:selectedInventory.title,
                                      borrowDate: DateTime.now().toString(),
                                      invType: selectedInventory.typeId), ));

                               BlocProvider.of<BookBloc>(context).add(
                                   UpdateBook(
                                       book: selectedInventory,
                                       status: INVENTORY_STATUS_LOANED));

                            }

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
      }else{
         return Container();
       }
      });

    }
    else if(args['invType']==INVENTORY_TYPE_DVD){
      return BlocBuilder<DvdBloc, DvdState> (builder: (context, state) {
        final selectedInventory = (state as DvdLoadSuccess)
            .dvdList
            .firstWhere((dvd) => dvd.id == args['id']);
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
                            errorBuilder: (BuildContext context,
                                Object exception,
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
                                child: Text(
                                    'Director : ${selectedInventory
                                        .director}, Duration : ${selectedInventory
                                        .duration}'),
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
                              onPressed: !getStatus(
                                  selectedInventory.status) ? () {
                                BlocProvider.of<AuthorizationBloc>(context)
                                    .add(UpdateMember(
                                    balanceAmount: gMember.balanceAmount,
                                    inventoryId: selectedInventory.id,
                                    nOfInvLoaned: gMember.noInvLoaned+1,
                                    action: ACTION_RESERVED));
                                BlocProvider.of<DvdBloc>(context).add(
                                    UpdateDvd(
                                        dvd: selectedInventory,
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
                              onPressed: getStatus(selectedInventory.status)
                                  ? () {
                                Dvd dvd = state.dvdList.firstWhere((
                                    dvd) => dvd.id == args['id']);


                                BlocProvider.of<AuthorizationBloc>(context)
                                    .add(UpdateMember(
                                    balanceAmount: gMember.balanceAmount,
                                    nOfInvLoaned: gMember.noInvLoaned+1,
                                    inventoryId: selectedInventory.id,
                                    action: ACTION_LOANED));

                                BlocProvider.of<DvdBloc>(context).add(
                                    UpdateDvd(
                                        dvd: selectedInventory,
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
    else{
      return BlocBuilder<JournalBloc, JournalState>(builder: (context, state) {
        final selectedInventory = (state as JournalLoadSuccess)
            .journalList
            .firstWhere((journal) => journal.id == args['id']);
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
                            errorBuilder: (BuildContext context,
                                Object exception,
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
                              /*
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: Text('Type : ${selectedInventory.type}'),
                            ),
                            */
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 8),
                                child: Text(
                                    'Volume : ${selectedInventory
                                        .volume}, Issue : ${selectedInventory
                                        .issue}'),
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
                              onPressed: !getStatus(
                                  selectedInventory.status)
                                  ? () {
                                BlocProvider.of<AuthorizationBloc>(context)
                                    .add(UpdateMember(
                                    balanceAmount: gMember.balanceAmount,
                                    nOfInvLoaned: gMember.noInvLoaned+1,
                                    inventoryId: selectedInventory.id,
                                    action: ACTION_RESERVED));
                                BlocProvider.of<JournalBloc>(context).add(
                                    UpdateJournal(
                                        journal: selectedInventory,
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
                              onPressed: getStatus(selectedInventory.status)
                                  ? () {
                                Journal journal = state.journalList.firstWhere((
                                    journal) => journal.id == args['id']);


                                  BlocProvider.of<AuthorizationBloc>(context)
                                      .add(UpdateMember(
                                      balanceAmount: gMember.balanceAmount,
                                      nOfInvLoaned: gMember.noInvLoaned+1,
                                      inventoryId: selectedInventory.id,
                                      action: ACTION_LOANED));

                                  BlocProvider.of<JournalBloc>(context).add(
                                      UpdateJournal(
                                          journal: selectedInventory,
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
}
