import 'package:flutter/material.dart';
import 'package:web_test/breakpoints.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Breakpoints.kTablet) {
          return mobile;
        } else if (constraints.maxWidth >= Breakpoints.kTablet &&
            constraints.maxWidth <= Breakpoints.kDesktop) {
          return tablet ?? mobile;
        } else
          return desktop ?? tablet ?? mobile;
      },
    );
  }
}
