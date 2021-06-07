import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_management_system/bloc/rule/rule.dart';
import 'package:library_management_system/globals.dart';
import 'package:library_management_system/presentation/widgets/rule_form.dart';

import '../../core/constants.dart';
import 'screens.dart';

//TODO 3- Inventory listesinden secilen inventory'e ait form goruntulenecek.
class RuleScreen extends StatefulWidget {
  static const String routeName = '/rule-screen';

  @override
  _RuleScreenState createState() => _RuleScreenState();
}

class _RuleScreenState extends State<RuleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add or Update Rules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: setRule(context),
      ),
    );
  }

  Widget setRule(context) {
    return BlocBuilder<RuleBloc, RuleState>(
      builder: (context, state) {
        //print(state.toString());
        if (state is GetRuleSuccess) {
          return RuleForm(
            rule: state.rule,
            onSave: (rule) {
              BlocProvider.of<RuleBloc>(context).add(
                UpdateRule(rule: rule),
              );
            },
          );
        } else if (state is AddRuleSuccess || state is UpdateRuleSuccess) {
          BlocProvider.of<RuleBloc>(context).add(GetRule(ruleId: 1));
          return RuleForm(
            rule: null,
            onSave: (rule) {
              gRule=rule;
              BlocProvider.of<RuleBloc>(context).add(UpdateRule(rule: rule));
            },
          );
        } else
          return Center(child: Text('Unexpected Error!'));
      },
    );
  }
}
