import 'package:flutter/material.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/managers/saveManager.dart';
import 'package:peggy_pendu/utils/stringUtils.dart';
import 'package:peggy_pendu/utils/randomUtils.dart';

class ListWord extends StatefulWidget {
  @override
  _ListWordState createState() => _ListWordState();
}

class _ListWordState extends State<ListWord> {
  List<SaveDataBean> _listSaveDataBean;
  Future<int> _loader;

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    _loader = load(data[Constant.PARAM_LEVEL]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose a word"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: FutureBuilder(
          future: _loader,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                children: _listSaveDataBean
                    .map((saveDataBean) => ListTile(
                          title: Text(StringUtils
                              .replaceWordWithUnderscoreWithException(
                                  saveDataBean.penduBean.frenchWord,
                                  Constant.LIST_DEFAULT_WORD_EXCEPTION,
                                  Constant.LIST_DEFAULT_CHARACTER_EXCEPTION)),
                          subtitle: saveDataBean.penduBean.frenchWord == Constant.RANDOM ?
                              Text(''):
                              Text('Hint: ${saveDataBean.penduBean.category1}') ,
                          trailing: saveDataBean.penduBean.frenchWord == Constant.RANDOM ?
                              Text(''):
                              Text("Clear time: " + saveDataBean.clearTime.toString()),
                          onTap: (() => {onWordPush(saveDataBean.penduBean)}),
                        ))
                    .toList(),
              );
            }
          },
        ));
  }

  onWordPush(PenduBean penduBean) {
    PenduBean paramPenduBean = penduBean.frenchWord == Constant.RANDOM
        ? _listSaveDataBean[
                RandomUtils.randomIntMinMax(0, _listSaveDataBean.length)]
            .penduBean
        : penduBean;

    Navigator.pushNamed(context, Constant.pathGameScreen,
            arguments: {Constant.PARAM_KEY_PENDU_BEAN: paramPenduBean})
        .then((value) => setState(() {}));
  }

  Future<int> load(String level) async {
    SaveManager saveManager = SaveManager();
    print('level: $level');
    _listSaveDataBean = [SaveDataBean(penduBean: PenduBean(frenchWord: Constant.RANDOM))];
    _listSaveDataBean.addAll(await saveManager.loadDataWithSaveFileFilteredByLevel(level));
    if (_listSaveDataBean.length == 1) {
      _listSaveDataBean.removeAt(0);
    }
    return 42;
  }
}
