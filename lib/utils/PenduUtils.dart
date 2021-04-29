import 'package:peggy_pendu/beans/penduBean.dart';
import 'package:peggy_pendu/utils/stringUtils.dart';

import 'Constant.dart';

class PenduUtils {
  static int calculateRemainingChance(
      String wordToFind, List<String> listOfCharacter) {
    int result = 0;
    final String loweredAndAlphabeticalWord =
        StringUtils.uppercaseAndReplaceWithAlphabetical(wordToFind);
    for (String character in listOfCharacter) {
      if (!loweredAndAlphabeticalWord.contains(character) &&
          !Constant.LIST_DEFAULT_CHARACTER_EXCEPTION.contains(character)) {
        result++;
      }
    }
    return Constant.MAX_CHANCE - result;
  }

  static String convertBeanIntoCsvLine(PenduBean penduBean) {
    StringBuffer sb = StringBuffer();
    sb.write(penduBean.article);
    sb.write(Constant.CVS_SPLITTER);
    sb.write(penduBean.frenchWord);
    sb.write(Constant.CVS_SPLITTER);
    sb.write(penduBean.level);
    sb.write(Constant.CVS_SPLITTER);
    sb.write(penduBean.category1);
    sb.write(Constant.CVS_SPLITTER);
    sb.write(penduBean.category2);
    sb.write(Constant.CVS_SPLITTER);
    sb.write(penduBean.japaneseWord);
    sb.write(Constant.CVS_SPLITTER);
    return sb.toString();
  }
}
