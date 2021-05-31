import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class JournalEvent extends Equatable {
  const JournalEvent();

  @override
  List<Object> get props => [];
}

class SearchJournal extends JournalEvent {
  final String queryData;

  const SearchJournal({
    required this.queryData,
  });

  @override
  List<Object> get props => [queryData];

  @override
  String toString() => 'SearchJournal {queryData : $queryData}';
}

class AddJournal extends JournalEvent {
  final Journal journal;

  const AddJournal({
    required this.journal,
  });


  @override
  List<Object> get props => [journal];

  @override
  String toString() => 'JournalAdd {journal : $journal}';
}
