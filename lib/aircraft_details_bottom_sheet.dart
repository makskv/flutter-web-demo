import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:web_test/breakpoints.dart';

import 'aircraft_card_list.dart';
import 'aircraft_description_image.dart';
import 'aircraft_description_item.dart';
import 'colors.dart';
import 'items_progress.dart';

const bottomSheetPadding = 16.0;

class AircraftDetailsBottomSheet extends StatefulWidget {
  const AircraftDetailsBottomSheet({
    Key? key,
    required this.imagesPath,
    required this.aircraft,
  }) : super(key: key);

  final List<String> imagesPath;
  final AircraftEntity aircraft;

  @override
  _AircraftDetailsBottomSheetState createState() =>
      _AircraftDetailsBottomSheetState();
}

class _AircraftDetailsBottomSheetState
    extends State<AircraftDetailsBottomSheet> {
  int _currentImageIndex = 1;

  void _handleVisibilityInfo(double visibleFraction, int imageIndex) {
    if (visibleFraction > 0.5) {
      setState(() {
        _currentImageIndex = imageIndex + 1;
      });
    }
  }

  String _getAircraftTypeLabel() {
    return aircraftTypeToLongString(widget.aircraft.type);
  }

  double calculateWidthFactor(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < Breakpoints.kTablet) {
      return 1;
    } else {
      return 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: calculateWidthFactor(context),
      heightFactor: 0.96,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bottomSheetPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 480),
              height: 4,
              width: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: InstajetColors.white,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              _getAircraftTypeLabel(),
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    color: InstajetColors.lightGrey,
                  ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: MediaQuery.of(context).size.height * 285 / 907,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ListView.separated(
                    itemCount: widget.imagesPath.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) => VisibilityDetector(
                      key: Key('$index'),
                      onVisibilityChanged: (visibilityInfo) =>
                          _handleVisibilityInfo(
                        visibilityInfo.visibleFraction,
                        index,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: AircraftDescriptionImage(
                          imagePath: widget.imagesPath[index],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 18,
                    child: ItemsProgress(
                      isBlurred: true,
                      currentItem: _currentImageIndex,
                      totalItemsCount: widget.imagesPath.length,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
                  color: InstajetColors.darkGrey,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListView.separated(
                  itemCount: widget.aircraft.descriptions.length,
                  separatorBuilder: (_, __) => const Divider(
                    height: 1,
                    thickness: 1,
                    color: InstajetColors.white10,
                  ),
                  itemBuilder: (context, index) => AircraftDescriptionItem(
                    description: widget.aircraft.descriptions[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}
