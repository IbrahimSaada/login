// lib/models/post_model.dart

class Post {
  final int postId;
  final String caption;
  final int commentCount;
  final DateTime createdAt;
  final bool isPublic;
  final int likeCount;
  final String mediaType;
  final String mediaUrl;
  final int userId;
  final String fullName;
  final String profilePic;

  Post({
    required this.postId,
    required this.caption,
    required this.commentCount,
    required this.createdAt,
    required this.isPublic,
    required this.likeCount,
    required this.mediaType,
    required this.mediaUrl,
    required this.userId,
    required this.fullName,
    required this.profilePic,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['post_id'],
      caption: json['caption'],
      commentCount: json['comment_count'],
      createdAt: DateTime.parse(json['created_at']),
      isPublic: json['is_public'],
      likeCount: json['like_count'],
      mediaType: json['media_type'],
      mediaUrl: json['media_url'],
      userId: json['user_id'],
      fullName: json['fullname'],
      profilePic: json['profile_pic'],
    );
  }
}
