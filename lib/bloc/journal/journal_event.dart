import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class JournalEvent extends Equatable {
  const JournalEvent();

  @override
  List<Object> get props => [];
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

class UpdateJournal extends JournalEvent {
  final Journal journal;
  final String status;

  const UpdateJournal({
    required this.journal,
    required this.status,
  });

  @override
  List<Object> get props => [
    journal,
    status,
  ];

  @override
  String toString() => 'UpdateJournal {journal : $journal, status: $status}';
}