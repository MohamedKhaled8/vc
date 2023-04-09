import 'package:flutter/material.dart';

class AnimatedScaleTapDown_Up extends StatelessWidget {
  final double initScale;
  final VoidCallback onTapDownFunx;
  final VoidCallback onTapUpFunx;
  final Widget child;
  final Duration? animationSpeed;
  const AnimatedScaleTapDown_Up({
    super.key,
    required this.child,
    this.initScale = 1,
    required this.onTapDownFunx,
    required this.onTapUpFunx,
    this.animationSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: initScale,
      duration: animationSpeed == null
          ? const Duration(milliseconds: 1500)
          : animationSpeed!,
      child: GestureDetector(
        onTapDown: (tap) {
          onTapDownFunx;
        },
        onTapUp: (tap) {
          onTapUpFunx;
        },
        onTapCancel: () {
          onTapDownFunx;
        },
        child: child,
      ),
    );
  }
}
