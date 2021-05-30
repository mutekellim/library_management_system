import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class Member extends Equatable {
  final int memberId;
  final int balanceAmount;
  final int noInvLoaned;

  final String cardId;
  final String memberType;
  final String name;
  final String surname;
  final String phone;
  final String mail;
  final String faculty;
  final String department;
  final String dateOfMembership;

  final List<dynamic> reservedInventoryList;
  final List<dynamic> borrowedInventoryList;

  Member({
    required this.memberId,
    required this.balanceAmount,
    required this.noInvLoaned,
    required this.cardId,
    required this.memberType,
    required this.name,
    required this.surname,
    required this.phone,
    required this.mail,
    required this.faculty,
    required this.department,
    required this.dateOfMembership,
    required this.reservedInventoryList,
    required this.borrowedInventoryList,
  });

  @override
  List<Object> get props => [
        memberId,
        balanceAmount,
        noInvLoaned,
        cardId,
        memberType,
        name,
        surname,
        phone,
        mail,
        faculty,
        department,
        dateOfMembership,
        reservedInventoryList,
        borrowedInventoryList,
      ];

  @override
  String toString() =>
      'Member {memberId: $memberId, balanceAmount: $balanceAmount, '
      'noInvLoaned: $noInvLoaned, cardId: $cardId, memberType: $memberType, name: $name, '
      'surname: $surname, phone: $phone, mail: $mail, faculty: $faculty, '
      'department: $department, dateOfMembership: $dateOfMembership, '
      'reservedInventoryList: $reservedInventoryList, borrowedInventoryList: $borrowedInventoryList}';

  MemberModel toModel() => MemberModel(
        memberId: memberId,
        balanceAmount: balanceAmount,
        noInvLoaned: noInvLoaned,
        cardId: cardId,
        memberType: memberType,
        name: name,
        surname: surname,
        phone: phone,
        mail: mail,
        faculty: faculty,
        department: department,
        dateOfMembership: dateOfMembership,
        reservedInventoryList: jsonEncode(reservedInventoryList),
        borrowedInventoryList: jsonEncode(borrowedInventoryList),
      );

  static Member fromModel(MemberModel model) => Member(
        memberId: model.memberId,
        balanceAmount: model.balanceAmount,
        noInvLoaned: model.noInvLoaned,
        cardId: model.cardId,
        memberType: model.memberType,
        name: model.name,
        surname: model.surname,
        phone: model.phone,
        mail: model.mail,
        faculty: model.faculty,
        department: model.department,
        dateOfMembership: model.dateOfMembership,
        reservedInventoryList:
            json.decode(model.reservedInventoryList) as List<dynamic>,
        borrowedInventoryList:
            json.decode(model.borrowedInventoryList) as List<dynamic>,
      );
}
