import 'dart:io';

import 'package:flutter/material.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/PenduUtils.dart';
import 'package:peggy_pendu/utils/managers/saveManager.dart';
import 'package:peggy_pendu/utils/stringUtils.dart';
import 'package:peggy_pendu/widgets/TextKey.dart';
import 'package:peggy_pendu/widgets/keyboard.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  PenduBean penduBean;
  List<String> listKey = List.of(Constant.LIST_DEFAULT_CHARACTER_EXCEPTION);
  int chance = 6;
  Keyboard _keyboard;

  @override
  void initState() {
    super.initState();
    _keyboard = Keyboard(_textInputHandler);
  }

  void _textInputHandler(String key) {
    if (!listKey.contains(key)) {
      setState(() {
        listKey.add(key);
        _keyboard.updateListKey(key, StringUtils.calculateContains(penduBean.frenchWord, key));
        chance =
            PenduUtils.calculateRemainingChance(penduBean.frenchWord, listKey);
        checkEnd();
      });
    }
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
          children: Constant.LIST_KEYBOARD_A_TO_M
              .map((key) => TextKey(
                    text: key,
                    onTextInput: _textInputHandler,
                  ))
              .toList()),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
          children: Constant.LIST_KEYBOARD_N_TO_Z
              .map((key) => TextKey(
                    text: key,
                    onTextInput: _textInputHandler,
                  ))
              .toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    penduBean = data[Constant.PARAM_KEY_PENDU_BEAN];
    print(listKey);

    return Scaffold(
      appBar: AppBar(
        title: Text("Game Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // Hint
            Container(
              child: Text("Hint: " + penduBean.category1),
            ),
            // Image & Letters
            Container(
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      // Image
                      child: Text("Chance: " + chance.toString()),
                    ),
                    Container(
                      // Letters
                      child: Text(
                          StringUtils.replaceWordWithUnderscoreWithException(
                              penduBean.frenchWord,
                              Constant.LIST_DEFAULT_WORD_EXCEPTION,
                              listKey)),
                    ),
                  ],
                ),
              ),
            ),
            // Keyboard
            Container(
                height: 160,
                color: Colors.blue,
                child: _keyboard,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkEnd() async {
    if (StringUtils.replaceWordWithUnderscoreWithException(penduBean.frenchWord,
                Constant.LIST_DEFAULT_WORD_EXCEPTION, listKey)
            .replaceAll(Constant.SPACE, "") ==
        penduBean.frenchWord.replaceAll(Constant.SPACE, "")) {
      SaveManager saveManager = SaveManager();
      await saveManager.updateSaveData(penduBean);
      _showWinDialog();
    } else if (this.chance == 0) {
      _showLoseDialog();
    }
  }

  Future<void> _showWinDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(penduBean.frenchWord),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text(penduBean.frenchDefinition),
                Text("?????????: " + penduBean.japaneseWord),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.popUntil(
                    context, ModalRoute.withName(Constant.pathListWordScreen));
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLoseDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("You Lose... "),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("????????????(*'???') "),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.popUntil(
                    context, ModalRoute.withName(Constant.pathListWordScreen));
              },
            ),
          ],
        );
      },
    );
  }
}
