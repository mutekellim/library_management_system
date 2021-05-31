import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/member/member.dart';
import 'package:library_management_system/presentation/widgets/add_member_form.dart';

import '../../core/constants.dart';
import 'screens.dart';

//TODO 3- Inventory listesinden secilen inventory'e ait form goruntulenecek.
class AddMemberScreen extends StatefulWidget {
  static const String routeName = '/add-member-screen';

  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Member'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: addMember(context),
      ),
    );
  }

  Widget addMember(context) {
    return BlocBuilder<MemberBloc, MemberState>(
      builder: (context, state) {
        if (state is MemberInitial || state is GetMemberSuccess || state is AddMemberSuccess) {
          // Form widget to add book
          return AddMemberForm(
            onSave: (member) {
              BlocProvider.of<MemberBloc>(context)
                  .add(AddMember(member: member));
            },
          );
        } else if (state is MemberFailure) {
          // Failure widget to show failure message
          return Center(child: Text('${state.message}'));
        }
        return Center(child: Text('Unexpected Error!'));
      },
    );
  }
}
