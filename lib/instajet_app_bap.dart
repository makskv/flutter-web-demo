import 'package:flutter/material.dart';

class InstajetAppBar extends StatelessWidget {
  final Widget leading;
  final Widget center;
  final Widget trailing;

  InstajetAppBar({
    this.leading = const AppBarChildPlaceholder(),
    this.center = const SizedBox(),
    this.trailing = const AppBarChildPlaceholder(),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading,
            trailing,
          ],
        ),
        center,
      ],
    );
  }
}

class AppBarChildPlaceholder extends StatelessWidget {
  const AppBarChildPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
    );
  }
}
