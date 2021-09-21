import 'package:flutter/material.dart';

import 'colors.dart';

const aircraftBadgeHeight = 32.0;

class AircraftCardBadge extends StatelessWidget {
  final String label;

  const AircraftCardBadge({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, top: 6, bottom: 6, right: 18),
      decoration: const BoxDecoration(
        gradient: InstajetColors.primaryGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(aircraftBadgeHeight / 2),
          topLeft: Radius.circular(aircraftBadgeHeight),
          topRight: Radius.circular(aircraftBadgeHeight / 2),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: InstajetColors.black,
            ),
      ),
    );
  }
}
