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

bool isEmail(String string) {
  // Null or empty string is invalid
  if (string == null || string.isEmpty) {
    return false;
  }

  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return false;
  }
  return true;
}

bool isPhone(String string) {
  // Null or empty string is invalid
  if (string == null || string.isEmpty) {
    return false;
  }

  const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return false;
  }
  return true;
}

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
    phone: '+9005435670192',
    mail: 'mail@mail.com',
    faculty: 'faculty',
    department: 'department',
    dateOfMembership: 'dateOfMembership',
    reservedInventoryList: [],
    borrowedInventoryList: [],
  );

  final book = Book(
    id: 01,
    typeId: 012,
    isbn: '123123',
    title: 'title',
    subject: 'subject',
    publisher: 'publisher',
    language: 'language',
    publishDate: '11-01-1992',
    status: 'Available',
    numberOfPages: 123,
    authors: ['somebody'],
    bookType: 'Others',
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

  test('kayitli olmayan envanterin iadesi', () async {
    when(mockBookRepository.updateBook(any))
        .thenAnswer((_) async => Left(DatabaseFailure()));

    final result = await mockBookRepository.updateBook(book);

    expect(result, Left(DatabaseFailure()));

    verify(mockBookRepository.updateBook(book));

    verifyNoMoreInteractions(mockBookRepository);
  });

  test('kayitli olmayan envanterin odunc alinmasi', () async {
    when(mockBookRepository.updateBook(any))
        .thenAnswer((_) async => Left(DatabaseFailure()));

    final result = await mockBookRepository.updateBook(book);

    expect(result, Left(DatabaseFailure()));

    verify(mockBookRepository.updateBook(book));

    verifyNoMoreInteractions(mockBookRepository);
  });

  test('email validation', () async {

    expect(isEmail(member.mail),true);
  });

  test('phone validation', () async {

    expect(isPhone(member.phone),true);
  });

  test('book id null olmamali', () async {

    expect(book.id != null ,true);

  });

  test('book pages null olmamali validation', () async {

    expect(book.numberOfPages != null ,true);
  });
}
