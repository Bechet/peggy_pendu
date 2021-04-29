import 'package:flutter/material.dart';
import 'file:///C:/Users/Leo/AndroidStudioProjects/peggy_pendu/lib/utils/managers/csvManager.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/managers/saveManager.dart';
import 'package:peggy_pendu/utils/randomUtils.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<PenduBean> listPenduBean;
  List<SaveDataBean> listSaveDataBean;
  SaveManager saveManager;

  @override
  initState() {
    super.initState();
    saveManager = SaveManager(fileName: "Test.csv");
    listPenduBean = [
      new PenduBean(
          frenchWord: Constant.RANDOM,
          frenchDefinition: "This is the definition of the word",
          japaneseWord: "テスト",
          category1: "random"),
      new PenduBean(
          frenchWord: "chat",
          frenchDefinition: "This is the definition of the word",
          japaneseWord: "テスト",
          category1: "Animal"),
      new PenduBean(
          frenchWord: "Cuillère",
          frenchDefinition: "This is the definition of the 'another' word",
          japaneseWord: "テスト2",
          category1: "Arthur ! Arthur !!"),
      new PenduBean(
          frenchWord: "terme avec espace",
          frenchDefinition: "This is the definition of the word",
          japaneseWord: "",
          category1: "Terme avec espace"),
      new PenduBean(
          frenchWord: "terme'avec'apostrophes",
          frenchDefinition: "This is the definition of the composed word",
          japaneseWord: "テスト テスト ",
          category1: "terme'avec'apostrophes"),
      new PenduBean(
          frenchWord: "çàéïè",
          frenchDefinition: "This is the definition of the composed word",
          japaneseWord: "テスト テスト ",
          category1: "çàéïè"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test screen"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              MaterialButton(
                onPressed: _onLoadButtonPressed,
                child: Text("Load"),
              ),
              MaterialButton(
                onPressed: _onShowButtonPressed,
                child: Text("show save data"),
              ),
              MaterialButton(
                onPressed: _onWriteButtonPressed,
                child: Text("Write"),
              ),
              MaterialButton(
                onPressed: _onInitButtonPressed,
                child: Text("Init"),
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
    listSaveDataBean = await saveManager.readSaveData();
    print("End _onLoadButtonPressed");
  }

  Future<void> _onShowButtonPressed() async {
    print("Test _onShowButtonPressed");
    print(listSaveDataBean);
    print("End _onShowButtonPressed");
  }

  Future<void> _onWriteButtonPressed() async {
    print("Test _onWriteButtonPressed");
    final SaveDataBean saveDataBean = SaveDataBean(
        penduBean: listPenduBean[RandomUtils.randomInt(listPenduBean.length)],
        clearTime: RandomUtils.randomInt(3));
    print(saveDataBean);
    saveManager.updateSaveData(saveDataBean);
    print("End _onWriteButtonPressed");
  }

  Future<void> _onInitButtonPressed() async {
    print("Test _onInitButtonPressed");
    saveManager.writeSaveData([]);
    print("End _onInitButtonPressed");
  }
}
