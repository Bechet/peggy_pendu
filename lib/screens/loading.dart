import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/managers/csvManager.dart';
import 'package:peggy_pendu/utils/managers/saveManager.dart';
import 'package:peggy_pendu/utils/saveDataUtils.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List<SaveDataBean> _listSaveDataBean;

  Future<List<PenduBean>> loadCsv() {
    print("Loading Csv file...");
    CsvManager csvManager = CsvManager();
    return csvManager.convertWordCsvFileAsListPenduBean();
  }

  Future<List<SaveDataBean>> loadSaveDataFile() {
    print("Loading saveData file...");
    SaveManager saveManager = SaveManager();
    return saveManager.readSaveData();
  }

  Future<List<SaveDataBean>> loadSaveDataBean() async {
    final List<SaveDataBean> listSaveDataResult = [];
    final List<PenduBean> listPenduBean = await loadCsv();
    final List<SaveDataBean> listSaveDataBean = await loadSaveDataFile();
    for (PenduBean penduBean in listPenduBean) {
      SaveDataBean sdb = SaveDataUtils.searchFromPenduBean(listSaveDataBean, penduBean);
      if (sdb != null) {
        listSaveDataResult.add(sdb);
      } else {
        listSaveDataResult.add(SaveDataBean(penduBean: penduBean, clearTime: Constant.DEFAULT_CLEAR_TIME));
      }
    }
    return listSaveDataResult;
  }

  void loadAndGo() async{
    _listSaveDataBean = await loadSaveDataBean();
    print("OK");
    print(_listSaveDataBean);
  }

  @override
  void initState() {
    super.initState();
    loadAndGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.red,
          size: 80.0,
        )
      ),
    );
  }
}

