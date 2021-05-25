import 'package:equatable/equatable.dart';

abstract class DvdState extends Equatable {
  const DvdState();

  @override
  List<Object> get props => [];
}

class DvdInitial extends DvdState {}

class AddDvdSuccess extends DvdState {
  final String message;

  final int dvdId;

  const AddDvdSuccess({
    required this.message,
    required this.dvdId,
  });

  @override
  List<Object> get props => [
        message,
        dvdId,
      ];

  @override
  String toString() => 'AddDvdSuccess : {message : $message, dvdId: $dvdId}';
}

class DvdFailure extends DvdState {
  final String message;

  const DvdFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AddDvdFailure : {message : $message}';
}
