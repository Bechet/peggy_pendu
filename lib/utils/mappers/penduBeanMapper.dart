import 'package:peggy_pendu/beans/penduBean.dart';

class PenduBeanMapper {
  static List<PenduBean> convertListListDynamicIntoListBeans(
      List<List<dynamic>> listListDynamic) {
    List<PenduBean> listPenduBeans = [];
    listPenduBeans.addAll(listListDynamic
        .map((listDynamic) => convertListDynamicIntoBean(listDynamic))
        .toList());
    return listPenduBeans;
  }

  static PenduBean convertListDynamicIntoBean(List<dynamic> listDynamic) {
    PenduBean penduBean = PenduBean();
    int index = 0;
    penduBean.article = listDynamic[index++];
    penduBean.frenchWord = listDynamic[index++];
    penduBean.level = listDynamic[index++];
    penduBean.category1 = listDynamic[index++];
    penduBean.category2 = listDynamic[index++];
    penduBean.japaneseWord = listDynamic[index++];
    return penduBean;
  }
}
