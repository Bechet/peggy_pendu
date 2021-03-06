import 'package:flutter/material.dart';

class TextKey extends StatelessWidget {
  const TextKey({
    Key key,
    @required this.text,
    this.onTextInput,
    this.flex = 1,
    this.textColor,
    this.containerColor
  }) : super(key: key);
  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;
  final Color textColor;
  final Color containerColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          child: InkWell(
            onTap: () {
              onTextInput?.call(text);
            },
            child: Container(
              color: containerColor,
              child: Center(child: Text(
                  text)
              ),
            ),
          ),
        ),
      ),
    );
  }
}