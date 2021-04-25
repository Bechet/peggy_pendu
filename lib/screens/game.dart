import 'package:flutter/material.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/PenduUtils.dart';
import 'package:peggy_pendu/utils/StringUtils.dart';
import 'package:peggy_pendu/widgets/TextKey.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  PenduBean penduBean;
  List<String> listKey = List.of(Constant.LIST_DEFAULT_CHARACTER_EXCEPTION);
  int chance = 6;

  void _textInputHandler(String text) {
    print(text);
    if (!listKey.contains(text)) {
      setState(() {
        listKey.add(text);
        chance = PenduUtils.calculateRemainingChance(penduBean.frenchWord, listKey);
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
              child: Text("Hint: " +penduBean.hint1),
            ),
            // Image & Letters
            Container(
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        // Image
                      child: Text("Chance: "+chance.toString()),
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
              child: Column(
                // <-- Column
                children: [
                  buildRowOne(), // <-- Row
                  buildRowTwo(), // <-- Row
                  // buildRowThree(),  // <-- Row
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}