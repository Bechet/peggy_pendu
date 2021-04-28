import 'package:flutter/material.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/StringUtils.dart';
import 'package:peggy_pendu/utils/randomUtils.dart';

class ListWord extends StatefulWidget {
  @override
  _ListWordState createState() => _ListWordState();
}

class _ListWordState extends State<ListWord> {
  final List<PenduBean> listPenduBean = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a word"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: listPenduBean
            .map((penduBean) => ListTile(
                  title: Text(StringUtils.replaceWordWithUnderscoreWithException(
                      penduBean.frenchWord, Constant.LIST_DEFAULT_WORD_EXCEPTION, Constant.LIST_DEFAULT_CHARACTER_EXCEPTION)),
                  subtitle: Text(penduBean.category1),
                  onTap: (() => {
                    onWordPush(penduBean)
                  }),
                ))
            .toList(),
      ),
    );
  }

  onWordPush(PenduBean penduBean) {
    PenduBean paramPenduBean = penduBean.frenchWord == Constant.RANDOM ? listPenduBean[RandomUtils.randomIntMinMax(0, listPenduBean.length)] : penduBean;
    Navigator.pushNamed(context, Constant.pathGameScreen, arguments: {
      Constant.PARAM_KEY_PENDU_BEAN: paramPenduBean
    });
  }
}
