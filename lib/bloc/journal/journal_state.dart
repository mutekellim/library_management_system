import 'package:equatable/equatable.dart';
import 'package:library_management_system/domain/entities/journal.dart';

abstract class JournalState extends Equatable {
  const JournalState();

  @override
  List<Object> get props => [];
}

class JournalInitial extends JournalState {}

class JournalLoadProgress extends JournalState {}

class AddJournalSuccess extends JournalState {
  final String message;

  final int journalId;

  const AddJournalSuccess({
    required this.message,
    required this.journalId,
  });

  @override
  List<Object> get props => [
        message,
        journalId,
      ];

  @override
  String toString() => 'AddJournalSuccess : {message : $message, journalId: $journalId}';
}

class JournalLoadSuccess extends JournalState {
  final List<Journal> journalList;

  const JournalLoadSuccess({
    required this.journalList,
  });

  @override
  List<Object> get props => [
    journalList,
  ];

  @override
  String toString() => 'JournalLoadSuccess : {journalList : $journalList}';
}

class JournalFailure extends JournalState {
  final String message;

  const JournalFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AddJournalFailure : {message : $message}';
}
