// @dart=2.9
import 'package:flutter/material.dart';


// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/member/member.dart';
import 'package:library_management_system/domain/entities/book.dart';
import 'package:library_management_system/domain/entities/entities.dart';
import 'package:library_management_system/presentation/screens/add_inventory_screen.dart';
import 'package:library_management_system/presentation/screens/add_member_screen.dart';
import 'package:library_management_system/presentation/screens/login.dart';

import 'bloc/book/book.dart';
import 'bloc/journal/journal.dart';
import 'bloc/dvd/dvd.dart';
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
        BlocProvider<JournalBloc>(
          create: (context) => di.sl<JournalBloc>(),
        ),
        BlocProvider<DvdBloc>(
          create: (context) => di.sl<DvdBloc>(),
        ),
        BlocProvider<MemberBloc>(
          create: (context) => di.sl<MemberBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'LMS',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          AddInventoryScreen.routeName: (context) => AddInventoryScreen(),
          AddMemberScreen.routeName: (context) => AddMemberScreen(),
        },
      ),
    );
  }
}
