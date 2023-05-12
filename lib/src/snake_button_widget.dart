import 'package:flutter/material.dart';

import 'snake_button_controller.dart';
import 'snake_button_painter.dart';

class SnakeButton extends StatefulWidget {
  final Widget child;
  final SnakeButtonController controller;
  final Duration snakeAnimationDuration;
  final double snakeWidth;
  final Color snakeColor;
  final double borderRadius;

  const SnakeButton({
    required this.child,
    required this.controller,
    required this.snakeAnimationDuration,
    required this.snakeColor,
    this.borderRadius = 0,
    this.snakeWidth = 5.0,
    Key? key,
  }) : super(key: key);

  @override
  State<SnakeButton> createState() => _SnakeButtonState();
}

class _SnakeButtonState extends State<SnakeButton>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final ValueNotifier<bool> _buttonNotifier;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.snakeAnimationDuration,
    );

    widget.controller.animation = _animationController;

    _buttonNotifier = ValueNotifier(false);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _buttonNotifier.value = true;
      } else if (status == AnimationStatus.dismissed) {
        _buttonNotifier.value = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return CustomPaint(
          foregroundPainter: SnakeButtonPainter(
            animation: _animationController,
            borderRadius: widget.borderRadius,
            snakeColor: widget.snakeColor,
            snakeWidth: widget.snakeWidth,
          ),
          child: ValueListenableBuilder<bool>(
            valueListenable: _buttonNotifier,
            builder: (context, value, child) => AnimatedOpacity(
              opacity: value == true ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: widget.child,
            ),
          ),
        );
      });
}
