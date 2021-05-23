import 'package:get_it/get_it.dart';

import 'bloc/book/book.dart';
import 'domain/repositories/repositories.dart';
import 'data/repositories/repositories.dart';
import 'data/sources/dao/book_model_dao.dart';
import 'data/sources/database.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Blocs
  sl.registerFactory(() => BookBloc(
        bookRepository: sl(),
      ));

  //Repositories
  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(
        localDataSource: sl(),
      ));

  //Data sources
  final database =
      await $FloorAppDatabase.databaseBuilder('library_database.db').build();

  sl.registerLazySingleton<BookModelDao>(
    () => database.bookModelDao,
  );
}
