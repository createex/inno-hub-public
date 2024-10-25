import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../../views/screens/user_profile_section/profile_screen.dart';
import '../utils/custom_snackbar_error_widget.dart';
import '../utils/image_picker.dart';

class UserProfileController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  // Image picker controllers
  final ImagePickerController imagePickerController = Get.find<ImagePickerController>();
  final ImagePickerController1 imagePickerController1 = Get.find<ImagePickerController1>();
  RxBool isLoading = false.obs;
  var company = "".obs;
  var about = "".obs;
  var chooseLooking = <String>[].obs; // Observable list for skills
  var skillsCommunity = <String>[].obs; // Observable list for skills
  var rolesCommunity = <String>[].obs; // Observable list for skills
  var industryInterests = <String>[].obs; // Observable list for skills
  var languageCommunity = <String>[].obs; // Observable list for skills


  // Fetch user data
// Fetch user data
  Future<Map<String, dynamic>> fetchUserData() async {
    try {
      isLoading.value = true;
      String uid = auth.currentUser!.uid;
      DocumentSnapshot userDoc = await firestore.collection("users").doc(uid).get();
      if (userDoc.exists) {
        final userData = userDoc.data() as Map<String, dynamic>;

        // Safely cast or provide a default empty string
        company.value = (userData['company'] ?? '') as String;
        about.value = (userData['about'] ?? '') as String;
        chooseLooking.value = List<String>.from(userData['chooseLooking'] ?? []); // Fetch skills community
        skillsCommunity.value = List<String>.from(userData['skillsCommunity'] ?? []); // Fetch skills community
        rolesCommunity.value = List<String>.from(userData['rolesCommunity'] ?? []); // Fetch skills community
        industryInterests.value = List<String>.from(userData['industryInterests'] ?? []); // Fetch skills community
        languageCommunity.value = List<String>.from(userData['languageCommunity'] ?? []); // Fetch skills community


        return userData;
      } else {
        showErrorSnackBar("User data does not exist.");
        return {};
      }
    } catch (e) {
      log("Error fetching user data: $e");
      showErrorSnackBar("Error fetching user data: ${e.toString()}");
      return {};
    } finally {
      isLoading.value = false;
    }
  }
// Update user profile data in Firestore
  Future<void> updateUserProfile({
    required String uid,
    required String username,
    required String about,
    required String currentPosition,
    required String company,
    required String location,
    required List<String> skills,
    required List<String> chooseLooking,
    required List<String> rolesCommunity,
    required List<String> industryInterests,
    required List<String> languageCommunity,
  }) async {
    isLoading.value = true;
    try {
      await firestore.collection('users').doc(uid).update({
        'userName': username,
        'about': about,
        'currentPosition': currentPosition,
        'company': company,
        'location': location,
        'skillsCommunity': skills,
        'chooseLooking': chooseLooking,
        'rolesCommunity': rolesCommunity,
        'industryInterests': industryInterests,
        'languageCommunity': languageCommunity,
      });
      log("User profile updated successfully");
      showSuccessSnackBar("User profile updated successfully");
      Get.to(()=>ProfileScreen());

    } catch (e) {
      log("Error updating user profile: $e");
      showErrorSnackBar("Failed to update profile.");
    } finally {
      isLoading.value = false;
    }
  }


  // Method to upload profile image to Firebase Storage
  Future<String> uploadImageToStorage(String imagePath) async {
    if (imagePath.trim().isEmpty) {
      log("Error: Image path is empty.");
      throw Exception("Image path is empty.");
    }

    File file = File(imagePath);
    if (!file.existsSync()) {
      log("Error: File does not exist at path: $imagePath");
      throw Exception("File does not exist.");
    }

    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = storage.ref().child('images').child(fileName);
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      log("Image uploaded successfully: $downloadURL");
      return downloadURL;
    } catch (e) {
      log("Error uploading image: $e");
      throw e;
    }
  }

  // Method to upload background image to Firebase Storage
  Future<String> uploadBackgroundImageToStorage(String imagePath) async {
    if (imagePath.trim().isEmpty) {
      log("Error: Background image path is empty.");
      throw Exception("Background image path is empty.");
    }

    File file = File(imagePath);
    if (!file.existsSync()) {
      log("Error: Background image file does not exist at path: $imagePath");
      throw Exception("Background image file does not exist.");
    }

    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = storage.ref().child('backgroundImages').child(fileName);
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      log("Background image uploaded successfully: $downloadURL");
      return downloadURL;
    } catch (e) {
      log("Error uploading background image: $e");
      throw e;
    }
  }

}
