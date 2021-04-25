import 'package:flutter/material.dart';
import 'package:peggy_pendu/beans/levelBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';

class ListLevel extends StatefulWidget {
  @override
  _ListLevelState createState() => _ListLevelState();
}

class _ListLevelState extends State<ListLevel> {

  final List<LevelBean> listLevel = [
    new LevelBean(level: "A1.1", description: "Beginner level"),
    LevelBean(level: "A1", description: "Elementary level"),
    LevelBean(level: "A2", description: "Pre-intermediate level +"),
    LevelBean(level: "B1", description: "Low Intermediate level"),
    LevelBean(level: "B2", description: "Intermediate level"),
    LevelBean(level: "C1", description: "Advanced level"),
    LevelBean(level: "C2", description: "Very Advanced level")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a level"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: listLevel.map((levelBean) => ListTile(
          title: Text(levelBean.level),
          subtitle: Text(levelBean.description),
          onTap: (() => {
            Navigator.pushNamed(context, Constant.pathListWordScreen)
          }),
        )).toList(),
      ),
    );
  }
}
