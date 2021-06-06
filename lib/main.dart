// @dart=2.9
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_management_system/presentation/screens/add_inventory_screen.dart';
import 'package:library_management_system/presentation/screens/add_member_screen.dart';
import 'package:library_management_system/presentation/screens/details_screen.dart';
import 'package:library_management_system/presentation/screens/login.dart';
import 'package:library_management_system/presentation/screens/return_inventory_screen.dart';
import 'package:library_management_system/presentation/screens/search_inventory_screen.dart';

import 'bloc/borrow/borrow.dart';
import 'bloc/member/member.dart';
import 'bloc/reservation/reservation.dart';
import 'bloc/book/book.dart';
import 'bloc/journal/journal.dart';
import 'bloc/dvd/dvd.dart';
import 'bloc/rule/rule_bloc.dart';
import 'bloc/authorization/authorization.dart';


import 'dependency_injection.dart' as di;
import 'presentation/screens/screens.dart';

import 'globals.dart' as globals;

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
          create: (context) =>
              di.sl<BookBloc>()..add(SearchBook(queryData: 'a')),
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
        BlocProvider<AuthorizationBloc>(
          create: (context) => di.sl<AuthorizationBloc>(),
        ),
        BlocProvider<RuleBloc>(
          create: (context) => di.sl<RuleBloc>(),
        ),
        BlocProvider<BorrowBloc>(
          create: (context) => di.sl<BorrowBloc>(),
        ),
        BlocProvider<ReservationBloc>(
          create: (context) => di.sl<ReservationBloc>(),
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
          SearchInventoryScreen.routeName: (context) => SearchInventoryScreen(),
          DetailsScreen.routeName: (context) => DetailsScreen(),
          RuleScreen.routeName: (context) => RuleScreen(),
          ReturnInventoryScreen.routeName: (context) => ReturnInventoryScreen(),
        },
      ),
    );
  }
}
