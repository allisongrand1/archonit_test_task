import 'dart:ui';

class ColorController {

  ColorController();

   Color  getRandomColor (int index){
    final int red = (index * 80) % 256;
   final int green = (index * 100) % 256;
   final int blue = (index * 200) % 256;

    return Color.fromARGB(255, red, green, blue).withValues(alpha: 0.1);
  }
}
