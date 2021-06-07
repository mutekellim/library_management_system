// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../core/errors/failures.dart';
import '../../core/constants.dart';
import 'borrow.dart';

class BorrowBloc extends Bloc<BorrowEvent, BorrowState> {
  final BorrowRepository borrowRepository;

  BorrowBloc({required this.borrowRepository}) : super(BorrowInitial());

  @override
  Stream<BorrowState> mapEventToState(BorrowEvent event) async* {
    if (event is AddBorrow) {
      yield* _mapBorrowAddToState(event);
    }
    else if (event is RemoveBorrow) {
      yield* _mapBorrowRemoveToState(event);
    }
    else if (event is GetBorrows) {
      yield* _mapBorrowGetToState(event);
    }

  }

  Stream<BorrowState> _mapBorrowAddToState(AddBorrow event) async* {
    final Either<Failure, Borrow> failureOrBorrow =
    await borrowRepository.addBorrow(event.borrow);
    yield failureOrBorrow.fold(
          (failure) => BorrowFailure(message: DATABASE_FAILURE_MESSAGE),
          (borrow) => AddBorrowSuccess(message: ADD_SUCCESS, borrowId: borrow.borrowId),
    );
  }

  Stream<BorrowState> _mapBorrowRemoveToState(RemoveBorrow event) async* {
    final Either<Failure, Borrow> failureOrBorrow =
    await borrowRepository.addBorrow(event.borrow);
    yield failureOrBorrow.fold(
          (failure) => BorrowFailure(message: DATABASE_FAILURE_MESSAGE),
          (borrow) => RemoveBorrowSuccess(message: ADD_SUCCESS, borrowId: borrow.borrowId),
    );
  }

  Stream<BorrowState> _mapBorrowGetToState(GetBorrows event) async* {

    final Either<Failure, List<Borrow>> failureOrBorrowList = await borrowRepository.getBorrows(event.memberId);
    yield failureOrBorrowList.fold(
          (failure) => BorrowFailure(message: DATABASE_FAILURE_MESSAGE),
          (borrowList) => BorrowLoadSuccess(borrowList: borrowList),
    );
  }

}
