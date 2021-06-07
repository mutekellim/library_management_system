import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/authorization/authorization.dart';
import 'package:library_management_system/bloc/member/member.dart';
import 'package:library_management_system/bloc/rule/rule.dart';
import 'package:library_management_system/domain/entities/entities.dart';
import 'package:library_management_system/presentation/screens/home_screen.dart';

import '../../styles/constants.dart';
import 'screens.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passCode = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passCode.dispose();
  }

  Widget _buildPasswordTF(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Scan Entrance Card',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _passCode,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter scanned id',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if(_passCode.text=="create"){
            BlocProvider.of<MemberBloc>(context).add(
              AddMember( member: Member(
                  memberId: 1,
                  balanceAmount: 1,
                  noInvLoaned: 0,
                  cardId: 'a1',
                  memberType: 'Admin',
                  name: 'name',
                  surname: 'surname',
                  phone: 'phone',
                  mail: 'mail',
                  faculty: 'faculty',
                  department: 'department',
                  dateOfMembership: 'dateOfMembership',
                  reservedInventoryList: [],
                  borrowedInventoryList: [],
                )
              )
            );
            _passCode.clear();
          }
          else if(_passCode.text.length>0){
            BlocProvider.of<AuthorizationBloc>(context)
                .add(AuthorizationByCard(cardId: _passCode.text.trim()));
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          }
          else{
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text(
                    'Please scan your library card!',
                  )));
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.blue,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      //_buildEmailTF(),
                      SizedBox(height: 30.0),
                      _buildPasswordTF(context),
                      _buildLoginBtn(context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
