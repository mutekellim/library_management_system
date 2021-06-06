import 'package:get_it/get_it.dart';

import 'package:library_management_system/data/sources/dao/dao.dart';

import 'bloc/authorization/authorization_bloc.dart';
import 'bloc/book/book.dart';
import 'bloc/dvd/dvd.dart';
import 'bloc/journal/journal.dart';
import 'bloc/member/member.dart';
import 'bloc/rule/rule.dart';
import 'bloc/borrow/borrow.dart';
import 'bloc/reservation/reservation.dart';

import 'data/sources/database.dart';
import 'domain/repositories/repositories.dart';
import 'data/repositories/repositories.dart';
import 'data/sources/dao/dao.dart';



final sl = GetIt.instance;

Future<void> init() async {
  //Blocs
  sl.registerFactory(
        () =>
        BookBloc(
          bookRepository: sl(),
        ),
  );
  sl.registerFactory(
        () =>
        JournalBloc(
          journalRepository: sl(),
        ),
  );
  sl.registerFactory(
        () =>
        DvdBloc(
          dvdRepository: sl(),
        ),
  );
  sl.registerFactory(
        () =>
        MemberBloc(
          memberRepository: sl(),
        ),
  );
  sl.registerFactory(
        () =>
        RuleBloc(
          ruleRepository: sl(),
        ),
  );
  sl.registerFactory(
        () =>
        AuthorizationBloc(
          memberRepository: sl(),
        ),
  );
  sl.registerFactory(
        () =>
        BorrowBloc(
          borrowRepository: sl(),
        ),
  );
  sl.registerFactory(
        () =>
        ReservationBloc(
          reservationRepository: sl(),
        ),
  );

  //Repositories
  sl.registerLazySingleton<BookRepository>(
    () => BookRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<JournalRepository>(
        () => JournalRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<DvdRepository>(
        () => DvdRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<MemberRepository>(
        () => MemberRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<RuleRepository>(
        () => RuleRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<BorrowRepository>(
        () => BorrowRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<ReservationRepository>(
        () => ReservationRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  //Data sources
  final database =  await $FloorAppDatabase.databaseBuilder('library_database.db').build();

  sl.registerLazySingleton<BookModelDao>(
    () => database.bookModelDao,
  );
  sl.registerLazySingleton<DvdModelDao>(
        () => database.dvdModelDao,
  );
  sl.registerLazySingleton<JournalModelDao>(
        () => database.journalModelDao,
  );
  sl.registerLazySingleton<MemberModelDao>(
        () => database.memberModelDao,
  );
  sl.registerLazySingleton<RuleModelDao>(
        () => database.ruleModelDao,
  );
  sl.registerLazySingleton<BorrowModelDao>(
        () => database.borrowModelDao,
  );
  sl.registerLazySingleton<ReservationModelDao>(
        () => database.reservationModelDao,
  );
}
