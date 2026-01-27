import 'package:flutter/animation.dart';

abstract class AppMotion {
  static const fast = Duration(milliseconds: 120);
  static const normal = Duration(milliseconds: 200);

  static const curve = Curves.easeOut;
}
