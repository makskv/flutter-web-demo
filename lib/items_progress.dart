import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'colors.dart';

class ItemsProgress extends StatelessWidget {
  ItemsProgress({
    required int currentItem,
    required int totalItemsCount,
    bool isBlurred = false,
  })  : _totalItemsCount = totalItemsCount,
        _currentItem = currentItem,
        _isBlurred = isBlurred,
        super() {
    assert(_totalItemsCount > 0);
    assert(_currentItem > 0);
    assert(_totalItemsCount >= _currentItem);
  }

  final int _currentItem;
  final int _totalItemsCount;
  final bool _isBlurred;

  @override
  Widget build(BuildContext context) {
    final badgeBackground = _isBlurred
        ? ClipRRect(
            borderRadius: BorderRadius.circular(18.5),
            child: Container(
              width: 59,
              height: 36,
              decoration: BoxDecoration(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(color: Colors.transparent),
              ),
            ),
          )
        : Container(
            width: 59,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.5),
              color: InstajetColors.darkGrey,
            ),
          );
    return Stack(
      alignment: Alignment.center,
      children: [
        badgeBackground,
        Text.rich(
          TextSpan(
            text: '$_currentItem',
            style: Theme.of(context).textTheme.subtitle1,
            children: [
              TextSpan(
                text: ' of $_totalItemsCount',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: InstajetColors.lightGrey,
                    ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
