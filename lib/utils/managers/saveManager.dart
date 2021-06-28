import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'package:peggy_pendu/utils/managers/csvManager.dart';
import 'package:peggy_pendu/utils/saveDataUtils.dart';
import 'package:peggy_pendu/utils/mappers/penduBeanMapper.dart';

import '../Constant.dart';

class SaveManager {
  List<SaveDataBean> listSaveDataBean;

  SaveManager();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/' + Constant.SAVE_FILE_NAME);
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

  /// Increase clear time or save the cleared bean
  Future<File> updateSaveData(PenduBean penduBean) async {
    bool found = false;
    if (listSaveDataBean == null || listSaveDataBean.isEmpty) {
      listSaveDataBean = await readSaveData();
    }
    for (SaveDataBean saveDataBean in listSaveDataBean) {
      if (saveDataBean.penduBean.frenchWord == penduBean.frenchWord) {
        found = true;
        // If we update the csv data file, we need to update the save data too
        saveDataBean.penduBean = penduBean;
        saveDataBean.clearTime += 1;
        print("Updating clear time");
      }
    }
    if (!found) {
      print("Adding new line into saveFile");
      listSaveDataBean.add(SaveDataBean(penduBean: penduBean, clearTime: 1));
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

  Future<List<SaveDataBean>> loadDataWithSaveFile() async {
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

  Future<List<SaveDataBean>> loadDataWithSaveFileFilteredByLevel(final String level) async {
    final List<SaveDataBean> listSaveDataBean = await loadDataWithSaveFile();
    return listSaveDataBean.where((saveDataBean) => saveDataBean.penduBean.level == level).toList();
  }

  Future<void> resetSaveFile() {
    return writeSaveData([]);
  }

}
