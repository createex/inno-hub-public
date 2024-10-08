import 'package:cloud_firestore/cloud_firestore.dart';

class PostMediaModel {
  String profileImage;
  String userName;
  String firstName;
  String lastName;
  DateTime createdAt;
  String aboutPost;
  String media;

  // Constructor
  PostMediaModel({
    required this.profileImage,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    required this.aboutPost,
    required this.media,
  });

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
    };
  }
}
