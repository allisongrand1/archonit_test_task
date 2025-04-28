import 'dart:math';
import 'dart:ui';

class ColorController {
  final Random random;

  ColorController() : random = Random();

  Color get getRandomColor {
    final int red = random.nextInt(256);
    final int green = random.nextInt(256);
    final int blue = random.nextInt(256);

    return Color.fromARGB(255, red, green, blue).withValues(alpha: 0.1);
  }
}
