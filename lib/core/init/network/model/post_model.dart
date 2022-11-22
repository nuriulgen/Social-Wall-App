class PostModel {
  String? createdAt;
  String? authorId;
  String? authorName;
  String? description;
  String? media;
  int? likeCount;
  int? disLikeCount;
  String? authorProfileImage;
  String? id;
  List<Comments>? comments;

  PostModel(
      {this.createdAt,
      this.authorId,
      this.authorName,
      this.description,
      this.media,
      this.likeCount,
      this.disLikeCount,
      this.authorProfileImage,
      this.id,
      this.comments});

  PostModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    authorId = json['authorId'];
    authorName = json['authorName'];
    description = json['description'];
    media = json['media'];
    likeCount = json['likeCount'];
    disLikeCount = json['disLikeCount'];
    authorProfileImage = json['authorProfileImage'];
    id = json['id'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['authorId'] = authorId;
    data['authorName'] = authorName;
    data['description'] = description;
    data['media'] = media;
    data['likeCount'] = likeCount;
    data['disLikeCount'] = disLikeCount;
    data['authorProfileImage'] = authorProfileImage;
    data['id'] = id;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  String? createdAt;
  String? authorName;
  String? authorId;
  String? description;
  int? likeCount;
  int? disLikeCount;
  String? authorProfileImage;
  String? id;
  String? postId;

  Comments(
      {this.createdAt,
      this.authorName,
      this.authorId,
      this.description,
      this.likeCount,
      this.disLikeCount,
      this.authorProfileImage,
      this.id,
      this.postId});

  Comments.fromJson(Map<String, dynamic> json) {
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
