import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FirebaseService {
static  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final FirebaseAuth auth = FirebaseAuth.instance;
  // Stream for a single post
  Stream<DocumentSnapshot> getPostStream(String postId) {
    return firestore.collection('posts').doc(postId).snapshots();
  }
  // Get user document
  Future<DocumentSnapshot> getUserDocument(String userId) {
    return firestore.collection('users').doc(userId).get();
  }
  // Add a comment to a post
  Future<void> addComment(String postId, String commentText) async {
    String userId = auth.currentUser?.uid ?? '';
    DocumentSnapshot userDoc = await getUserDocument(userId);
    String userName = "${userDoc['firstName']} ${userDoc['lastName']}";
    String profileImage = userDoc['profileImage'] ?? 'assets/pngs/innoHub.png';
    String commentId = firestore.collection('posts').doc().id;

    Map<String, dynamic> newComment = {
      'commentId': commentId,
      "postId":postId,
      'ownerId': userDoc['ownerId'] ?? '',
      'userId': userId,
      'firstName': userDoc['firstName'] ?? '',
      'lastName': userDoc['lastName'] ?? '',
      'userName': userDoc['userName'] ?? '',
      'profileImage': profileImage,
      'commentText': commentText,
      'createdAt': DateTime.now().toIso8601String(),
      'replies': [],
    };

    await firestore.collection('posts').doc(postId).update({
      'comments': FieldValue.arrayUnion([newComment]),
    });
  }
// In your FirebaseService class
  Stream<int> getCommentCountStream(String postId) {
    return firestore.collection('posts')
        .doc(postId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        List<dynamic> comments = snapshot.data()!['comments'] ?? [];
        return comments.length; // Return the number of comments
      }
      return 0; // Return 0 if no comments
    });
  }


  // Reply to a comment
  Future<void> replyToComment(String postId, String parentCommentId, String replyText) async {
    String userId = auth.currentUser?.uid ?? '';
    DocumentSnapshot userDoc = await getUserDocument(userId);
    String userName = "${userDoc['firstName']} ${userDoc['lastName']}";
    String profileImage = userDoc['profileImage'] ?? 'assets/pngs/innoHub.png';
    String replyId = firestore.collection('posts').doc().id;

    Map<String, dynamic> newReply = {
      'commentId': replyId,
      'postId': postId,
      'ownerId': userDoc['ownerId'] ?? '',
      'userId': userId,
      'firstName': userDoc['firstName'] ?? '',
      'lastName': userDoc['lastName'] ?? '',
      'userName': userDoc['userName'] ?? '',
      'profileImage': profileImage,
      'commentText': replyText,
      'createdAt': DateTime.now().toIso8601String(),
    };

    // Locate the parent comment and add the reply
    DocumentReference postRef = firestore.collection('posts').doc(postId);
    await firestore.runTransaction((transaction) async {
      DocumentSnapshot postSnapshot = await transaction.get(postRef);
      if (!postSnapshot.exists) return;

      List<dynamic> comments = postSnapshot['comments'];
      for (int i = 0; i < comments.length; i++) {
        if (comments[i]['commentId'] == parentCommentId) {
          List<dynamic> replies = comments[i]['replies'] ?? [];
          replies.add(newReply);
          comments[i]['replies'] = replies;
          break;
        }
      }
      transaction.update(postRef, {'comments': comments});
    });
  }
}
