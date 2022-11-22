import 'package:flutter/material.dart';

import '../../../core/init/network/model/post_model.dart';
import '../../../core/init/network/service/api_service.dart';
import '../../../core/init/network/service/post_service.dart';
import '../../../product/util/widget/custom_componet.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _postService = PostService();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>?>(
      future: _postService.fetchPostsItems(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data?.length,
            itemBuilder: ((context, index) {
              final result = snapshot.data![index];
              return CustomComponents(
                title: result.authorName ?? '',
                subTitle: result.createdAt ?? '',
                profileImageUrl: result.authorProfileImage ?? '',
                postImageUrl: result.media ?? '',
                description: result.description ?? '',
                likeCount: result.likeCount ?? 0,
                dislikeCount: result.disLikeCount ?? 0,
                commentCount: result.comments?.length ?? 0,
                commentTitle: result.comments?[index].authorName ?? '',
                commentDescription: result.description ?? '',
                commentImageUrl: result.authorProfileImage ?? '',
              );
            }),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
