import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  Color get white => Colors.white;
  Color get black => Colors.black;
  Color get green => Colors.green;
  Color get transparent => Colors.transparent;

  Color get vanillaDrop => Colors.yellow.shade700;
  Color get heatherGrey => const Color(0xFF9D9EA3);
}
