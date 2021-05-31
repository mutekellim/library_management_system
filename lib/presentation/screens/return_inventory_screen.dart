import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/authorization/authorization.dart';
import 'package:library_management_system/bloc/book/book.dart';
import 'package:library_management_system/bloc/member/member.dart';
import 'package:library_management_system/bloc/rule/rule.dart';
import 'package:library_management_system/core/constants.dart';
import 'package:library_management_system/domain/entities/entities.dart';
import 'add_inventory_screen.dart';
import 'add_member_screen.dart';

import 'screens.dart';

class ReturnInventoryScreen extends StatefulWidget {
  static const String routeName = '/return-inventory-screen';

  @override
  _ReturnInventoryScreenState createState() => _ReturnInventoryScreenState();
}

class _ReturnInventoryScreenState extends State<ReturnInventoryScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  Widget _buildBookListBody(BuildContext context, List<dynamic> bookList) {
    if (bookList.length > 0) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Inventory id : ' + bookList[index].toString()),
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
        child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
            builder: (context, state) {
          //print(state.toString());
          if ( state is AuthorizationSuccess) {
            return Column(
              children: [
                Text('Balance : ${state.member.balanceAmount}'),
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
                            Member member = state.member;

                            BlocProvider.of<AuthorizationBloc>(context).add(
                                UpdateMember(
                                    penalty: 0,
                                    inventoryId:int.parse(searchController.text.trim()),
                                    action: ACTION_RETURN)
                            );

                            searchController.clear();
                            Navigator.of(context)
                                .pushNamed(ReturnInventoryScreen.routeName);
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
                _buildBookListBody(context, state.member.borrowedInventoryList),
              ],
            );
          } else if (state is AuthorizationFailure) {
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
