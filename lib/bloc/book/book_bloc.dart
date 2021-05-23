// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/errors/failures.dart';
import '../../data/repositories/repositories.dart';
import '../../core/constants.dart';
import 'book.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepositoryImpl bookRepository;

  BookBloc({required this.bookRepository}) : super(BookInitial());

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is AddBook) {
      yield* _mapBookAddToState(event);
    }
  }

  Stream<BookState> _mapBookAddToState(AddBook event) async* {
    final Either<Failure, void> failureOrBook =
        await bookRepository.addBook(event.book);
    yield failureOrBook.fold(
      (failure) => BookFailure(message: DATABASE_FAILURE_MESSAGE),
      (book) => AddBookSuccess(message: ADD_SUCCESS),
    );
  }

}
