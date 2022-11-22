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
      this.commentLikeCount,
      this.commentDislikeCount,
      required this.commentImageUrl})
      : super(key: key);

  final String title;
  final String subTitle;
  final String profileImageUrl;
  final String description;
  final String postImageUrl;
  final int likeCount;
  final int dislikeCount;
  final int commentCount;
  final String commentTitle;
  final String commentDescription;
  final String commentImageUrl;
  final int? commentLikeCount;
  final int? commentDislikeCount;

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
              child: Text(likeCount.toString()),
            ),
            Padding(
              padding: context.paddingXHorizontal + context.paddingX2Left,
              child: Text(dislikeCount.toString()),
            ),
            Padding(
              padding: context.paddingXHorizontal + context.paddingXLeft,
              child: Text(commentCount.toString()),
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
