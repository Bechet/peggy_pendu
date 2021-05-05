import 'package:flutter/material.dart';
import 'file:///C:/Users/Leo/AndroidStudioProjects/peggy_pendu/lib/utils/managers/csvManager.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/managers/saveManager.dart';
import 'package:peggy_pendu/utils/randomUtils.dart';
import 'package:peggy_pendu/utils/stringUtils.dart';

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
    saveManager = SaveManager();
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
      new PenduBean(
          frenchWord: "çàéïè",
          frenchDefinition: "This is the definition of the composed word",
          japaneseWord: "テスト テスト ",
          category1: "çàéïè"),
      new PenduBean(
          frenchWord: "çàéïè",
          frenchDefinition: "This is the definition of the composed word",
          japaneseWord: "テスト テスト ",
          category1: "çàéïè"),
      new PenduBean(
          frenchWord: "çàéïè",
          frenchDefinition: "This is the definition of the composed word",
          japaneseWord: "テスト テスト ",
          category1: "çàéïè"),
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
      body: ListView(
          children: listPenduBean
              .map((penduBean) => ListTile(
            title: Text(StringUtils.replaceWordWithUnderscoreWithException(
                penduBean.frenchWord, Constant.LIST_DEFAULT_WORD_EXCEPTION, Constant.LIST_DEFAULT_CHARACTER_EXCEPTION)),
            subtitle: Text(penduBean.category1),

          ))
              .toList(),
        ),
    );
  }

}
