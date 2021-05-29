import 'package:flutter/material.dart';
import 'package:library_management_system/presentation/screens/details_screen.dart';

import '../../domain/entities/entities.dart';

class ListItem extends StatelessWidget {
  final int bookId;
  final Book selectedInventory;

  ListItem({
    required this.bookId,
    required this.selectedInventory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(
              Icons.error_outline,
              size: 45,
            ),
            title: Text(
              selectedInventory.title,
            ),
            onTap: () {
              navigateDetails(context);
            },
            contentPadding: EdgeInsets.all(5),
          ),
        ),
      ),
    );
  }

  void navigateDetails(BuildContext context) {
    Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: bookId);
  }
}