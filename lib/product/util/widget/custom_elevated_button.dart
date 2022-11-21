import 'package:flutter/material.dart';
import '../../../core/constants/extension/color_extension.dart';
import '../../../core/constants/extension/context_extension.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.color})
      : super(key: key);

  final String title;
  final Color color;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _buttonStyle(context),
      onPressed: onPressed,
      child: _elevatedButtonTitle(context),
    );
  }

  Text _elevatedButtonTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .subtitle2
          ?.copyWith(color: context.black, fontWeight: FontWeight.bold),
    );
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(context.hw20)));
  }
}
