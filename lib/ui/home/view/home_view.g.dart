part of 'home_view.dart';


class PostServiceView extends StatelessWidget {
  const PostServiceView({
    Key? key,
    required IPostService postService,
  })  : _postService = postService,
        super(key: key);

  final IPostService _postService;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>?>(
      future: _postService.fetchPostsItems(),
      builder: (context, snapshot) {
        final result = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return const Center(child: Text(AppConstants.error));
            } else {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(), // scroll fix it.
                shrinkWrap: true,
                itemCount: result?.length,
                itemBuilder: ((context, index) {
                  return CustomComponents(
                    title: result?[index].authorName ?? '',
                    subTitle: result?[index].createdAt ?? '',
                    profileImageUrl: result?[index].authorProfileImage ??
                        AppConstants.notFoundImage,
                    postImageUrl:
                        result?[index].media ?? AppConstants.notFoundImage,
                    description: result?[index].description ?? '',
                    likeCount: result?[index].likeCount ?? 0,
                    dislikeCount: result?[index].disLikeCount ?? 0,
                  );
                }),
              );
            }
        }
      },
    );
  }
}

class _CustomProfile extends StatelessWidget {
  const _CustomProfile({
    Key? key,
    required this.appStringConstants,
  }) : super(key: key);

  final AppStringConstants? appStringConstants;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        appStringConstants!.userName,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(fontWeight: FontWeight.w400),
      ),
      subtitle: Padding(
        padding: context.paddingX2Top,
        child: Row(
          children: [
            Row(
              children: [
                Icon(
                  Icons.format_list_bulleted_sharp,
                  color: context.vanillaDrop,
                  size: context.hw20,
                ),
                Padding(
                  padding: context.paddingX2Left,
                  child: Text('${appStringConstants!.postsText} '),
                ),
              ],
            ),
            Padding(
              padding: context.padding2xLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.comment,
                    color: context.vanillaDrop,
                    size: context.hw20,
                  ),
                  Padding(
                    padding: context.paddingX2Left,
                    child: Text('${appStringConstants!.commentText} '),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}