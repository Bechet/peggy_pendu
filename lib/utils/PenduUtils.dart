import 'package:peggy_pendu/utils/StringUtils.dart';

import 'Constant.dart';

class PenduUtils {
  static int calculateRemainingChance(String wordToFind, List<String> listOfCharacter) {
  int result = 0;
  final String loweredAndAlphabeticalWord = StringUtils.uppercaseAndReplaceWithAlphabetical(wordToFind);
  for (String character in listOfCharacter) {
    print("Character: " + character);
    print("Word to find: "+ wordToFind);
    print(loweredAndAlphabeticalWord.contains(character));
    if (!loweredAndAlphabeticalWord.contains(character) && !Constant.LIST_DEFAULT_CHARACTER_EXCEPTION.contains(character)) {
      result++;
    }
  }
  print(result);
  return Constant.MAX_CHANCE - result;
  }
}