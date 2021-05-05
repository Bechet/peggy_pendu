import 'package:flutter/material.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/managers/saveManager.dart';

class Option extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Option"),
      ),
      body: Center(
        child: MaterialButton(
          child: Text('Reset save file'),
          onPressed: _resetSaveFile,
        ),
      ),
    );
  }

  void _resetSaveFile() {
    SaveManager saveManager = SaveManager();
    saveManager.resetSaveFile();
    print("Save file has been reset");
  }
}
