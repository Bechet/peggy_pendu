import 'package:flutter/material.dart';
import 'file:///C:/Users/Leo/AndroidStudioProjects/peggy_pendu/lib/utils/managers/csvManager.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test screen"),
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            onPressed: _onButtonPressed,
            child: Text("Test"),
          ),
        ),
      ),
    );
  }

  Future<void> _onButtonPressed() async {
    print("Test");
    CsvManager csvManager = CsvManager();
    await csvManager.convertWordCsvFileAsListPenduBean();
    print("Test");
  }
}

