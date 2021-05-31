// @dart=2.9
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_management_system/bloc/authorization/authorization.dart';
import 'package:library_management_system/bloc/member/member.dart';
import 'package:library_management_system/core/constants.dart';
import 'package:library_management_system/core/errors/failures.dart';
import 'package:library_management_system/domain/entities/entities.dart';
import 'package:library_management_system/domain/repositories/book_repository.dart';
import 'package:library_management_system/domain/repositories/member_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMemberRepository extends Mock implements MemberRepository {}

class MockBookRepository extends Mock implements BookRepository {}

void main() {
  MockMemberRepository mockMemberRepository;
  BookRepository mockBookRepository;

  setUp(() {
    mockMemberRepository = MockMemberRepository();
    mockBookRepository = MockBookRepository();
  });

  int memberId = 1000000001;

  final member = Member(
    memberId: memberId,
    balanceAmount: 1,
    noInvLoaned: 0,
    cardId: 'a1',
    memberType: 'memberType',
    name: 'name',
    surname: 'surname',
    phone: 'phone',
    mail: 'mail',
    faculty: 'faculty',
    department: 'department',
    dateOfMembership: 'dateOfMembership',
    reservedInventoryList: [],
    borrowedInventoryList: [],
  );

  test('memberId int bir deger olmali', () {
    expect(member.memberId.runtimeType, int);
  });

  test('memberId 10 haneli bir deger olmali', () {
    expect(member.memberId.toString().length, 10);
  });

  test('memberin bakiyesi 0 in altindayken odunc alamamali', () async {
    when(mockMemberRepository.addMember(any))
        .thenAnswer((_) async => Left(DatabaseFailure()));

    final result = await mockMemberRepository.addMember(member);

    expect(result, Left(DatabaseFailure()));

    verify(mockMemberRepository.addMember(member));

    verifyNoMoreInteractions(mockMemberRepository);
  });

  test('kayitli olmayan envanterin aranmasi', () async {
    when(mockBookRepository.searchBook(any))
        .thenAnswer((_) async => Left(DatabaseFailure()));

    final result = await mockBookRepository.searchBook('123');

    expect(result, Left(DatabaseFailure()));

    verify(mockBookRepository.searchBook('123'));

    verifyNoMoreInteractions(mockBookRepository);
  });
}
