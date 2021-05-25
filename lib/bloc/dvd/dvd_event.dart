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
