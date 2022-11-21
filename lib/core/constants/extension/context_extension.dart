import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // X: double = 10

  //PADDING
  EdgeInsets get paddingLowAll => const EdgeInsets.all(8);
  EdgeInsets get paddingMediumAll => const EdgeInsets.all(16);
  EdgeInsets get paddingHighAll => const EdgeInsets.all(24);

  EdgeInsets get paddingX2Vertical => const EdgeInsets.symmetric(vertical: 5);
  EdgeInsets get paddingXVertical => const EdgeInsets.symmetric(vertical: 10);
  EdgeInsets get padding2xVertical => const EdgeInsets.symmetric(vertical: 20);

  EdgeInsets get paddingXHorizontal =>
      const EdgeInsets.symmetric(horizontal: 10);
  EdgeInsets get padding2xHorizontal =>
      const EdgeInsets.symmetric(horizontal: 20);

  EdgeInsets get paddingX2Top => const EdgeInsets.only(top: 5);
  EdgeInsets get paddingXTop => const EdgeInsets.only(top: 10);
  EdgeInsets get padding2xTop => const EdgeInsets.only(top: 20);

  EdgeInsets get paddingX2Bottom => const EdgeInsets.only(bottom: 5);
  EdgeInsets get paddingXBottom => const EdgeInsets.only(bottom: 10);
  EdgeInsets get padding2xBottom => const EdgeInsets.only(bottom: 20);

  EdgeInsets get paddingX2Left => const EdgeInsets.only(left: 5);
  EdgeInsets get paddingXLeft => const EdgeInsets.only(left: 10);
  EdgeInsets get padding2xLeft => const EdgeInsets.only(left: 20);

  EdgeInsets get paddingXRight => const EdgeInsets.only(right: 10);
  EdgeInsets get padding2xRight => const EdgeInsets.only(right: 20);

  //SIZE
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;

  // HEIGHT- WIDTH
  double get hw5 => 5;
  double get hw10 => 10;
  double get hw20 => 20;
  double get hw30 => 30;
  double get hw50 => 50;
  double get hw100 => 100;
  double get hw200 => 200;

  // Value
  double get thicknessValue => 0.9;
}
