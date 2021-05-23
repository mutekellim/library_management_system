import 'package:flutter/material.dart';

import 'screens.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// void _navigateScreens(BuildContext context, String routeName) {
//   switch (routeName) {
//     case AddBookScreen.routeName:
//
//       break;
//   }
// }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Management System'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddBookScreen.routeName);
            },
            child: Center(child: Text('Add Inventory')),
          ),
        ],
      ),
    );
  }
}
