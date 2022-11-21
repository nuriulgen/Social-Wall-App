import 'package:flutter/material.dart';
import '../../../core/constants/extension/color_extension.dart';
import '../../../core/constants/extension/context_extension.dart';
import 'custom_list_tile.dart';

class CustomComponents extends StatelessWidget {
  const CustomComponents(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.profileImageUrl,
      required this.description,
      required this.postImageUrl,
      required this.likeCount,
      required this.dislikeCount,
      required this.commentCount,
      required this.commentTitle,
      required this.commentDescription,
      required this.commentLikeCount,
      required this.commentDislikeCount,
      required this.commentImageUrl})
      : super(key: key);

  final String title;
  final String subTitle;
  final String profileImageUrl;
  final String description;
  final String postImageUrl;
  final String likeCount;
  final String dislikeCount;
  final String commentCount;
  final String commentTitle;
  final String commentDescription;
  final String commentImageUrl;
  final String commentLikeCount;
  final String commentDislikeCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
            title: title, subTitle: subTitle, imageUrl: profileImageUrl),
        Text(description),
        Padding(
          padding: context.paddingXVertical,
          child: _postImage(context),
        ),
        Row(
          children: [
            Padding(
              padding: context.paddingXHorizontal,
              child:
                  Icon(Icons.thumb_up_alt_outlined, color: context.vanillaDrop),
            ),
            Icon(Icons.thumb_down_alt_outlined, color: context.vanillaDrop),
            Padding(
              padding: context.paddingXLeft,
              child: Icon(Icons.comment, color: context.vanillaDrop),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: context.paddingXHorizontal + context.paddingX2Left,
              child: Text(likeCount),
            ),
            Padding(
              padding: context.paddingXHorizontal + context.paddingX2Left,
              child: Text(dislikeCount),
            ),
            Padding(
              padding: context.paddingXHorizontal + context.paddingXLeft,
              child: Text(commentCount),
            ),
          ],
        ),
        CustomListTile(
          title: commentTitle,
          subTitle: commentDescription,
          imageUrl: commentImageUrl,
          icon: Icon(
            Icons.delete,
            color: context.vanillaDrop,
          ),
          onPressed: () {},
        )
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
      ),
    );
  }
}
