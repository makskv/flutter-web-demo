import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'aircraft_card.dart';
import 'aircraft_choice_page.dart';
import 'aircraft_details_bottom_sheet.dart';
import 'colors.dart';

class AircraftCardList extends StatelessWidget {
  const AircraftCardList(
      {Key? key,
      required String termsAndConditionsLink,
      required String supportPhoneNumber})
      : _termsAndConditionsLink = termsAndConditionsLink,
        _supportPhoneNumber = supportPhoneNumber,
        super(key: key);

  final String _termsAndConditionsLink;
  final String _supportPhoneNumber;

  void _showAircraftDetailsBottomSheet(
    BuildContext context,
    AircraftEntity aircraft,
  ) {
    final aircraftImagesPath = _getImagesForAircraftType(aircraft.type);
    showModalBottomSheet(
      barrierColor: InstajetColors.black.withOpacity(0.5),
      backgroundColor: InstajetColors.black.withOpacity(0.5),
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => SafeArea(
        child: AircraftDetailsBottomSheet(
          imagesPath: aircraftImagesPath,
          aircraft: aircraft,
        ),
      ),
    );
  }

  String _getAircraftPrice({
    required Map<AircraftFlightCostEntity, AircraftEntity> aircraftOverviews,
    required int index,
    required Currency currency,
  }) {
    if (aircraftOverviews.isEmpty) {
      return 'No aircrafts provided';
    }
    final flightCost = aircraftOverviews.keys.elementAt(index).cost;

    final flightPrice = getPriceValueWithUserCurrency(flightCost, currency);
    final priceLabel = getPriceLabelByCurrency(currency, flightPrice);
    return priceLabel;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: aircraftBadgeHeight / 2),
      shrinkWrap: true,
      itemCount: aircraftOverviews.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: 16),
      itemBuilder: (context, index) {
        final aircraft = aircraftOverviews.values.elementAt(index);
        final fullDescription = aircraft.descriptions
            .firstWhere((description) => description.subtitle != null);
        return AirCraftCard(
          image: Image.asset(
            'assets/images/aircraft-models/${describeEnum(aircraft.type)}.png',
            fit: BoxFit.cover,
          ),
          hasBadge: aircraft.isLuxury,
          price: _getAircraftPrice(
            aircraftOverviews: aircraftOverviews,
            index: index,
            currency: Currency.usd,
          ),
          aircraftType: aircraftTypeToLongString(aircraft.type),
          onDetailsPressed: () =>
              _showAircraftDetailsBottomSheet(context, aircraft),
          description: fullDescription.title,
          descriptionSubtitle: fullDescription.subtitle!,
          onConfirmButtonPressed: () {},
          cardColor: InstajetColors.darkGrey,
          buttonColor: InstajetColors.lightBlue,
        );
      },
    );
  }
}

String aircraftTypeToLongString(AircraftType aircraftType) {
  switch (aircraftType) {
    case AircraftType.veryLight:
      return 'Very light jet';
    case AircraftType.light:
      return 'Light jet';
    case AircraftType.midSize:
      return 'Midsize jet';
    case AircraftType.superMid:
      return 'Super-mid jet';
    case AircraftType.large:
      return 'Large jet';
    default:
      throw UnimplementedError('Unknown AircraftType type');
  }
}

enum AircraftType {
  veryLight,
  light,
  midSize,
  superMid,
  large,
}

final aircraftOverviews = <AircraftFlightCostEntity, AircraftEntity>{
  AircraftFlightCostEntity(
    aircraftType: AircraftType.veryLight,
    cost: CostEntity(
      usd: 11111,
      eur: 11111,
      gbp: 11111,
      chf: 11111,
      aud: 11111,
    ),
  ): AircraftEntity(
    type: AircraftType.veryLight,
    descriptions: [
      DescriptionEntity(title: 'Title', subtitle: 'Looooooooooooooong subtitle')
    ],
    isLuxury: false,
  ),
  AircraftFlightCostEntity(
    aircraftType: AircraftType.light,
    cost: CostEntity(
      usd: 11111,
      eur: 11111,
      gbp: 11111,
      chf: 11111,
      aud: 11111,
    ),
  ): AircraftEntity(
    type: AircraftType.light,
    descriptions: [
      DescriptionEntity(title: 'Title', subtitle: 'Looooooooooooooong subtitle')
    ],
    isLuxury: false,
  ),
  AircraftFlightCostEntity(
    aircraftType: AircraftType.midSize,
    cost: CostEntity(
      usd: 11111,
      eur: 11111,
      gbp: 11111,
      chf: 11111,
      aud: 11111,
    ),
  ): AircraftEntity(
    type: AircraftType.midSize,
    descriptions: [
      DescriptionEntity(title: 'Title', subtitle: 'Looooooooooooooong subtitle')
    ],
    isLuxury: false,
  ),
  AircraftFlightCostEntity(
    aircraftType: AircraftType.superMid,
    cost: CostEntity(
      usd: 11111,
      eur: 11111,
      gbp: 11111,
      chf: 11111,
      aud: 11111,
    ),
  ): AircraftEntity(
    type: AircraftType.superMid,
    descriptions: [
      DescriptionEntity(title: 'Title', subtitle: 'Looooooooooooooong subtitle')
    ],
    isLuxury: true,
  ),
  AircraftFlightCostEntity(
    aircraftType: AircraftType.large,
    cost: CostEntity(
      usd: 11111,
      eur: 11111,
      gbp: 11111,
      chf: 11111,
      aud: 11111,
    ),
  ): AircraftEntity(
    type: AircraftType.large,
    descriptions: [
      DescriptionEntity(title: 'Title', subtitle: 'Looooooooooooooong subtitle')
    ],
    isLuxury: true,
  )
};

class AircraftFlightCostEntity extends Equatable {
  const AircraftFlightCostEntity({
    required this.aircraftType,
    required this.cost,
  });

  final AircraftType aircraftType;
  final CostEntity cost;

  @override
  List<Object?> get props => [
        aircraftType,
        cost,
      ];
}

class CostEntity extends Equatable {
  const CostEntity({
    required this.usd,
    required this.eur,
    required this.gbp,
    required this.chf,
    required this.aud,
  });

  final double usd;
  final double eur;
  final double gbp;
  final double chf;
  final double aud;

  @override
  List<Object?> get props => [
        usd,
        eur,
        gbp,
        chf,
        aud,
      ];
}

class AircraftEntity extends Equatable {
  final AircraftType type;
  final List<DescriptionEntity> descriptions;
  final bool isLuxury;

  AircraftEntity({
    required this.type,
    required this.descriptions,
    required this.isLuxury,
  });

  @override
  List<Object?> get props => [
        type,
        descriptions,
        isLuxury,
      ];
}

class DescriptionEntity extends Equatable {
  final String title;
  final String? subtitle;
  final bool bolded;

  DescriptionEntity({
    required this.title,
    required this.subtitle,
    this.bolded = false,
  });

  @override
  List<Object?> get props => [
        title,
        subtitle,
        bolded,
      ];
}

List<String> _getImagesForAircraftType(AircraftType type) {
  // TODO: should be change for urls, when will be provided
  switch (type) {
    case AircraftType.veryLight:
      return [
        'assets/images/slight-ext.png',
        'assets/images/slight-int.png',
      ];
    case AircraftType.light:
      return [
        'assets/images/light-ext.png',
        'assets/images/light-int.png',
      ];
    case AircraftType.midSize:
      return [
        'assets/images/mid-ext.png',
        'assets/images/mid-int.png',
      ];
    case AircraftType.superMid:
      return [
        'assets/images/smid-ext.png',
        'assets/images/smid-int.png',
      ];
    case AircraftType.large:
      return [
        'assets/images/large-ext.png',
        'assets/images/large-int.png',
      ];
    default:
      throw UnimplementedError('Unknown AircraftType $type provided');
  }
}

double getPriceValueWithUserCurrency(CostEntity cost, Currency currency) {
  switch (currency) {
    case Currency.usd:
      return cost.usd;
    case Currency.eur:
      return cost.eur;
    case Currency.gbp:
      return cost.gbp;
    case Currency.chf:
      return cost.chf;
    case Currency.aud:
      return cost.aud;
    default:
      throw UnimplementedError('Unknown Currency provided');
  }
}

String getPriceLabelByCurrency(Currency chosenCurrency, double priceValue) {
  return _getPriceFormat(chosenCurrency).format(priceValue);
}

NumberFormat _getPriceFormat(Currency currency) {
  switch (currency) {
    case Currency.usd:
      return NumberFormat.currency(
        customPattern: '\$#,##0',
        decimalDigits: 0,
      );
    case Currency.eur:
      return NumberFormat.currency(
        customPattern: '€#,##0.00',
        decimalDigits: 0,
      );
    case Currency.gbp:
      return NumberFormat.currency(
        customPattern: '£#,##0.00',
        decimalDigits: 0,
      );
    case Currency.chf:
      return NumberFormat.currency(
        customPattern: '₣#,##0.00',
        decimalDigits: 0,
      );
    case Currency.aud:
      return NumberFormat.currency(
        customPattern: '\$#,##0.00',
        decimalDigits: 0,
      );
    default:
      throw UnimplementedError('Unknown $currency currency provided');
  }
}
