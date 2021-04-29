import 'dart:math';

class RandomUtils {
  static Random random = new Random();

  static int randomInt(int max) {
    return random.nextInt(max);
  }

  static int randomIntMinMax(int min, int max) {
    int result = random.nextInt(max);
    while (result <= min) {
      result = random.nextInt(max);
    }
    return result;
  }
}
