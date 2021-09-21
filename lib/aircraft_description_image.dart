import 'package:flutter/material.dart';
import 'package:web_test/responsive_widget.dart';

import 'aircraft_details_bottom_sheet.dart';

class AircraftDescriptionImage extends StatelessWidget {
  const AircraftDescriptionImage({
    required String imagePath,
    Key? key,
  })  : _imagePath = imagePath,
        super(key: key);

  final String _imagePath;

  @override
  Widget build(BuildContext context) {
    final image = Container(
      width: MediaQuery.of(context).size.width - 2 * bottomSheetPadding,
      child: Image.asset(_imagePath, fit: BoxFit.fill),
    );
    return ResponsiveWidget(
      mobile: image,
      tablet: AspectRatio(
        aspectRatio: 343 / 285,
        child: image,
      ),
    );
  }
}
