import 'package:flutter/material.dart';
import 'package:flutter_social_wall/core/constants/app/app_constants.dart';
import '../../../core/init/network/model/post_model.dart';
import '../../../core/init/network/service/post_service.dart';
import '../../../core/constants/extension/color_extension.dart';
import '../../../core/constants/extension/context_extension.dart';
import '../../../core/constants/extension/string_extension.dart';
import '../../../core/init/network/service/api_service.dart';
import '../../../product/util/widget/custom_app_bar.dart';
import '../../../product/util/widget/custom_componet.dart';
import '../../../product/util/widget/custom_elevated_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final IPostService _postService;
  AppStringConstants? appStringConstants = AppStringConstants.instance;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _postService = PostService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(title: appStringConstants!.homeTitle),
      body: SafeArea(
        child: Padding(
          padding: context.paddingXHorizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _CustomProfile(appStringConstants: appStringConstants),
                Divider(
                    color: context.vanillaDrop,
                    thickness: context.thicknessValue),
                Padding(
                  padding: context.paddingX2Top,
                  child: Stack(
                    children: [
                      _customFormField(),
                      _customButtons(context),
                    ],
                  ),
                ),
                FutureBuilder<List<PostModel>?>(
                  future: _postService.fetchPostsItems(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final result = snapshot.data ;
                      print(snapshot.data);
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(), // scroll fix it.
                        shrinkWrap: true,
                        itemCount: result?.length,
                        itemBuilder: ((context, index) {
                          return CustomComponents(
                            title: result?[index].authorName ?? '',
                            subTitle: result?[index].createdAt ?? '',
                            profileImageUrl:
                                result?[index].authorProfileImage ??
                                    AppConstants.notFoundImage,
                            postImageUrl: result?[index].media ??
                                AppConstants.notFoundImage,
                            description: result?[index].description ?? '',
                            likeCount: result?[index].likeCount ?? 0,
                            dislikeCount: result?[index].disLikeCount ?? 0,
                          );
                        }),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _customFormField() {
    return TextFormField(
      controller: textEditingController,
      maxLines: 7,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }

  Positioned _customButtons(BuildContext context) {
    return Positioned(
      bottom: context.hw10,
      child: Row(
        children: [
          Padding(
            padding: context.padding2xLeft,
            child: _addImageButton(context),
          ),
          SizedBox(width: context.hw100),
          _shareButton(context),
        ],
      ),
    );
  }

  CustomElevatedButton _addImageButton(BuildContext context) {
    return CustomElevatedButton(
      title: appStringConstants!.addImageButton,
      onPressed: () {},
      color: context.transparent,
    );
  }

  CustomElevatedButton _shareButton(BuildContext context) {
    return CustomElevatedButton(
      title: appStringConstants!.shareButton,
      onPressed: () {},
      color: context.vanillaDrop,
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
      //leading: const CustomNetworkImage(imagePath: ''),
      title: Text(
        'Nuri Ulgen',
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


