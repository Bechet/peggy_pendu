import 'package:csv/csv.dart';
import 'package:peggy_pendu/beans/penduBean.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/mappers/penduBeanMapper.dart';

class CsvManager {
  /// Reads pendu words csv file and converts into List of PenduBean
  Future<List<PenduBean>> convertWordCsvFileAsListPenduBean() async {
    final rootBundleLoadString = await rootBundle.loadString(Constant.PATH_WORDS_CSV_FILE);
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter(eol: Constant.LINE_BREAK, fieldDelimiter: Constant.CVS_SPLITTER).convert(rootBundleLoadString);
    List<PenduBean> listPenduBeans = PenduBeanMapper.convertListListDynamicIntoListBeans(rowsAsListOfValues);
    print(listPenduBeans);
    return listPenduBeans;
  }
}
