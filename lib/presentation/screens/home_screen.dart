import 'package:flutter/material.dart';
import 'package:library_management_system/presentation/screens/add_inventory_screen.dart';
import 'package:library_management_system/presentation/screens/login.dart';

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
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddInventoryScreen.routeName);
              },
              child: Center(child: Text('Add Inventory')),
            ),
          ],

        ),
      ),
    );
  }
}
