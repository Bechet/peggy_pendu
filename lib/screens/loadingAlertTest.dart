import 'package:flutter/material.dart';
import 'file:///C:/Users/Leo/AndroidStudioProjects/peggy_pendu/lib/utils/managers/csvManager.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/managers/saveManager.dart';
import 'package:peggy_pendu/utils/randomUtils.dart';

class LoadingAlertTest extends StatefulWidget {
  @override
  _LoadingAlertTestState createState() => _LoadingAlertTestState();
}

class _LoadingAlertTestState extends State<LoadingAlertTest> {

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load alert Test screen"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              MaterialButton(
                onPressed: _onLoadButtonPressed,
                child: Text("Load"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _onButtonPressed() async {
  //   print("Test");
  //   CsvManager csvManager = CsvManager();
  //   await csvManager.convertWordCsvFileAsListPenduBean();
  //   print("Test");
  // }

  Future<void> _onLoadButtonPressed() async {
    print("Test _onLoadButtonPressed");
    _showLoseDialog();
    print("End _onLoadButtonPressed");
  }

  Future<void> _showLoseDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(child:
          Column(
            children: <Widget>[
              Text("test"),
              MaterialButton(
                  onPressed: () => Navigator.pop(context, "NO"),
                  child: Text('No')

              ),
              MaterialButton(
                  onPressed: () => Navigator.pop(context, "YES"),
                  child: Text('YES')

              ),
            ],
          )),
        );
      },
    ).then((value) => {
      print(value)
    });
  }



}
