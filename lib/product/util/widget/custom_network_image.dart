import 'package:flutter/material.dart';
import 'package:flutter_social_wall/core/constants/extension/context_extension.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({Key? key, required this.imagePath})
      : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.hw20,
      backgroundImage: NetworkImage(imagePath),
      backgroundColor: Colors.transparent,
    );
  }
}
