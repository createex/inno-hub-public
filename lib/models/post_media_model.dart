import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:in_hub/models/comment_model.dart';

class PostMediaModel {
  String profileImage;
  String postId;
  String userName;
  String firstName;
  String lastName;
  DateTime createdAt;
  String aboutPost;
  String media;
  String ownerId;
  RxList<String> likes;
  List<CommentModel> comments; // List of PostMediaModel for nested comments

  // Constructor
  PostMediaModel({
    required this.profileImage,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    required this.aboutPost,
    required this.media,
    required List<String> likes,
    required this.ownerId,
    required this.comments,
    required this.postId,
  }) : likes = RxList<String>(likes);

  // Factory method to create PostMediaModel from Firestore document
  factory PostMediaModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return PostMediaModel(
      profileImage: data['profileImage'] ?? '',
      userName: data['userName'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(), // Convert Firestore Timestamp to DateTime
      aboutPost: data['aboutPost'] ?? '',
      media: data['media'] ?? '',
      likes: List<String>.from(data['likes'] ?? []),
      comments: (data['comments'] as List<dynamic>?)
          ?.map((commentMap) => CommentModel.fromMap(commentMap as Map<String, dynamic>))
          .toList() as List<CommentModel>? ??
          [],
      ownerId: data['ownerId'] ?? '',
      postId: doc.id, // Set the user ID from Firestore data
    );
  }

  // Convert PostMediaModel to Firestore map (optional if needed later)
  Map<String, dynamic> toFirestore() {
    return {
      'profileImage': profileImage,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'createdAt': Timestamp.fromDate(createdAt), // Convert DateTime to Firestore Timestamp
      'aboutPost': aboutPost,
      'media': media,
      'likes': likes,
      'comments': comments.map((comment) => comment.toFirestore()).toList(), // Convert comments back to map
    };
  }

  // Factory method to create PostMediaModel from map
  factory PostMediaModel.fromMap(Map<String, dynamic> map) {
    return PostMediaModel(
      profileImage: map['profileImage'] ?? '',
      userName: map['userName'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      aboutPost: map['aboutPost'] ?? '',
      media: map['media'] ?? '',
      likes: List<String>.from(map['likes'] ?? []),
      comments: (map['comments'] as List<dynamic>?)
          ?.map((commentMap) => CommentModel.fromMap(commentMap as Map<String, dynamic>))
          .toList() as List<CommentModel>? ??
          [],
      ownerId: map['ownerId'] ?? '',
      postId: '',
    );
  }
}
