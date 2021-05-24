import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

abstract class MemberEvent extends Equatable {
  const MemberEvent();

  @override
  List<Object> get props => [];
}

class AddMember extends MemberEvent {
  final Member member;

  const AddMember({
    required this.member,
  });

  @override
  List<Object> get props => [member];

  @override
  String toString() => 'AddMember {member : $member}';
}
