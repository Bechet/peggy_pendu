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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: MaterialButton(
                child: Text("Play !"),
                onPressed: (() {
                  Navigator.pushNamed(context, Constant.pathListLevelScreen);
                }),
              ),
            ),
            Container(
              child: MaterialButton(
                child: Text("Option"),
                onPressed: (() {
                  Navigator.pushNamed(context, Constant.pathOptionScreen);
                }),
              ),
            ),
            Container(
              child: MaterialButton(
                child: Text("Credit"),
                onPressed: (() {
                  Navigator.pushNamed(context, Constant.pathCreditScreen);
                }),
              ),
            ),
            Container(
              child: MaterialButton(
                child: Text("Test"),
                onPressed: (() {
                  Navigator.pushNamed(context, Constant.pathTestScreen);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
