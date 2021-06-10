import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/authorization/authorization.dart';
import 'package:library_management_system/bloc/book/book.dart';

import 'package:library_management_system/bloc/borrow/borrow.dart';
import 'package:library_management_system/bloc/member/member.dart';
import 'package:library_management_system/core/constants.dart';

import 'package:library_management_system/domain/entities/entities.dart';
import '../../globals.dart';



class ReturnInventoryScreen extends StatefulWidget {
  static const String routeName = '/return-inventory-screen';

  @override
  _ReturnInventoryScreenState createState() => _ReturnInventoryScreenState();
}

class _ReturnInventoryScreenState extends State<ReturnInventoryScreen> {
  final searchController = TextEditingController();
  static const String routeName = '/return-inventory-screen';
  int getLoanPeriod(String memberType)=>
      memberType=="Academician"?gRule!.loanPeriodForAcademic:memberType=="Student"?gRule!.loanPeriodForStudent:gRule!.loanPeriodForAcademic;
  double penaltyPrice = gRule!.penaltyPrice;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  Widget _buildBorrowListBody(BuildContext context, List<Borrow> borrowList) {
    if (borrowList.length > 0) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: borrowList.length,
        itemBuilder: (context, index) {
          DateTime dtBorrow= DateTime.parse(borrowList[index].borrowDate);
          DateTime dtNow=DateTime.now();
          final daysPassed = dtNow.difference(dtBorrow).inDays;
          final penaltyDays= daysPassed - getLoanPeriod(gMember.memberType);
          final penaltyPrice = penaltyDays > 0 ? gRule!.penaltyPrice.round() * penaltyDays :0;
          return Card(
            child: ListTile(
              title: Text('Id: ' + borrowList[index].inventoryId.toString() +
                  '\nTitle: ' + borrowList[index].title +
                  "\nBorrow Date: "+ DateTime.parse(borrowList[index].borrowDate).toIso8601String().toString().substring(0,10)+
                  (penaltyDays > 0 ?'\nDelay Penalty '+penaltyPrice.toString():'')),
              tileColor:penaltyDays >0 ? Colors.red : Colors.white,

            ),
          );
        },
      );
    } else {
      return Center(child: Text('Sorry! Book isn\'t exist!'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Return'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<BorrowBloc, BorrowState>(
            builder: (context, state) {

                BlocProvider.of<BorrowBloc>(context)
                    .add(GetBorrows(memberId: gMember.memberId));

              if (state is BorrowLoadSuccess) {
                return Column(
                  children: [
                    Text('Balance : ${gMember.balanceAmount}'),
                    SizedBox(
                      height: 15,
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
                                    hintText: 'Enter an id to return'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.keyboard_return),
                            iconSize: 54.0,
                            onPressed: () {
                              if (searchController.text.isNotEmpty) {
                                //TODO : date hesaplanarak balance update edilecek.
                                int inventoryId= int.parse(searchController.text.trim());
                                int invType=1;//Books

                                 List<Borrow> borrowList = state.borrowList.where((element) => element.inventoryId==inventoryId && element.invType==invType).toList();
                                 if(borrowList.length>0){
                                   Borrow borrow=borrowList.first;
                                   DateTime dtBorrow= DateTime.parse(borrow.borrowDate);
                                   DateTime dtNow=DateTime.now();
                                   final daysPassed = dtNow.difference(dtBorrow).inDays;
                                   final int penaltyDays = daysPassed - getLoanPeriod(gMember.memberType);

                                   BlocProvider.of<BorrowBloc>(context)
                                       .add(RemoveBorrow(inventoryId: inventoryId, invType: invType));

                                    BlocProvider.of<AuthorizationBloc>(context).add(
                                        UpdateMember(
                                            balanceAmount: penaltyDays>0 ? gMember.balanceAmount - (penaltyDays * penaltyPrice).ceil() : gMember.balanceAmount,
                                            nOfInvLoaned: gMember.noInvLoaned -1 ,
                                            inventoryId:int.parse(searchController.text.trim()),
                                            action: ACTION_RETURN)
                                    );


                                   // ignore: close_sinks
                                    var bookBloc= BlocProvider.of<BookBloc>(context);
                                    bookBloc.add(GetBook(bookId: inventoryId));
                                    bookBloc.listen((bookState) {
                                      if(bookState is GetBookSuccess){
                                         Book book = bookState.bookList.first;
                                         BlocProvider.of<BookBloc>(context).add(
                                             UpdateBook(
                                                 book: book,
                                                 status: INVENTORY_STATUS_AVAILABLE));
                                      }
                                    });

                                  searchController.clear();

                                }else{
                                   print("Entered inventory not found!");
                                 }
                              }
                              else {
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
                    _buildBorrowListBody(context, state.borrowList),
                  ],
                );
              } else if (state is BorrowFailure) {
                return Center(child: Text('${state.message}'));
              } else {
                return Column(
                  children: [],
                );
              }
            }),
      ),
    );
  }
}

class UpdateInfo{
  final int inventoryId;
  final int invType;
  final BuildContext context;
  UpdateInfo({
    required this.inventoryId,
    required this.invType,
    required this.context
  });
  int getLoanPeriod(String memberType)=>
      memberType=="Academician"?gRule!.loanPeriodForAcademic:memberType=="Student"?gRule!.loanPeriodForStudent:gRule!.loanPeriodForAcademic;
  double penaltyPrice = gRule!.penaltyPrice;


  void save(){
    // ignore: close_sinks


  }
}