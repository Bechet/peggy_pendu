import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/PenduUtils.dart';

class SaveDataUtils {
  static String convertBeanIntoCsvLine(SaveDataBean saveDataBean) {
    StringBuffer sb = StringBuffer();
    sb.write(PenduUtils.convertBeanIntoCsvLine(saveDataBean.penduBean));
    sb.write(Constant.CVS_SPLITTER);
    sb.write(saveDataBean.clearTime);
    print(sb.toString());
    return sb.toString();
  }

  static SaveDataBean searchFromPenduBean(List<SaveDataBean> listSaveDataBean, PenduBean penduBean) {
    List<SaveDataBean> listSaveDataBeanFiltered = listSaveDataBean.where((saveDataBean) => saveDataBean != null && saveDataBean.penduBean != null && saveDataBean.penduBean.frenchWord == penduBean.frenchWord).toList();
    return listSaveDataBeanFiltered.isNotEmpty ? listSaveDataBeanFiltered[0]:null;
  }
}
