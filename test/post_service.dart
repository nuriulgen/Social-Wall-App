import 'package:flutter_social_wall/core/init/network/service/api_service.dart';
import 'package:flutter_social_wall/core/init/network/service/post_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late IPostService postService;
  setUp(() {
    postService = PostService();
  });
  test('Fetch Post', () async {
    final response = await postService.fetchPostsItems();
    expect(response, isNotNull);
  });
}
