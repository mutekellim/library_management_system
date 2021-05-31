// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../core/errors/failures.dart';
import '../../core/constants.dart';
import 'dvd.dart';

class DvdBloc extends Bloc<DvdEvent, DvdState> {
  final DvdRepository dvdRepository;

  DvdBloc({required this.dvdRepository}) : super(DvdInitial());

  @override
  Stream<DvdState> mapEventToState(DvdEvent event) async* {
    if (event is AddDvd) {
      yield* _mapDVDAddToState(event);
    }
  }

  Stream<DvdState> _mapDVDAddToState(AddDvd event) async* {
    final Either<Failure, Dvd> failureOrDvd =
        await dvdRepository.addDvd(event.dvd);
    yield failureOrDvd.fold(
      (failure) => DvdFailure(message: DATABASE_FAILURE_MESSAGE),
      (dvd) => AddDvdSuccess(message: ADD_SUCCESS, dvdId: dvd.id),
    );
  }

  Stream<DvdState> _mapSearchDvdToState(SearchDvd event) async* {
    yield DvdLoadProgress();
    final Either<Failure, List<Dvd>> failureOrDvdList =
    await dvdRepository.searchDvd(event.queryData);
    yield failureOrDvdList.fold(
          (failure) => DvdFailure(message: DATABASE_FAILURE_MESSAGE),
          (dvdList) => DvdLoadSuccess(dvdList: dvdList),
    );
  }

  Stream<DvdState> _mapUpdateBookToState(UpdateDvd event) async* {
    await dvdRepository.addDvd(event.dvd.copyWith(status: event.status));
    yield* _mapSearchDvdToState(SearchDvd(queryData: event.dvd.title));
  }
}
