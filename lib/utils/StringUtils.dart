import 'package:peggy_pendu/utils/Constant.dart';

class StringUtils {

  static String replaceWordWithUnderscore(String s, List<String> listCharException) {
    String resultString = "";
    if (s != null) {
      for (int indexChar = 0; indexChar<s.length; indexChar++) {
        if (listCharException.contains(s[indexChar])) {
          resultString += s[indexChar];
        } else {
          resultString += Constant.UNDERSCORE;
        }
        resultString += Constant.SPACE;
      }
    }
    return resultString;
  }

  static String replaceWordWithUnderscoreWithException(String s, List<String> listWordException, List<String> listCharException) {
    if (listWordException.contains(s)) {
      return s;
    }
    return replaceWordWithUnderscore(s, listCharException);
  }

}