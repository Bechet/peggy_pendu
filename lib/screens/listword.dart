import 'package:flutter/material.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/StringUtils.dart';

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
        hint1: "random"),
    new PenduBean(
        frenchWord: "chat",
        frenchDefinition: "This is the definition of the word",
        japaneseWord: "テスト",
        hint1: "Animal"),
    new PenduBean(
        frenchWord: "cuillère",
        frenchDefinition: "This is the definition of the 'another' word",
        japaneseWord: "テスト2",
        hint1: "Arthur ! Arthur !!"),
    new PenduBean(
        frenchWord: "terme avec espace",
        frenchDefinition: "This is the definition of the word",
        japaneseWord: "",
        hint1: "Terme avec espace"),
    new PenduBean(
        frenchWord: "terme'avec'apostrophes",
        frenchDefinition: "This is the definition of the composed word",
        japaneseWord: "テスト テスト ",
        hint1: "terme'avec'apostrophes"),
    new PenduBean(
        frenchWord: "çàéïè",
        frenchDefinition: "This is the definition of the composed word",
        japaneseWord: "テスト テスト ",
        hint1: "çàéïè"),
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
                  subtitle: Text(penduBean.hint1),
                  onTap: (() => {
                    Navigator.pushNamed(context, Constant.pathGameScreen, arguments: {
                      Constant.PARAM_KEY_PENDU_BEAN: penduBean
                    })
                  }),
                ))
            .toList(),
      ),
    );
  }
}
