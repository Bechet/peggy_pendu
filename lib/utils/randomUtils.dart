
import 'dart:math';

class RandomUtils {
  static Random random = new Random();

  static int randomInt(int max) {
    return random.nextInt(max);
  }
}