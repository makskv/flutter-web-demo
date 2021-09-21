import 'package:flutter/material.dart';
import 'package:web_test/breakpoints.dart';

import 'aircraft_card_badge.dart';
import 'colors.dart';
import 'gradient_text.dart';

class AirCraftCard extends StatelessWidget {
  const AirCraftCard({
    required this.image,
    required this.price,
    required this.aircraftType,
    required this.onDetailsPressed,
    required this.description,
    required this.descriptionSubtitle,
    required this.onConfirmButtonPressed,
    required this.buttonColor,
    required this.cardColor,
    this.hasBadge = false,
  });

  final Widget image;
  final String price;
  final String aircraftType;
  final VoidCallback onDetailsPressed;
  final String description;
  final String descriptionSubtitle;
  final VoidCallback onConfirmButtonPressed;
  final bool hasBadge;
  final Color buttonColor;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    final aircraftCard = (isHovered) => AircraftCardContainer(
      color: cardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Guaranteed reservation price',
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption
                          ?.copyWith(
                        color: InstajetColors.greyText,
                      ),
                    ),
                    GestureDetector(
                      onTap: onDetailsPressed,
                      child: const Icon(
                        Icons.details,
                        size: 28,
                        color: InstajetColors.grey,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  price,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _buildGradientText(
                  aircraftType,
                  context,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: AspectRatio(
              aspectRatio: 245 / 99,
              child: image,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        description,
                        style: Theme
                            .of(context)
                            .textTheme
                            .caption
                            ?.copyWith(
                          color: InstajetColors.greyText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        descriptionSubtitle,
                        style: Theme
                            .of(context)
                            .textTheme
                            .caption,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReserveButton(onConfirmButtonPressed: onConfirmButtonPressed, buttonColor: buttonColor),
              ),
              const SizedBox(height: 8),
            ],
          )
        ],
      ),
    );
    return AircraftCardWrapper(
      builder: (isHovered) => Stack(
        clipBehavior: Clip.none,
        children: [
          aircraftCard(isHovered),
          FractionalTranslation(
            translation: Offset(0, -0.5),
            child: hasBadge
                ? AircraftCardBadge(
              label: 'Luxury',
            )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientText(String text, BuildContext context) {
    return GradientText(
      text: text,
      textStyle: Theme
          .of(context)
          .textTheme
          .headline1,
      gradient: InstajetColors.linearGreyToWhite,
    );
  }
}

class ReserveButton extends StatelessWidget {
  const ReserveButton({
    Key? key,
    required this.onConfirmButtonPressed,
    required this.buttonColor,
  }) : super(key: key);

  final VoidCallback onConfirmButtonPressed;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onConfirmButtonPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(22),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(buttonColor),
        foregroundColor:
        MaterialStateProperty.all(InstajetColors.black),
        textStyle: MaterialStateProperty.all<TextStyle?>(
          Theme
              .of(context)
              .textTheme
              .headline3,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        child: const Text('Reserve'),
      ),
    );
  }
}

class AircraftCardWrapper extends StatefulWidget {
  const AircraftCardWrapper({Key? key, required this.builder})
      : super(key: key);

  final Widget Function(bool isHovered) builder;

  @override
  _AircraftCardWrapperState createState() => _AircraftCardWrapperState();
}

class _AircraftCardWrapperState extends State<AircraftCardWrapper> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hovered = Matrix4.identity()
      ..translate(0, -30, 0);
    final transform = isHovered ? hovered : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: transform,
        curve: Curves.bounceIn,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}

class AircraftCardContainer extends StatelessWidget {
  final Widget child;
  final Color color;

  const AircraftCardContainer({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  BoxConstraints getAircraftCardConstraints(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    if (width < Breakpoints.kMobile) {
      return BoxConstraints(
        maxWidth: width * (280 / 375),
        maxHeight: height * (448 / 812),
      );
    } else {
      return BoxConstraints(maxWidth: 280, maxHeight: 448);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: getAircraftCardConstraints(context),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: child,
    );
  }
}
