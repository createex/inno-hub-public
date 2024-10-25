import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class PictureController extends GetxController {
  var backgroundImage = ''.obs;
  String docId = '';
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final ImagePicker picker = ImagePicker();

  // Method to pick a background image
  Future<void> pickBackgroundImage(String docId) async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        String imageUrl = await uploadImageBackground(pickedFile.path);
        backgroundImage.value = imageUrl; // Update background image URL

        // Optional: Save the new background image URL to Firestore
        await saveBackgroundImageToFirestore(imageUrl,docId);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  // Method to upload image to Firebase Storage
  Future<String> uploadImageBackground(String filePath) async {
    File file = File(filePath);
    String fileName = 'backgrounds/${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      TaskSnapshot snapshot = await _storage.ref(fileName).putFile(file);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl; // Return the image URL
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload image: $e');
      rethrow;
    }
  }

  // Function to save the background image URL to Firestore
  Future<void> saveBackgroundImageToFirestore(String imageUrl, String docId) async {
    try {
      // Update the Firestore document with the background image
      await FirebaseFirestore.instance
          .collection('startUpProfiles')
          .doc(docId)
          .update({
        'backgroundImage': imageUrl,
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to save image to Firestore: $e');
    }
  }

  // Fetch the background image URL from Firestore using document ID
  Future<void> fetchBackgroundImage(String docId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('startUpProfiles')
          .doc(docId)
          .get();
      if (doc.exists) {
        backgroundImage.value = doc['backgroundImage'] ?? '';
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch background image: $e');
    }
  }
}
