import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../models/comment_model.dart';
import '../../models/post_media_model.dart';
import '../../utils/firestore_utils.dart';
import 'comment_controller.dart';

class PostController extends GetxController {
  var postsList = <PostMediaModel>[].obs; // List to hold posts with user details
  var likeCounts = <String, int>{}.obs; // Map to hold like counts for each post
  var likedPosts = <String, bool>{}.obs;
  final FirestoreUtils _firestoreUtils = FirestoreUtils();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CommentController commentController = Get.put(CommentController());
  var commentsMap = <String, RxList<dynamic>>{}.obs;

  var isLoading = false.obs;// Map to hold like status for each post
  @override
  void onInit() {
    fetchPosts(); // Fetch posts in real-time
    super.onInit();
  }

  //Fetch posts in real-time using Firestore snapshots
  void fetchPosts() {
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((postSnapshot) async {
      postsList.clear();

      List<Future<PostMediaModel?>> postFutures = postSnapshot.docs.map((postDoc) async {
        Map<String, dynamic>? postData = postDoc.data() as Map<String, dynamic>?;
        if (postData != null) {
          String userId = postData['ownerId'] ?? '';
          DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();

          if (userSnapshot.exists) {
            Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;
            DateTime createdAt = (postData['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now();

            return PostMediaModel(
              profileImage: userData?['profileImage'] ?? '',
              userName: userData?['userName'] ?? '',
              firstName: userData?['firstName'] ?? '',
              lastName: userData?['lastName'] ?? '',
              createdAt: createdAt,
              aboutPost: postData['aboutPost'] ?? '',
              media: (postData['media'] as List<dynamic>?)?.isNotEmpty == true
                  ? postData['media'][0]
                  : '',
              likes: List<String>.from(postData['likes'] ?? []),
              ownerId: postData['ownerId'] ?? '',
              comments: [],
              postId: postDoc.id,
            );
          }
        }
        return null;
      }).toList();

      List<PostMediaModel?> postList = await Future.wait(postFutures);
      postsList.addAll(postList.where((post) => post != null).cast<PostMediaModel>());
    });
  }

// add comments
  Future<void> addComment(String postId, String commentText) async {
    isLoading.value = true;
    try {
      String userId = _auth.currentUser?.uid ?? '';
      Map<String, dynamic> newComment = {
        'commentText': commentText,
        'userId': userId,
        'createdAt': DateTime.now(),
        'replies': [],
      };

      // Add comment to Firestore
      await FirebaseFirestore.instance.collection('posts').doc(postId).update({
        'comments': FieldValue.arrayUnion([newComment]),
      });

      // Optionally: Add the comment to the local list immediately for better UX
      commentController.comments.add(CommentModel(
        commentText: commentText,
        userId: userId,
        userName: _auth.currentUser?.displayName ?? 'Anonymous',
        profileImage: _auth.currentUser?.photoURL ?? '',
        createdAt: DateTime.now(),
        replies: [],
        firstName: _auth.currentUser?.displayName ?? 'Anonymous',
        lastName: _auth.currentUser?.displayName ?? 'Anonymous',
      ));
    } catch (e) {
      Get.snackbar('Error', 'Failed to add comment');
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch posts from Firestore
  // void fetchPosts() {
  //   FirebaseFirestore.instance.collection('posts').orderBy('createdAt', descending: true).snapshots().listen((snapshot) {
  //     postsList.value = snapshot.docs.map((doc) => PostMediaModel.fromFirestore(doc)).toList();
  //     isLoading.value = false;
  //   }, onError: (error) {
  //     showErrorSnackBar( 'Failed to fetch posts: $error');
  //     isLoading.value = false;
  //   });
  // }

  // like section

  // Add like
  Future<void> toggleLikePost(PostMediaModel post) async {
    try {
      final String userId = _auth.currentUser?.uid.toString() ?? "";

      // Update the local model immediately to avoid lag
      if (post.likes.contains(userId)) {
        post.likes.remove(userId);  // Dislike locally
      } else {
        post.likes.add(userId);     // Like locally
      }
      print("${post.ownerId}");
      print("${ post.createdAt.toIso8601String()}");
      // update(); // Notify UI of the change instantly

      // Now, handle the Firestore update
      final QuerySnapshot snapshot = await _firestoreUtils.queryDocuments(
        collectionName: "posts",
        where: [
          {'field': 'ownerId', 'isEqualTo': post.ownerId},
          {'field': 'createdAt', 'isEqualTo': post.createdAt},
        ],
      );

      if (snapshot.docs.isNotEmpty) {
        final postDoc = snapshot.docs.first;

        if (post.likes.contains(userId)) {
          // Like the post in Firestore
          await _firestoreUtils.updateDocument(
            collectionName: "posts",
            docId: postDoc.id,
            updates: {
              'likes': FieldValue.arrayUnion([userId])
            },
          );
        } else {
          // Unlike the post in Firestore
          await _firestoreUtils.updateDocument(
            collectionName: "posts",
            docId: postDoc.id,
            updates: {
              'likes': FieldValue.arrayRemove([userId])
            },
          );
        }
      } else {
        print('No post found matching the ownerId and createdAt');
      }
    } catch (e) {
      print('Error toggling like: $e');
    } finally {
      isLoading.value = false;
    }
  }

// Get all comments along with user profile info
  Future<List<Map<String, dynamic>>> getAllCommentsWithUserProfile(String ownerId, String createdAt) async {
    try {
      // Find post by ownerId and createdAt
      QuerySnapshot postSnapshot = await _firestoreUtils.getDocumentByQuery(
        collectionName: "posts",
        whereConditions: [
          {'field': 'ownerId', 'isEqualTo': ownerId},
          {'field': 'createdAt', 'isEqualTo': createdAt}
        ],
      );

      if (postSnapshot.docs.isNotEmpty) {
        var postDoc = postSnapshot.docs.first;
        List<dynamic> comments = postDoc['comments'];

        // Fetch user profiles for each comment
        List<Map<String, dynamic>> enrichedComments = [];
        for (var comment in comments) {
          String userId = comment['userId'];
          DocumentSnapshot userDoc = await _firestoreUtils.getDocument(collectionName: 'users', docId: userId);

          if (userDoc.exists) {
            comment['userName'] = "${userDoc['firstName']} ${userDoc['lastName']}";
            comment['profileImage'] = userDoc['profileImage'];
          }

          enrichedComments.add(comment);
        }

        return enrichedComments;
      }
    } catch (e) {
      print('Error fetching comments: $e');
    }
    return [];
  }
// Add a comment to a post
//   Future<void> addComment(String ownerId, String createdAt, String comment) async {
//     isLoading.value = true;
//     try {
//       Map<String, dynamic> newComment = {
//         'commentText': comment,
//         'userId': _auth.currentUser?.uid.toString() ?? "",
//         'createdAt': DateTime.now().toIso8601String(),
//         'replies': [] // Array of reply comments
//       };
//
//       // Find post by ownerId and createdAt
//       QuerySnapshot postSnapshot = await _firestoreUtils.getDocumentByQuery(
//         collectionName: "posts",
//         whereConditions: [
//           {'field': 'ownerId', 'isEqualTo': ownerId},
//           {'field': 'createdAt', 'isEqualTo': createdAt}
//         ],
//       );
//
//       if (postSnapshot.docs.isNotEmpty) {
//         var postDoc = postSnapshot.docs.first;
//
//         await _firestoreUtils.updateDocument(
//           collectionName: "posts",
//           docId: postDoc.id,
//           updates: {
//             'comments': FieldValue.arrayUnion([newComment])
//           },
//         );
//       }
//     } catch (e) {
//       print('Error adding comment: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// Reply to a comment
  Future<void> replyToComment(String ownerId, String createdAt, Map<String, dynamic> parentComment, String replyText) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> newReply = {
        'commentText': replyText,
        'userId': _auth.currentUser?.uid.toString() ?? "",
        'createdAt': DateTime.now().toIso8601String(),
      };

      // Update the replies array of the parent comment
      List<Map<String, dynamic>> updatedReplies = List<Map<String, dynamic>>.from(parentComment['replies']);
      updatedReplies.add(newReply);

      // Find post by ownerId and createdAt
      QuerySnapshot postSnapshot = await _firestoreUtils.getDocumentByQuery(
        collectionName: "posts",
        whereConditions: [
          {'field': 'ownerId', 'isEqualTo': ownerId},
          {'field': 'createdAt', 'isEqualTo': createdAt}
        ],
      );

      if (postSnapshot.docs.isNotEmpty) {
        var postDoc = postSnapshot.docs.first;

        // Update the parent comment with the new reply
        await _firestoreUtils.updateDocument(
          collectionName: "posts",
          docId: postDoc.id,
          updates: {
            'comments': FieldValue.arrayRemove([parentComment]) // First remove the old comment
          },
        );

        parentComment['replies'] = updatedReplies; // Add replies to the parent comment

        await _firestoreUtils.updateDocument(
          collectionName: "posts",
          docId: postDoc.id,
          updates: {
            'comments': FieldValue.arrayUnion([parentComment]) // Add the updated comment with replies
          },
        );
      }
    } catch (e) {
      print('Error replying to comment: $e');
    } finally {
      isLoading.value = false;
    }
  }


}