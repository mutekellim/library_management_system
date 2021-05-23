import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/domain/entities/book.dart';
import 'package:library_management_system/presentation/screens/add_inventory_screen.dart';

import 'bloc/book/book.dart';
import 'dependency_injection.dart' as di;
import 'presentation/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookBloc>(
          create: (context) => di.sl<BookBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'LMS',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          AddInventoryScreen.routeName: (context) => AddInventoryScreen(),
          AddBookScreen.routeName: (context) => AddBookScreen(),
        },
      ),
    );
  }
}
