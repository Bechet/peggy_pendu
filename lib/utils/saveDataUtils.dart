import 'package:peggy_pendu/beans/saveDataBean.dart';
import 'package:peggy_pendu/utils/Constant.dart';
import 'package:peggy_pendu/utils/PenduUtils.dart';

class SaveDataUtils {
  static String convertBeanIntoCsvLine(SaveDataBean saveDataBean) {
    StringBuffer sb = StringBuffer();
    sb.write(PenduUtils.convertBeanIntoCsvLine(saveDataBean.penduBean));
    sb.write(Constant.CVS_SPLITTER);
    sb.write(saveDataBean.clearTime);
    return sb.toString();
  }
}
