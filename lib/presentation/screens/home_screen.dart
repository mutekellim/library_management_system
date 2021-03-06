import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/authorization/authorization.dart';
import 'package:library_management_system/bloc/borrow/borrow.dart';
import 'package:library_management_system/bloc/borrow/borrow_bloc.dart';
import 'package:library_management_system/bloc/rule/rule.dart';
import 'package:library_management_system/globals.dart';
import 'package:library_management_system/presentation/screens/return_inventory_screen.dart';
import 'add_inventory_screen.dart';
import 'add_member_screen.dart';

import 'login.dart';
import 'screens.dart';

//TODO 1- Kart numarasi girisi burada olacak.
//TODO 2- Memberin yetkisine gore butonlar listelenecek.
class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String popupSelection = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Management System'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              setState(() {
                popupSelection = result;
                if (result == 'Logout')
                  BlocProvider.of<AuthorizationBloc>(context)
                      .add(AuthorizationInit());
                Navigator.of(context).pushReplacementNamed("/");
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Text('Logout'),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<AuthorizationBloc, AuthorizationState>(builder: (context, state) {
        //print(state.toString());

          // ignore: close_sinks
            RuleBloc ruleBloc = BlocProvider.of<RuleBloc>(context);
            ruleBloc.add(GetRule(ruleId: 1));
            ruleBloc.listen((ruleState) {
              if(ruleState is GetRuleSuccess){
                gRule=ruleState.rule;
              }
            });

            if (state is AuthorizationSuccess) {
              gMember=state.member;
              print(gMember);

              if (state.member.cardId.startsWith('m')) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(SearchInventoryScreen.routeName);
                      },
                      child: Center(child: Text('Search an Inventory')),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {

                        });

                        Navigator.of(context)
                            .pushNamed(ReturnInventoryScreen.routeName);
                      },
                      child: Center(child: Text('Return Inventory')),
                    ),
                  ],
                );
              } else if (state.member.cardId.startsWith('a')) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<RuleBloc>(context)
                            .add(GetRule(ruleId: 1));
                        Navigator.of(context).pushNamed(RuleScreen.routeName);
                      },
                      child: Center(child: Text('Update Rules')),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AddMemberScreen.routeName);
                      },
                      child: Center(child: Text('Add Member')),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AddInventoryScreen.routeName);
                      },
                      child: Center(child: Text('Add Inventory')),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(SearchInventoryScreen.routeName);
                      },
                      child: Center(child: Text('Search Inventory')),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {

                        });
                        Navigator.of(context)
                            .pushNamed(ReturnInventoryScreen.routeName);
                      },
                      child: Center(child: Text('Return Inventory')),
                    ),
                  ],
                );
              } else if (state.member.cardId.startsWith('l')) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AddMemberScreen.routeName);
                      },
                      child: Center(child: Text('Add Member')),
                    ),
                    ElevatedButton(
                      onPressed: () {

                        Navigator.of(context)
                            .pushNamed(AddInventoryScreen.routeName);
                      },
                      child: Center(child: Text('Add Inventory')),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(SearchInventoryScreen.routeName);
                      },
                      child: Center(child: Text('Search Inventory')),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {

                        });
                        Navigator.of(context)
                            .pushNamed(ReturnInventoryScreen.routeName);
                      },
                      child: Center(child: Text('Return Inventory')),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [],
                );
              }
            } else if (state is AuthorizationFailure) {

              return Center(child: Text('Invalid Card! \n\n${state.message}'));
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
