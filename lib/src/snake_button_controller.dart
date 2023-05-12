import 'package:flutter/animation.dart';

class SnakeButtonController {
  late AnimationController animation;

  void toggle() {
    if (animation.value == 0) {
      animation.forward();
    } else {
      animation.reverse();
    }
  }
}
