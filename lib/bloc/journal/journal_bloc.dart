// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../core/errors/failures.dart';
import '../../core/constants.dart';
import 'journal.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  final JournalRepository journalRepository;

  JournalBloc({required this.journalRepository}) : super(JournalInitial());

  @override
  Stream<JournalState> mapEventToState(JournalEvent event) async* {
    if (event is AddJournal) {
      yield* _mapJournalAddToState(event);
    }
  }

  Stream<JournalState> _mapJournalAddToState(AddJournal event) async* {
    final Either<Failure, Journal> failureOrJournal =
        await journalRepository.addJournal(event.journal);
    yield failureOrJournal.fold(
      (failure) => JournalFailure(message: DATABASE_FAILURE_MESSAGE),
      (journal) => AddJournalSuccess(message: ADD_SUCCESS, journalId: journal.id),
    );
  }
}
