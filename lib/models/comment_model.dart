import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String commentText;
  String userId;
  String firstName;
  String lastName;
  String userName;
  String profileImage;
  DateTime createdAt;
  List<CommentModel> replies;

  CommentModel({
    required this.commentText,
    required this.userId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
    required this.createdAt,
    required this.replies,
  });

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      commentText: map['commentText'] ?? '',
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      profileImage: map['profileImage'] ?? '',
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      replies: (map['replies'] as List<dynamic>?)
          ?.map((reply) => CommentModel.fromMap(reply))
          .toList() ?? [],
    );
  }
}
