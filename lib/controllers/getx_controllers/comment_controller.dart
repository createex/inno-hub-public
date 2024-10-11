// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../../models/comment_model.dart';
// class CommentController extends GetxController {
//   // Firestore instance
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   // Firebase Auth instance
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   // Observable list of comments
//   var comments = <CommentModel>[].obs;
//
//   // Observable loading state
//   var isLoading = false.obs;
//
//   // Observable map to manage visibility of each comment
//   var commentVisibility = <int, bool>{}.obs;
//
//   // TextEditingController for the comment input field
//   final TextEditingController commentController = TextEditingController();
//
//   // FocusNode for the comment input field
//   final FocusNode commentFocusNode = FocusNode();
//
//   // The post ID for which comments are being managed
//   String postId = '';
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize postId as needed, possibly passed from the previous screen
//     // For example:
//     // postId = Get.arguments['postId'];
//   }
//
//   /// Fetch all comments for a given post along with user profile information
//   Future<void> fetchAllComments(String postId) async {
//     isLoading.value = true;
//     try {
//       // Fetch the post document
//       DocumentSnapshot postDoc = await _firestore.collection('posts').doc(postId).get();
//
//       if (postDoc.exists) {
//         List<dynamic> commentsData = postDoc['comments'] ?? [];
//
//         // Extract userIds from comments to fetch user profiles in bulk
//         List<String> userIds = commentsData.map<String>((comment) => comment['userId'] as String).toSet().toList();
//
//         // Fetch all user profiles in parallel
//         Map<String, Map<String, dynamic>> userProfiles = {};
//         await Future.wait(userIds.map((userId) async {
//           DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
//           if (userDoc.exists) {
//             userProfiles[userId] = userDoc.data() as Map<String, dynamic>;
//           }
//         }));
//
//         // Map comments data to CommentModel with user profiles
//         List<CommentModel> fetchedComments = commentsData.map<CommentModel>((commentMap) {
//           String userId = commentMap['userId'] ?? '';
//           Map<String, dynamic> userData = userProfiles[userId] ?? {};
//
//           return CommentModel(
//             commentText: commentMap['commentText'] ?? '',
//             userId: userId,
//             userName: "${userData['userName'] ?? ''}",
//             firstName: "${userData['firstName'] ?? ''}",
//             lastName: "${userData['lastName'] ?? ''}",
//             profileImage: userData['profileImage'] ?? '',
//             createdAt: (commentMap['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
//             replies: [], // Initialize empty list; handle replies similarly if needed
//           );
//         }).toList();
//
//         // Update the observable comments list
//         comments.assignAll(fetchedComments);
//
//         // Initialize visibility states
//         commentVisibility.assignAll({ for (int i = 0; i < fetchedComments.length; i++) i : false });
//       }
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to load comments: $e',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   /// Add a new comment to the post
//   Future<void> addComment(String postId, String commentText) async {
//     if (commentText.trim().isEmpty) return;
//
//     isLoading.value = true;
//     try {
//       String userId = _auth.currentUser?.uid ?? '';
//
//       // Fetch user data
//       DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
//       String lastName = '';
//       String userName = '';
//       String firstName = '';
//       String profileImage = '';
//
//       if (userDoc.exists) {
//         Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
//         profileImage = userData['profileImage'] ?? '';
//         firstName = userData['firstName'] ?? '';
//         lastName = userData['lastName'] ?? '';
//         userName = userData['userName'] ?? '';
//       }
//
//       // Create a new comment map
//       Map<String, dynamic> newComment = {
//         'commentText': commentText.trim(),
//         'userId': userId,
//         'createdAt': Timestamp.fromDate(DateTime.now()),
//         'replies': [], // Initialize empty replies
//       };
//
//       // Update Firestore by adding the new comment to the comments array
//       await _firestore.collection('posts').doc(postId).update({
//         'comments': FieldValue.arrayUnion([newComment]),
//       });
//
//       // Optionally, add the comment to the local list for immediate UI update
//       comments.add(CommentModel(
//         commentText: commentText.trim(),
//         userId: userId,
//         firstName: firstName,
//         lastName: lastName,
//         userName: userName,
//         profileImage: profileImage,
//         createdAt: DateTime.now(),
//         replies: [],
//       ));
//
//       // Initialize visibility for the new comment
//       commentVisibility[comments.length - 1] = false;
//
//       // Clear the input field
//       commentController.clear();
//       commentFocusNode.unfocus();
//
//       Get.snackbar(
//         'Success',
//         'Comment added successfully!',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to add comment: $e',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   /// Toggle the visibility of a comment's detailed view
//   void toggleCommentVisibility(int index) {
//     commentVisibility[index] = !(commentVisibility[index] ?? false);
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/comment_model.dart';

class CommentController extends GetxController {
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observable list of comments
  var comments = <CommentModel>[].obs;

  // Observable loading state
  var isLoading = false.obs;

  // Observable map to manage visibility of each comment
  var commentVisibility = <int, bool>{}.obs;

  // TextEditingController for the comment input field
  final TextEditingController commentController = TextEditingController();

  // FocusNode for the comment input field
  final FocusNode commentFocusNode = FocusNode();

  // The post ID for which comments are being managed
  String postId = '';

  @override
  void onInit() {
    super.onInit();
    // Initialize postId as needed, possibly passed from the previous screen
    // For example:
    // postId = Get.arguments['postId'];
  }

  /// Fetch all comments for a given post along with user profile information
  Future<void> fetchAllComments(String postId) async {
    isLoading.value = true;
    try {
      // Fetch the post document
      DocumentSnapshot postDoc = await _firestore.collection('posts').doc(postId).get();

      if (postDoc.exists) {
        List<dynamic> commentsData = postDoc['comments'] ?? [];

        // Extract userIds from comments to fetch user profiles in bulk
        List<String> userIds = commentsData.map<String>((comment) => comment['userId'] as String).toSet().toList();

        // Fetch all user profiles in parallel
        Map<String, Map<String, dynamic>> userProfiles = {};
        await Future.wait(userIds.map((userId) async {
          DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
          if (userDoc.exists) {
            userProfiles[userId] = userDoc.data() as Map<String, dynamic>;
          }
        }));

        // Map comments data to CommentModel with user profiles
        List<CommentModel> fetchedComments = commentsData.map<CommentModel>((commentMap) {
          String userId = commentMap['userId'] ?? '';
          Map<String, dynamic> userData = userProfiles[userId] ?? {};

          return CommentModel(
            commentText: commentMap['commentText'] ?? '',
            userId: userId,
            userName: "${userData['userName'] ?? ''}",
            firstName: "${userData['firstName'] ?? ''}",
            lastName: "${userData['lastName'] ?? ''}",
            profileImage: userData['profileImage'] ?? '',
            createdAt: (commentMap['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
            replies: (commentMap['replies'] as List<dynamic>?)?.map((reply) => CommentModel.fromMap(reply)).toList() ?? [], // Handle replies
          );
        }).toList();

        // Update the observable comments list
        comments.assignAll(fetchedComments);

        // Initialize visibility states
        commentVisibility.assignAll({ for (int i = 0; i < fetchedComments.length; i++) i : false });
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load comments: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Add a new comment to the post
  Future<void> addComment(String postId, String commentText) async {
    if (commentText.trim().isEmpty) return;

    isLoading.value = true;
    try {
      String userId = _auth.currentUser?.uid ?? '';

      // Fetch user data
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      String lastName = '';
      String userName = '';
      String firstName = '';
      String profileImage = '';

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        profileImage = userData['profileImage'] ?? '';
        firstName = userData['firstName'] ?? '';
        lastName = userData['lastName'] ?? '';
        userName = userData['userName'] ?? '';
      }

      // Create a new comment map
      Map<String, dynamic> newComment = {
        'commentText': commentText.trim(),
        'userId': userId,
        'createdAt': Timestamp.fromDate(DateTime.now()),
        'replies': [], // Initialize empty replies
      };

      // Update Firestore by adding the new comment to the comments array
      await _firestore.collection('posts').doc(postId).update({
        'comments': FieldValue.arrayUnion([newComment]),
      });

      // Optionally, add the comment to the local list for immediate UI update
      comments.add(CommentModel(
        commentText: commentText.trim(),
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        profileImage: profileImage,
        createdAt: DateTime.now(),
        replies: [],
      ));

      // Initialize visibility for the new comment
      commentVisibility[comments.length - 1] = false;

      // Clear the input field
      commentController.clear();
      commentFocusNode.unfocus();

      Get.snackbar(
        'Success',
        'Comment added successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add comment: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Reply to a specific comment
  Future<void> replyToComment(String postId, int commentIndex, String replyText) async {
    if (replyText.trim().isEmpty) return;

    isLoading.value = true;
    try {
      String userId = _auth.currentUser?.uid ?? '';

      // Fetch user data for the reply
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      String userName = '';
      String firstName = '';
      String lastName = '';
      String profileImage = '';

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        profileImage = userData['profileImage'] ?? '';
        firstName = userData['firstName'] ?? '';
        lastName = userData['lastName'] ?? '';
        userName = userData['userName'] ?? '';
      }

      // Create a new reply map
      Map<String, dynamic> newReply = {
        'commentText': replyText.trim(),
        'userId': userId,
        'createdAt': Timestamp.fromDate(DateTime.now()),
      };

      // Update Firestore by adding the new reply to the specified comment's replies array
      await _firestore.collection('posts').doc(postId).update({
        'comments.$commentIndex.replies': FieldValue.arrayUnion([newReply]),
      });

      // Optionally, add the reply to the local list for immediate UI update
      comments[commentIndex].replies.add(CommentModel(
        commentText: replyText.trim(),
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        profileImage: profileImage,
        createdAt: DateTime.now(),
        replies: [],
      ));

      // Clear the input field
      commentController.clear();
      commentFocusNode.unfocus();

      Get.snackbar(
        'Success',
        'Reply added successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add reply: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Toggle the visibility of a comment's detailed view
  void toggleCommentVisibility(int index) {
    commentVisibility[index] = !(commentVisibility[index] ?? false);
  }
}
