import 'package:flutter/material.dart';
import 'ui/home/view/home_view.dart';
import 'core/constants/app/app_constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      home: HomeView(),
    );
  }
}
