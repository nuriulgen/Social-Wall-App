import 'package:flutter/material.dart';

import '../../../core/constants/extension/string_extension.dart';
import '../../../core/init/network/service/api_service.dart';
import '../../../core/init/network/service/post_service.dart';
import '../view/home_view.dart';

abstract class HomeViewModel extends State<HomeView> {
  late final IPostService postService;
  AppStringConstants? appStringConstants = AppStringConstants.instance;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    postService = PostService();
  }
}