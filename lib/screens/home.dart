
import 'package:flutter/material.dart';
import 'package:peggy_pendu/utils/Constant.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peggy Pendu"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: MaterialButton(
                child: Text("Play !"),
                onPressed: (() {
                  print("play button pressed...");
                  Navigator.pushNamed(context, Constant.pathListLevelScreen);
                }),
              ),
            ),
            Container(
              child: MaterialButton(
                child: Text("Option"),
                onPressed: (() {
                  print("Option button pressed...");
                  Navigator.pushNamed(context, Constant.pathOptionScreen);
                }),
              ),
            ),
            Container(
              child: MaterialButton(
                child: Text("Credit"),
                onPressed: (() {
                  print("Credit button pressed...");
                  Navigator.pushNamed(context, Constant.pathCreditScreen);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
