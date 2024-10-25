import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/custom_snackbar_error_widget.dart';

class ProfileSectionController extends GetxController{
  //add workExperience
  final TextEditingController companyNameController=TextEditingController();
  final TextEditingController positionController=TextEditingController();
  final TextEditingController locationController=TextEditingController();
  //add educationExperience
  final TextEditingController universityNameController=TextEditingController();
  final TextEditingController studyFieldController=TextEditingController();
  final TextEditingController degreeController=TextEditingController();
  RxBool isActive = false.obs;
  RxBool isLoading = false.obs;
  // Observable lists to hold work and education experiences
  RxList<Map<String, dynamic>> workExperienceList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> educationExperienceList = <Map<String, dynamic>>[].obs;

  // Function to upload image to Firebase Storage and return the download URL
  Future<String> uploadImage(File imageFile) async {
    try {
      // Create a reference to the storage
      Reference ref = FirebaseStorage.instance.ref().child("logos/${DateTime.now().millisecondsSinceEpoch}.jpg");

      // Upload the file
      await ref.putFile(imageFile);

      // Get the download URL
      String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      throw e;
    }
  }
  Future<String> uploadImageToStorage(File imageFile) async {
    try {
      print("Uploading image: ${imageFile.path}"); // Debugging line
      // Create a reference to the Firebase Storage
      Reference storageRef = FirebaseStorage.instance.ref().child('education_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      // Upload the file
      UploadTask uploadTask = storageRef.putFile(imageFile);
      await uploadTask;

      // Get the download URL
      String downloadUrl = await storageRef.getDownloadURL();
      print("Image uploaded successfully. Download URL: $downloadUrl"); // Debugging line
      return downloadUrl;
    } catch (e) {
      print("Failed to upload image: $e");
      throw e; // Re-throw to handle in the calling function
    }
  }

// Add user workExperience
  Future<void> addWorkExperience({
    required String userId, // Accept userId as a parameter
    required File logoFile,
    required String companyName,
    required String position,
    required String location,
    required bool active,
    required DateTime startDate,
    DateTime? endDate,
  }) async {
    try {
      // Upload image and get the URL
      String logoUrl = await uploadImage(logoFile);
      // Create a new document with an auto-generated ID
      DocumentReference docRef = FirebaseFirestore.instance.collection('workExperience').doc();

      // Prepare data to be stored in Firestore
      Map<String, dynamic> workExperienceData = {
        'id': userId, // Document ID
        'logo': logoUrl, // URL or base64 string of the logo
        'companyName': companyName,
        'position': position,
        'location': location,
        'active': active,
        'start_date': Timestamp.fromDate(startDate), // Converting DateTime to Firestore Timestamp
        'end_date': endDate != null ? Timestamp.fromDate(endDate) : null, // Nullable end date
      };

      // Store the data in Firestore
      await docRef.set(workExperienceData);
      showSuccessSnackBar("Work experience added successfully!");
      print("Work experience added successfully!");

    } catch (e) {
      showErrorSnackBar("Failed to add work experience");
      print("Failed to add work experience: $e");
    }
  }



  // Add user educationExperience
  Future<void> addEducationExperience({
    required String userId,
    File? logoFileEducation,
    required String universityName,
    required String studyField,
    required String degree,
    required bool active,
    required DateTime startDate,
    DateTime? endDate,
  }) async {
    try {
      String? logoUrl; // Make logoUrl nullable

      // Only upload the image if it's selected (logoFileEducation is not null)
      if (logoFileEducation != null && logoFileEducation.existsSync()) {
        logoUrl = await uploadImageToStorage(logoFileEducation); // Upload image and get URL
      }

      // Create a new document with an auto-generated ID
      DocumentReference docRef = FirebaseFirestore.instance.collection('educationExperience').doc();

      // Prepare data to be stored in Firestore
      Map<String, dynamic> educationExperienceData = {
        'id': userId, // Document ID
        'logo': logoUrl, // URL of the uploaded image or null if no image is selected
        'universityName': universityName,
        'studyField': studyField,
        'degree': degree,
        'active': active,
        'start_date': Timestamp.fromDate(startDate), // Converting DateTime to Firestore Timestamp
        'end_date': endDate != null ? Timestamp.fromDate(endDate) : null, // Nullable end date
      };

      // Store the data in Firestore
      await docRef.set(educationExperienceData);
      showSuccessSnackBar("Education experience added successfully!");
      print("Education experience added successfully!");

    } catch (e) {
      showErrorSnackBar("Failed to add education experience");
      print("Failed to add education experience: $e");
    }
  }



  // Fetch work experiences
  Future<void> fetchWorkExperiences(String userId) async {
    try {
      isLoading.value = true; // Start loading

      // Query the workExperience collection where 'id' matches the userId
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('workExperience')
          .where('id', isEqualTo: userId)
          .get();

      // Check if documents were found
      if (snapshot.docs.isNotEmpty) {
        // Assign the fetched documents to the workExperienceList
        workExperienceList.assignAll(snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>));
        print("Fetched work experiences: ${workExperienceList.length}");
      } else {
        print("No work experiences found for userId: $userId");
      }
    } catch (e) {
      print("Failed to fetch work experiences: $e");
      // Optionally, show an error message in the UI
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  // Fetch education experiences
  Future<void> fetchEducationExperiences(String userId) async {
    try {
      isLoading.value = true; // Start loading
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('educationExperience')
          .where('id', isEqualTo: userId).get();
      educationExperienceList.assignAll(snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>));
      print("Fetched education experiences: ${educationExperienceList.length}");
    } catch (e) {
      print("Failed to fetch education experiences: $e");
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}