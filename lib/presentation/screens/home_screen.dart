import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/member/member.dart';

import 'add_inventory_screen.dart';
import 'add_member_screen.dart';

import 'screens.dart';

//TODO 1- Kart numarasi girisi burada olacak.
//TODO 2- Memberin yetkisine gore butonlar listelenecek.
class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Management System'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<MemberBloc, MemberState>(builder: (context, state) {
          if (state is GetMemberSuccess) {
            if(state.member.cardId.startsWith('m')) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          AddInventoryScreen.routeName);
                    },
                    child: Center(child: Text('Add Inventory')),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          AddMemberScreen.routeName);
                    },
                    child: Center(child: Text('Add Member')),
                  ),
                ],

              );
            } else {
              return Container();
            }
          } else if(state is MemberFailure) {
            return Container();
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
