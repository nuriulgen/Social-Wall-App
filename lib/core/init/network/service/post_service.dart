import 'dart:io';

import 'package:dio/dio.dart';
import '../../../constants/app/app_constants.dart';
import '../model/post_model.dart';
import '../model/comment_model.dart';
import 'api_service.dart';

import '../../../constants/enums/api_enums.dart';
import '../../../utility/utility.dart';

class PostService extends IPostService {
  late final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: AppConstants.BASE_URL));

  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response =
          await _dio.post(PostServicePaths.post.name, data: postModel);
      return response.statusCode == HttpStatus.created;
    } on DioError catch (exception) {
      ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.delete(
          '${PostServicePaths.post.name}/$id/${PostServicePaths.comment.name}/$id');
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (exception) {
      ShowDebug.showDioError(exception, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchPostsItems() async {
    try {
      final response = await _dio.get(PostServicePaths.post.name);
     

      if (response.statusCode == HttpStatus.ok) {
        final result = response.data;

        if (result is List) {
          return result.map((e) => PostModel.fromJson(e)).toList();
        }
      } else {
        return null;
      }
    } on DioError catch (exception) {
      ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(
      String postId) async {
    try {
      final response = await _dio.get(
          '${PostServicePaths.post.name}/$postId/${PostServicePaths.comment.name}',
          queryParameters: {PostQueryPath.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final result = response.data;
        if (result is List) {
          return result.map((e) => CommentModel.fromJson(e)).toList();
        }
      } else {
        return null;
      }
    } on DioError catch (exception) {
      ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}
