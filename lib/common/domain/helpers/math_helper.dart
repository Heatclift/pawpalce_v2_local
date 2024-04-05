import 'dart:math';

class MathHelper {
  static int randomNumber(int min, int max) =>
      min + Random().nextInt(max - min);
}
