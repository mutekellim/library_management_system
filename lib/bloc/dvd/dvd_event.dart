import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class DvdEvent extends Equatable {
  const DvdEvent();

  @override
  List<Object> get props => [];
}

class AddDvd extends DvdEvent {
  final Dvd dvd;

  const AddDvd({
    required this.dvd,
  });


  @override
  List<Object> get props => [dvd];

  @override
  String toString() => 'DvdAdd {dvd : $dvd}';
}

class SearchDvd extends DvdEvent {
  final String queryData;

  const SearchDvd({
    required this.queryData,
  });

  @override
  List<Object> get props => [queryData];

  @override
  String toString() => 'SearchJournal {queryData : $queryData}';
}

class UpdateDvd extends DvdEvent {
  final Dvd dvd;
  final String status;

  const UpdateDvd({
    required this.dvd,
    required this.status,
  });

  @override
  List<Object> get props => [
    dvd,
    status,
  ];

  @override
  String toString() => 'UpdateDvd {dvd : $dvd, status: $status}';
}
