import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
    }
  }
}