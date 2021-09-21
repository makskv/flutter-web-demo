import 'package:flutter/material.dart';
import 'package:web_test/gradient_text.dart';
import 'package:web_test/responsive_widget.dart';

import 'colors.dart';

class BigTicket extends StatelessWidget {
  final String fromCode;
  final String toCode;
  final String fromCity;
  final String toCity;
  final String departureTime;
  final String returnTime;
  final bool withDarkFilter;

  late final Color secondRowItemsColor;
  late final Color thirdRowItemsColor;
  late final Color fourthRowItemsColor;
  late final Color middleItemColor;
  late final Color borderColor;

  BigTicket({
    required this.fromCode,
    required this.toCode,
    required this.fromCity,
    required this.toCity,
    required this.departureTime,
    required this.returnTime,
    this.withDarkFilter = false,
  }) : super() {
    if (withDarkFilter) {
      secondRowItemsColor = const Color(0xFF666666);
      thirdRowItemsColor = const Color(0xFF666666);
      fourthRowItemsColor = const Color(0xFF666666);
      middleItemColor = InstajetColors.lightGrey;
      borderColor = Colors.white10;
    } else {
      secondRowItemsColor = InstajetColors.white;
      thirdRowItemsColor = InstajetColors.lightGrey;
      fourthRowItemsColor = InstajetColors.lightGrey;
      middleItemColor = InstajetColors.white;
      borderColor = InstajetColors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cityLabelWidth = MediaQuery.of(context).size.width * (90 / 375);
    return ResponsiveWidget(
      mobile: Container(
        height: 174,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  fromCode,
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: secondRowItemsColor,
                      ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: cityLabelWidth,
                  child: Text(
                    fromCity,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: thirdRowItemsColor,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 42),
                Text(
                  departureTime,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: fourthRowItemsColor,
                      ),
                ),
                const Spacer(),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                VerticalDivider(
                  color: borderColor,
                  thickness: 1,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: borderColor),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.airplanemode_active,
                    size: 28,
                    color: middleItemColor,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                Text(
                  toCode,
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: secondRowItemsColor,
                      ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: cityLabelWidth,
                  alignment: Alignment.centerRight,
                  child: Text(
                    toCity,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: thirdRowItemsColor,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 42),
                Text(
                  returnTime,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: fourthRowItemsColor,
                      ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
      tablet: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientText(
              text: '$fromCode -> $toCode',
              textStyle: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: 60,
                  ),
              gradient: InstajetColors.linearGreyToWhite,
            ),
            const SizedBox(height: 48),
            Text(
              '$departureTime - $returnTime',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: InstajetColors.lightGrey,
                    fontWeight: FontWeight.w400,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
