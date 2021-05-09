import 'package:flutter/material.dart';
import 'file:///C:/Users/Leo/AndroidStudioProjects/peggy_pendu/lib/utils/managers/csvManager.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/managers/saveManager.dart';
import 'package:peggy_pendu/utils/randomUtils.dart';
import 'package:peggy_pendu/utils/stringUtils.dart';
import 'package:peggy_pendu/widgets/keyboard.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  void _onKeyClick(String test) {
    print(test);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test screen"),
      ),
      body: Center (
        child: Keyboard(_onKeyClick),
      )
    );
  }



}
