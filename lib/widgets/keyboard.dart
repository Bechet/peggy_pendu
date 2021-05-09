import 'package:flutter/material.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/widgets/TextKey.dart';

class Keyboard extends StatefulWidget {
  final Function _onKeyClick;
  final _KeyboardState _keyboardState = _KeyboardState();

  Keyboard(this._onKeyClick);

  @override
  _KeyboardState createState() => _keyboardState;

  void updateListKey(key, isOK) {
    _keyboardState.updateListKey(key, isOK);
  }
}

class _KeyboardState extends State<Keyboard> {
  List<String> listKeysOK = [];
  List<String> listKeysKO = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          buildRow(Constant.LIST_KEYBOARD_A_TO_M),
          buildRow(Constant.LIST_KEYBOARD_N_TO_Z),
        ],
      ),
    );
  }

  Expanded buildRow(final List<String> _listKeys) {
    return Expanded(
      child: Row(
          children: _listKeys
              .map((key) => TextKey(
                    text: key,
                    onTextInput: widget._onKeyClick,
                    containerColor: listKeysKO.contains(key)
                        ? Colors.red[700]
                        : listKeysOK.contains(key)
                            ? Colors.green[600]
                            : Colors.white,
                  ))
              .toList()),
    );
  }

  void updateListKey(final String key, final bool isOK) {
    print('key: $key');
    print("bla");
    setState(() {
      print("bla");
      if (key != null) {
        if (isOK && !listKeysOK.contains(key)) {
          print("Adding OK, key: $key");
          listKeysOK.add(key);
        } else if (!isOK && !listKeysKO.contains(key)) {
          print("Adding KO, key: $key");
          listKeysKO.add(key);
        } else {
          print("Oh no...");
        }
      }
    });
  }
}
