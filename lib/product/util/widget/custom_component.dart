import 'package:flutter/material.dart';
import 'package:flutter_social_wall/core/constants/app/app_constants.dart';
import '../../../core/constants/extension/color_extension.dart';
import '../../../core/constants/extension/context_extension.dart';
import 'custom_list_tile.dart';

class CustomComponents extends StatelessWidget {
  const CustomComponents({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.profileImageUrl,
    required this.description,
    required this.postImageUrl,
    required this.likeCount,
    required this.dislikeCount,
    this.commentCount,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String profileImageUrl;
  final String description;
  final String postImageUrl;
  final int likeCount;
  final int dislikeCount;
  final int? commentCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomListTile(
            title: title, subTitle: subTitle, imageUrl: profileImageUrl),
        Text(description),
        Padding(
          padding: context.paddingXVertical,
          child: _postImage(context),
        ),
        _customIcon(context),
        _customText(context),
      ],
    );
  }

  Row _customText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: context.paddingXHorizontal + context.paddingX2Left,
          child: Text(likeCount.toString()),
        ),
        Padding(
          padding: context.paddingXHorizontal,
          child: Text(dislikeCount.toString()),
        ),
        Padding(
          padding: context.paddingXHorizontal + context.paddingXRight,
          child: const Text('0'),
        ),
      ],
    );
  }

  Row _customIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: context.paddingXHorizontal,
          child: Icon(Icons.thumb_up_alt_outlined, color: context.vanillaDrop),
        ),
        Icon(Icons.thumb_down_alt_outlined, color: context.vanillaDrop),
        Padding(
          padding: context.paddingXLeft,
          child: Icon(Icons.comment, color: context.vanillaDrop),
        ),
      ],
    );
  }

  SizedBox _postImage(BuildContext context) {
    return SizedBox(
      height: context.hw200,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        postImageUrl,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const Text(AppConstants.noNetwork);
        },
      ),
    );
  }
}
