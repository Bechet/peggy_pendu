import 'package:flutter/material.dart';
import 'package:peggy_pendu/utils/Constant.dart';

class Credit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credit"),
      ),
      body:
      Center(
        child: Text(Constant.comingSoon),
      ),
    );
  }
}
