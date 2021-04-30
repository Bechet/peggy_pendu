import 'package:peggy_pendu/beans/levelBean.dart';

class Constant {
  static const pathListLevelScreen='/listLevel';
  static const pathHomeScreen='/home';
  static const pathOptionScreen='/option';
  static const pathCreditScreen='/credit';
  static const pathListWordScreen='/listWord';
  static const pathGameScreen='/game';
  static const pathTestScreen='/test';
  static const pathLoadingScreen='/loading';
  static const pathLoadingTestScreen='/loadingTest';

  static const comingSoon="Coming Soon :)";

  static const RANDOM="Random";

  static const UNDERSCORE = "_";
  static const SPACE=" ";
  static const APOSTROPHE="'";
  static const String CVS_SPLITTER = ';';
  static const String LINE_BREAK = '\n';

  static const List<String> LIST_KEYBOARD_A_TO_M=["A","B","C","D","E","F","G","H","I","J","K","L","M"];
  static const List<String> LIST_KEYBOARD_N_TO_Z=["N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

  static const List<String> LIST_DEFAULT_CHARACTER_EXCEPTION = [Constant.APOSTROPHE, Constant.SPACE];
  static const List<String> LIST_DEFAULT_WORD_EXCEPTION = [Constant.RANDOM];

  static const PARAM_KEY_PENDU_BEAN = 'penduBean';
  static const int MAX_CHANCE = 6;
  static const int DEFAULT_CLEAR_TIME = 0;

  static const PATH_WORDS_CSV_FILE = 'assets/words.csv';
}