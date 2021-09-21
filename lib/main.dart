import 'package:flutter/material.dart';

import 'aircraft_choice_page.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: InstajetTheme.light,
      home: AircraftChoicePage(
          supportPhoneNumber: 'supportPhoneNumber',
          termsAndConditionsLink: 'termsAndConditionsLink'),
    );
  }
}
