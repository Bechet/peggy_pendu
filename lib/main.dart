import 'package:flutter/material.dart';
import 'package:peggy_pendu/screens/credit.dart';
import 'package:peggy_pendu/screens/game.dart';
import 'package:peggy_pendu/screens/home.dart';
import 'package:peggy_pendu/screens/listlevel.dart';
import 'package:peggy_pendu/screens/listword.dart';
import 'package:peggy_pendu/screens/loading.dart';
import 'package:peggy_pendu/screens/loadingAlertTest.dart';
import 'package:peggy_pendu/screens/option.dart';
import 'package:peggy_pendu/screens/test.dart';
import 'package:peggy_pendu/utils/Constant.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        Constant.pathHomeScreen: (context) => Home(),
        Constant.pathListLevelScreen: (context) => ListLevel(),
        Constant.pathOptionScreen: (context) => Option(),
        Constant.pathCreditScreen: (context) => Credit(),
        Constant.pathListWordScreen: (context) => ListWord(),
        Constant.pathGameScreen: (context) => Game(),
        Constant.pathTestScreen: (context) => Test(),
        Constant.pathLoadingScreen: (context) => Loading(),
        Constant.pathLoadingTestScreen: (context) => LoadingAlertTest(),
      },
    );
  }
}
