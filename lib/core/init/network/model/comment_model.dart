class CommentModel {
  String? createdAt;
  String? authorName;
  String? authorId;
  String? description;
  int? likeCount;
  int? disLikeCount;
  String? authorProfileImage;
  String? id;
  String? postId;

  CommentModel(
      {this.createdAt,
      this.authorName,
      this.authorId,
      this.description,
      this.likeCount,
      this.disLikeCount,
      this.authorProfileImage,
      this.id,
      this.postId});

  CommentModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    authorName = json['authorName'];
    authorId = json['authorId'];
    description = json['description'];
    likeCount = json['likeCount'];
    disLikeCount = json['disLikeCount'];
    authorProfileImage = json['authorProfileImage'];
    id = json['id'];
    postId = json['postId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['authorName'] = authorName;
    data['authorId'] = authorId;
    data['description'] = description;
    data['likeCount'] = likeCount;
    data['disLikeCount'] = disLikeCount;
    data['authorProfileImage'] = authorProfileImage;
    data['id'] = id;
    data['postId'] = postId;
    return data;
  }
}
