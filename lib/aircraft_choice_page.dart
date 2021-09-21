import 'package:flutter/material.dart';
import 'package:web_test/breakpoints.dart';

import 'aircraft_card_list.dart';
import 'big_ticket.dart';
import 'circle_button.dart';
import 'instajet_app_bap.dart';

enum AccountStatus {
  registrationInProgress,
  paymentPending,
  verificationPending,
  verified,
  blocked,
}

enum Currency {
  usd,
  eur,
  gbp,
  chf,
  aud,
}

const aircraftBadgeHeight = 32.0;

class AircraftChoicePage extends StatefulWidget {
  const AircraftChoicePage({
    Key? key,
    required String supportPhoneNumber,
    required String termsAndConditionsLink,
  })  : _supportPhoneNumber = supportPhoneNumber,
        _termsAndConditionsLink = termsAndConditionsLink,
        super(key: key);

  final String _supportPhoneNumber;
  final String _termsAndConditionsLink;

  @override
  _AircraftChoicePageState createState() => _AircraftChoicePageState();
}

class _AircraftChoicePageState extends State<AircraftChoicePage> {
  CrossAxisAlignment getPageHorizontalAlignment(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if(width < Breakpoints.kTablet) {
      return CrossAxisAlignment.center;
    } else {
      return CrossAxisAlignment.start;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: getPageHorizontalAlignment(context),
          children: [
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: InstajetAppBar(
                leading: CircleButton(
                  icon: Icons.arrow_back_outlined,
                  onPressed: () => _onBackPressed(context),
                ),
                trailing: Row(
                  children: [
                    CircleButton(
                        size: 36,
                        icon: Icons.attach_money,
                        iconSize: 26,
                        onPressed: () {},
                      ),
                    const SizedBox(width: 10),
                   CircleButton(
                        size: 36,
                        icon: Icons.qr_code,
                        iconSize: 26,
                        onPressed: () {},
                       ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BigTicket(
                  fromCode: 'fromCode',
                  toCode: 'toCode',
                  fromCity: 'fromCity',
                  toCity: 'toCity',
                  departureTime: 'departureTime',
                  returnTime: 'returnTime',
                  withDarkFilter: true,
              ),
            ),
            const Spacer(),
            SizedBox(
              // 448 - card height, 812 - iphone 10 height,
              // + aircraftBadgeHeight / 2 - to avoid clipping badge "Luxury"
              height: MediaQuery.of(context).size.height * (448 / 812) +
                  aircraftBadgeHeight / 2,
              child: AircraftCardList(
                supportPhoneNumber: widget._supportPhoneNumber,
                termsAndConditionsLink: widget._termsAndConditionsLink,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }
}
