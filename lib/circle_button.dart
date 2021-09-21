import 'package:flutter/material.dart';

import 'colors.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final double iconSize;

  const CircleButton({
    required this.icon,
    required this.onPressed,
    this.size = 36,
    this.iconSize = 36,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      type: MaterialType.transparency,
      child: Ink(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: InstajetColors.darkGrey,
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(1000)),
          onTap: onPressed,
          child: Center(
            child: Icon(
              icon,
              size: iconSize,
              color: InstajetColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
