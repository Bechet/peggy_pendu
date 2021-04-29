import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'file:///C:/Users/Leo/AndroidStudioProjects/peggy_pendu/lib/utils/saveDataUtils.dart';
import 'package:peggy_pendu/utils/mappers/penduBeanMapper.dart';

import '../Constant.dart';

class SaveManager {
  String fileName = "saveData.csv";
  List<SaveDataBean> listSaveDataBean;

  SaveManager({this.fileName});

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/' + fileName);
  }

  Future<List<SaveDataBean>> readSaveData() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();
      return convertFileContentToListSaveDataBean(contents);
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<File> writeSaveData(List<SaveDataBean> listSaveDataBean) async {
    final file = await _localFile;

    StringBuffer sb = StringBuffer();
    for (SaveDataBean saveDataBean in listSaveDataBean) {
      sb.writeln(SaveDataUtils.convertBeanIntoCsvLine(saveDataBean));
    }
    // Write the file
    return file.writeAsString(sb.toString());
  }

  Future<File> updateSaveData(SaveDataBean saveDataBeanToUpdate) async {
    bool found = false;
    if (listSaveDataBean == null || listSaveDataBean.isEmpty) {
      listSaveDataBean = await readSaveData();
    }
    for (SaveDataBean saveDataBean in listSaveDataBean) {
      if (saveDataBean.penduBean.frenchWord == saveDataBeanToUpdate.penduBean.frenchWord) {
        found = true;
        saveDataBean.clearTime = saveDataBeanToUpdate.clearTime;
        print("Updating clearTime");
      }
    }
    if (!found) {
      print("Adding new line into saveFile");
      listSaveDataBean.add(saveDataBeanToUpdate);
    }
    // Write the file
    return writeSaveData(listSaveDataBean);
  }

  List<SaveDataBean> convertFileContentToListSaveDataBean(final String content) {
    final List<SaveDataBean> listSaveDataBean = [];
    final List<String> lines = content.split(Constant.LINE_BREAK);
    if (lines != null && lines.isNotEmpty) {
      listSaveDataBean.addAll(lines.where((line) => line != null && line.isNotEmpty).map((line) => convertFileLineToSaveDataBean(line)).toList());
    }
    return listSaveDataBean;
  }

  SaveDataBean convertFileLineToSaveDataBean(String line) {
    List<String> listData = line.split(Constant.CVS_SPLITTER);
    PenduBean penduBean = PenduBeanMapper.convertListDynamicIntoBean(listData);
    return SaveDataBean(penduBean: penduBean, clearTime: int.parse(listData[listData.length-1]));
  }
}
