import 'package:flutter/material.dart';
import 'aircraft_card_list.dart';
import 'colors.dart';
import 'gradient_text.dart';

class AircraftDescriptionItem extends StatelessWidget {
  const AircraftDescriptionItem({
    required DescriptionEntity description,
    Key? key,
  })  : _description = description,
        super(key: key);

  final DescriptionEntity _description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildTitle(context),
        _buildSubtitle(context),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    if (_description.subtitle == null) {
      return SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          _description.subtitle!,
          style: Theme.of(context).textTheme.caption?.copyWith(
                color: InstajetColors.lightGrey,
              ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    if (_description.bolded) {
      return GradientText(
        text: _description.title,
        textStyle: Theme.of(context).textTheme.headline4,
        gradient: InstajetColors.linearWhiteToOrange,
      );
    }
    return Text(
      _description.title,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
