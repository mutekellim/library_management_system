import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/book/book.dart';

class AddBookScreen extends StatelessWidget {
  static const routeName = '/add-book-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookInitial) {
            // Form widget to add book
            return Center(child: Text('Book add form'));
          } else if (state is AddBookSuccess) {
            // AddSuccess widget to show success message
            return Center(child: Text('${state.message}\n Click to add new'));
          } else if (state is BookFailure) {
            // Failure widget to show failure message
            return Center(child: Text('${state.message}'));
          }
          return Center(child: Text('Unexpected Error!'));
        },
      ),
    );
  }
}
