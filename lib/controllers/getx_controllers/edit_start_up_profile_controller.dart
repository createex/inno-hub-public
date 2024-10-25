import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/custom_snackbar_error_widget.dart';

class EditStartUpProfileController extends GetxController {
  final TextEditingController startUpFieldController = TextEditingController();
  final TextEditingController startUpNameController = TextEditingController();
  final TextEditingController startUpUserNameController = TextEditingController();
  final TextEditingController startUpCompanyOverviewController = TextEditingController();
  final TextEditingController startUpChallengesController = TextEditingController();
  final TextEditingController startUpVisionController = TextEditingController();
  final TextEditingController startUpLookingController = TextEditingController();
  final TextEditingController startUpProductStatusController = TextEditingController();
  final TextEditingController startUpTechnologyController = TextEditingController();
  final TextEditingController startUpMarketAndCustomersController = TextEditingController();
  final TextEditingController startUpTargetMarketController = TextEditingController();
  final TextEditingController startUpCompanySizeController = TextEditingController();
  final TextEditingController startUpFoundingAndGrowthController = TextEditingController();
  final TextEditingController startUpFoundingStageController = TextEditingController();
  final TextEditingController startUpInvestStageController = TextEditingController();
  final TextEditingController startUpTeamController = TextEditingController();
  final TextEditingController startUpLocationController = TextEditingController();
  final TextEditingController startUpWebsiteController = TextEditingController();

  var isLoading = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var profileImageUrl = ''.obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      String url = await uploadImageToFirebase(image.path);
      profileImageUrl.value = url; // Update the observable variable
    }
  }

  Future<String> uploadImageToFirebase(String imagePath) async {
    try {
      File file = File(imagePath);
      Reference storageReference = FirebaseStorage.instance.ref().child('profile_images/${DateTime.now().millisecondsSinceEpoch}.png');

      UploadTask uploadTask = storageReference.putFile(file);
      await uploadTask;

      String downloadUrl = await storageReference.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return '';
    }
  }

  Future<void> fetchStartupProfile(String documentId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('startUpProfiles').doc(documentId).get();
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        startUpNameController.text = data['startUpName'];
        startUpChallengesController.text = data['challenges'];
        startUpCompanyOverviewController.text = data['companyOverview'];
        startUpFieldController.text = data['startUpField'];
        startUpCompanySizeController.text = data['companySize'];
        startUpFoundingAndGrowthController.text = data['foundingAndGrowth'];
        startUpFoundingStageController.text = data['foundingStage'];
        startUpInvestStageController.text = data['investStage'];
        startUpLookingController.text = data['lookingFor'];
        startUpMarketAndCustomersController.text = data['marketAndCustomers'];
        startUpProductStatusController.text = data['productStatus'];
        startUpLocationController.text = data['startUpLocation'];
        startUpUserNameController.text = data['startUpUserName'];
        startUpWebsiteController.text = data['startUpWebsite'];
        startUpTargetMarketController.text = data['targetMarket'];
        startUpTeamController.text = data['team'];
        startUpTechnologyController.text = data['technology'];
        startUpVisionController.text = data['vision'];
        profileImageUrl.value = data.containsKey('profileImage') ? data['profileImage'] : 'default_image_url';
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load profile: $e');
    }
  }

  Future<void> updateStartUpProfile(String documentId) async {
    try {
      isLoading.value = true;
      print("Updating profile for document ID: $documentId");
      print("Profile data: ${{
        'startUpName': startUpNameController.text,
        'challenges': startUpChallengesController.text,
        // Add other fields here for debugging
      }}");

      await _firestore.collection('startUpProfiles').doc(documentId).update({
        'startUpName': startUpNameController.text,
        'challenges': startUpChallengesController.text,
        'companyOverview': startUpCompanyOverviewController.text,
        'startUpField': startUpFieldController.text,
        'companySize': startUpCompanySizeController.text,
        'foundingAndGrowth': startUpFoundingAndGrowthController.text,
        'foundingStage': startUpFoundingStageController.text,
        'investStage': startUpInvestStageController.text,
        'lookingFor': startUpLookingController.text,
        'marketAndCustomers': startUpMarketAndCustomersController.text,
        'productStatus': startUpProductStatusController.text,
        'startUpLocation': startUpLocationController.text,
        'startUpUserName': startUpUserNameController.text,
        'startUpWebsite': startUpWebsiteController.text,
        'targetMarket': startUpTargetMarketController.text,
        'team': startUpTeamController.text,
        'technology': startUpTechnologyController.text,
        'vision': startUpVisionController.text,
        'profileImage': profileImageUrl.value
      });
      showSuccessSnackBar("Startup profile updated successfully");
      Get.back();
    } catch (e) {
      showErrorSnackBar('Failed to update profile: $e');
    } finally {
      isLoading.value = false; // Reset loading state after operation
    }
  }
}
