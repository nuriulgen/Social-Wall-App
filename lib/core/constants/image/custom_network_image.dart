import 'package:flutter/material.dart';
import '../extension/context_extension.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({Key? key, required this.imagePath})
      : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.hw20,
      backgroundImage: NetworkImage(imagePath),
    );
  }
}
