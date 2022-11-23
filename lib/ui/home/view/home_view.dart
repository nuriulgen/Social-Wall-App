import 'package:flutter/material.dart';
import '../../../core/constants/app/app_constants.dart';
import '../viewmodel/home_view_model.dart';
import '../../../core/init/network/model/post_model.dart';
import '../../../core/constants/extension/color_extension.dart';
import '../../../core/constants/extension/context_extension.dart';
import '../../../core/constants/extension/string_extension.dart';
import '../../../core/init/network/service/api_service.dart';
import '../../../product/util/widget/custom_app_bar.dart';
import '../../../product/util/widget/custom_component.dart';
import '../../../product/util/widget/custom_elevated_button.dart';

part 'home_view.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _customAppBar(),
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
                  child: _customStack(context),
                ),
                PostServiceView(postService: postService),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomAppBar _customAppBar() =>
      CustomAppBar(title: appStringConstants!.homeTitle);

  Stack _customStack(BuildContext context) {
    return Stack(
      children: [
        _customFormField(),
        _customButtons(context),
      ],
    );
  }

  TextFormField _customFormField() {
    return TextFormField(
      controller: textEditingController,
      maxLines: context.maxLinesValue,
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
      onPressed: _shareDescription,
      color: context.vanillaDrop,
    );
  }

  void _shareDescription() {
    if (textEditingController.text.isNotEmpty) {
      //sends the value entered in the text field to the service
      final model = PostModel(description: textEditingController.text);
      postService.addItemToService(model);
    }
    textEditingController.clear();
  }
}
