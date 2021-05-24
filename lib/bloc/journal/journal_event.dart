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
