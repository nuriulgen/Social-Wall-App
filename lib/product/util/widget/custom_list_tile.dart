import 'package:flutter/material.dart';
import 'package:flutter_social_wall/core/constants/extension/context_extension.dart';
import 'custom_network_image.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.imageUrl,
      this.icon,
      this.onPressed})
      : super(key: key);

  final String title;
  final String subTitle;
  final String imageUrl;
  final Icon? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: context.minLeadingWidthValue,
      contentPadding: EdgeInsets.zero,
      leading: CustomNetworkImage(imagePath: imageUrl),
      title: _title(context),
      subtitle: _subTitle(context),
      trailing: IconButton(
          onPressed: onPressed, icon: icon ?? const SizedBox.shrink()),
    );
  }

  Text _subTitle(BuildContext context) {
    return Text(
      subTitle,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w400),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(fontWeight: FontWeight.w400),
    );
  }
}
