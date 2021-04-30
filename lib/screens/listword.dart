import 'package:flutter/material.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/stringUtils.dart';
import 'package:peggy_pendu/utils/randomUtils.dart';

class ListWord extends StatefulWidget {
  @override
  _ListWordState createState() => _ListWordState();
}

class _ListWordState extends State<ListWord> {
  final List<SaveDataBean> listSaveDataBean = [
    SaveDataBean(penduBean: new PenduBean(
        frenchWord: Constant.RANDOM,
        frenchDefinition: "This is the definition of the word",
        japaneseWord: "テスト",
        category1: "random"), clearTime: Constant.DEFAULT_CLEAR_TIME),
  SaveDataBean(penduBean: new PenduBean(
        frenchWord: "chat",
        frenchDefinition: "This is the definition of the word",
        japaneseWord: "テスト",
        category1: "Animal"), clearTime: Constant.DEFAULT_CLEAR_TIME),
  SaveDataBean(penduBean: new PenduBean(
        frenchWord: "Cuillère",
        frenchDefinition: "This is the definition of the 'another' word",
        japaneseWord: "テスト2",
        category1: "Arthur ! Arthur !!"), clearTime: Constant.DEFAULT_CLEAR_TIME),
  SaveDataBean(penduBean: new PenduBean(
        frenchWord: "terme avec espace",
        frenchDefinition: "This is the definition of the word",
        japaneseWord: "",
        category1: "Terme avec espace"), clearTime: Constant.DEFAULT_CLEAR_TIME),
  SaveDataBean(penduBean: new PenduBean(
        frenchWord: "terme'avec'apostrophes",
        frenchDefinition: "This is the definition of the composed word",
        japaneseWord: "テスト テスト ",
        category1: "terme'avec'apostrophes"), clearTime: Constant.DEFAULT_CLEAR_TIME),
  SaveDataBean(penduBean: new PenduBean(
        frenchWord: "çàéïè",
        frenchDefinition: "This is the definition of the composed word",
        japaneseWord: "テスト テスト ",
        category1: "çàéïè"), clearTime: Constant.DEFAULT_CLEAR_TIME),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a word"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: listSaveDataBean
            .map((saveDataBean) => ListTile(
                  title: Text(StringUtils.replaceWordWithUnderscoreWithException(
                      saveDataBean.penduBean.frenchWord, Constant.LIST_DEFAULT_WORD_EXCEPTION, Constant.LIST_DEFAULT_CHARACTER_EXCEPTION)),
                  subtitle: Text(saveDataBean.penduBean.category1),
                  onTap: (() => {
                    onWordPush(saveDataBean.penduBean)
                  }),
                ))
            .toList(),
      ),
    );
  }

  onWordPush(PenduBean penduBean) {
    PenduBean paramPenduBean = penduBean.frenchWord == Constant.RANDOM ? listSaveDataBean[RandomUtils.randomIntMinMax(0, listSaveDataBean.length)].penduBean : penduBean;
    Navigator.pushNamed(context, Constant.pathGameScreen, arguments: {
      Constant.PARAM_KEY_PENDU_BEAN: paramPenduBean
    });
  }
}
