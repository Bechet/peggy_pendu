import 'package:flutter/material.dart';
import 'package:peggy_pendu/utils/Constant.dart';

class Option extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Option"),
      ),
      body: Center(
        child: Text(Constant.comingSoon),
      ),
    );
  }
}
