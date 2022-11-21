import 'package:flutter/material.dart';
import '../../../core/constants/extension/context_extension.dart';

import '../../../core/constants/extension/color_extension.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  final String title;

  final void Function()? onPressed;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
  bool isLight = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.heatherGrey,
      leading: _backButton(context),
      title: _title(context),
      centerTitle: true,
    );
  }

  IconButton _backButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: context.black,
        size: context.hw30,
      ),
      onPressed: () {},
    );
  }

  Text _title(BuildContext context) {
    return Text(
      widget.title,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(fontWeight: FontWeight.w400, color: context.black),
    );
  }
}
