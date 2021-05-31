import 'package:equatable/equatable.dart';
import 'package:library_management_system/domain/entities/dvd.dart';

abstract class DvdState extends Equatable {
  const DvdState();

  @override
  List<Object> get props => [];
}

class DvdInitial extends DvdState {}

class DvdLoadProgress extends DvdState {}

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

class DvdLoadSuccess extends DvdState {
  final List<Dvd> dvdList;

  const DvdLoadSuccess({
    required this.dvdList,
  });

  @override
  List<Object> get props => [
    dvdList,
  ];

  @override
  String toString() => 'DvdLoadSuccess : {bookList : $dvdList}';
}

class DvdFailure extends DvdState {
  final String message;

  const DvdFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'AddDvdFailure : {message : $message}';
}
