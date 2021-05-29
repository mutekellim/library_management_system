// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../core/errors/failures.dart';
import '../../core/constants.dart';
import 'book.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc({required this.bookRepository}) : super(BookInitial());

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is AddBook) {
      yield* _mapBookAddToState(event);
    } else if (event is SearchBook) {
      yield* _mapSearchBookToState(event);
    }
  }

  Stream<BookState> _mapBookAddToState(AddBook event) async* {
    final Either<Failure, Book> failureOrBook =
        await bookRepository.addBook(event.book);
    yield failureOrBook.fold(
      (failure) => BookFailure(message: DATABASE_FAILURE_MESSAGE),
      (book) => AddBookSuccess(message: ADD_SUCCESS, bookId: book.id),
    );
  }

  Stream<BookState> _mapSearchBookToState(SearchBook event) async* {
    yield BookLoadProgress();
    final Either<Failure, List<Book>> failureOrBookList =
        await bookRepository.searchBook(event.queryData);
    yield failureOrBookList.fold(
      (failure) => BookFailure(message: DATABASE_FAILURE_MESSAGE),
      (bookList) => BookLoadSuccess(bookList: bookList),
    );
  }
}
