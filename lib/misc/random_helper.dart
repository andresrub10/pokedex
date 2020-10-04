import 'dart:math';

class RandomHelper {
  static int getRandomInt(int max) {
    var rng = new Random();
    return rng.nextInt(max - 1) + 1;
  }
}
