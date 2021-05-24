import 'package:equatable/equatable.dart';

abstract class JournalState extends Equatable {
  const JournalState();

  @override
  List<Object> get props => [];
}

class JournalInitial extends JournalState {}

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

class JournalFailure extends JournalState {
  final String message;

  const JournalFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AddJournalFailure : {message : $message}';
}
