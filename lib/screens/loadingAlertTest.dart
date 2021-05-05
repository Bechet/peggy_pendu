import 'dart:io';

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
                child: Text("Load"),
                onPressed: _onLoadButtonPressed
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onLoadButtonPressed() async {
    _showLoseDialog();
    SaveManager saveManager = SaveManager();
    final List<SaveDataBean> listSaveDataBean =  await saveManager.loadDataWithSaveFile();
    Future.delayed(Duration(seconds: Constant.LOADING_SECOND), () {
      Navigator.pop(context);
      Navigator.pushNamed(context, Constant.pathListWordScreen, arguments: {
        Constant.PARAM_KEY_LIST_DATA: listSaveDataBean
      });
    });
  }

  Future<void> _showLoseDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }



}
