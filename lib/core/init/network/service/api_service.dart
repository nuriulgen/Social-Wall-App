import '../model/comment_model.dart';
import '../model/post_model.dart';

abstract class IPostService {
  Future<List<PostModel>?> fetchPostsItems();
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> deleteItemToService(int id);
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(String postId);
}