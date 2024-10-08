import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/post_media_model.dart';

class PostController extends GetxController {
  var postsList = <PostMediaModel>[].obs; // List to hold posts with user details
  var likeCounts = <String, int>{}.obs; // Map to hold like counts for each post
  var likedPosts = <String, bool>{}.obs; // Map to hold like status for each post
  @override
  void onInit() {
    fetchPosts(); // Fetch posts in real-time
    super.onInit();
  }

  // Fetch posts in real-time using Firestore snapshots
  void fetchPosts() {
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('createdAt', descending: true) // Order by 'createdAt' in descending order
        .snapshots() // Listen to real-time updates
        .listen((postSnapshot) async {
      // Clear the current list to avoid duplicates
      postsList.clear();

      // Loop through each post and fetch the corresponding user data from the 'users' collection
      for (var postDoc in postSnapshot.docs) {
        Map<String, dynamic> postData = postDoc.data() as Map<String, dynamic>;

        String userId = postData['id']; // Get the user ID from the post

        // Fetch user data based on the ID from 'users' collection
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userSnapshot.exists) {
          Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

          // Create a PostMediaModel with combined data from 'posts' and 'users'
          PostMediaModel postWithUserData = PostMediaModel(
            profileImage: userData['profileImage'] ?? '',
            userName: userData['userName'] ?? '',
            firstName: userData['firstName'] ?? '',
            lastName: userData['lastName'] ?? '',
            createdAt: (postData['createdAt'] as Timestamp).toDate(),
            aboutPost: postData['aboutPost'] ?? '',
            media: (postData['media'] as List<dynamic>).isNotEmpty ? postData['media'][0] : '',
          );

          // Add the post with user data to the observable list
          postsList.add(postWithUserData);
        }
      }
    });
  }

  // Toggle like functionality
  Future<void> toggleLike(String postId) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('User not logged in');
      }

      String userId = currentUser.uid;

      DocumentReference postRef = FirebaseFirestore.instance.collection('posts').doc(postId);

      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(postRef);
        if (!snapshot.exists) {
          throw Exception('Post not found');
        }

        List<dynamic> likes = snapshot['likes'] ?? [];

        if (likes.contains(userId)) {
          // Unlike the post by removing user ID
          likes.remove(userId);
        } else {
          // Like the post by adding user ID
          likes.add(userId);
        }

        // Update Firestore
        transaction.update(postRef, {'likes': likes});
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}