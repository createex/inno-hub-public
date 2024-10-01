import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_hub/controllers/utils/custom_snackbar_error_widget.dart';
class CreatePostController extends GetxController {
  TextEditingController aboutPostController=TextEditingController();
  RxBool isLoading=false.obs;
  var firstName = ''.obs; // Observable to store the fetched username
  var lastName = ''.obs; // Observable to store the fetched username
  var profileImage = ''.obs; // Observable to store the fetched username

  // picked image
  var image = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  var aboutPost = ''.obs;

  // Function to pick an image
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }
  // Function to upload image to Firebase Storage and return the URL
  Future<String> uploadImageToStorage(File file) async {
    String fileName = file.path.split('/').last;
    Reference ref = FirebaseStorage.instance.ref().child('posts/media/$fileName');
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
    // Return the download URL of the uploaded image
    return await taskSnapshot.ref.getDownloadURL();
  }
  // Function to create a post
  Future<void> createPost() async {
    try {
      // Get the current user's UID directly from FirebaseAuth
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        throw Exception('User not logged in');
      }

      String id = currentUser.uid; // Firebase Authentication UID

      // Upload the selected image to Firebase Storage and get the URL
      String? imageUrl;
      if (image.value != null) {
        imageUrl = await uploadImageToStorage(image.value!);
      }
      // Prepare the post data
      Map<String, dynamic> postData = {
        'id': id, // User ID from Firebase Authentication
        'aboutPost': aboutPost.value, // Post description
        'media': imageUrl != null ? [imageUrl] : [], // Image URL or empty if no image
        'createdAt': FieldValue.serverTimestamp(), // Post creation time
      };

      // Save the post data in Firestore under the 'posts' collection
      await FirebaseFirestore.instance.collection('posts').add(postData);

      showSuccessSnackBar('Post created successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

}
