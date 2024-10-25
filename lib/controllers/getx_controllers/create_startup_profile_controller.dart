import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_hub/controllers/getx_controllers/picture_controller.dart';
import 'package:in_hub/controllers/utils/custom_snackbar_error_widget.dart';
import 'package:in_hub/models/start_up_profile_model.dart';


class CreateStartUpProfileController extends GetxController {
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

  PictureController  pictureController =Get.put(PictureController());
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  var startupList = <StartupProfileModel>[].obs; // Ensure this is a list of StartupProfile
  var chooseStartUp = ''.obs;
  RxBool isLoading=false.obs;
  final ImagePicker _picker = ImagePicker();

  RxString profileImage = ''.obs; // To store the profile image URL
  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Upload the selected image to Firebase Storage and get the URL
        String imageUrl = await uploadImage(pickedFile.path);
        profileImage.value = imageUrl; // Update the profile image URL
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  // Function to upload image to Firebase Storage
  Future<String> uploadImage(String filePath) async {
    File file = File(filePath);
    String fileName = 'profileImagesStartUp/${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      // Upload the file to Firebase Storage
      TaskSnapshot snapshot = await _storage.ref(fileName).putFile(file);
      // Get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl; // Return the image URL
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload image: $e');
      rethrow;
    }
  }
// Call this method when the user updates their background image
  // Function to validate if all fields are filled
  bool _validateFields() {
    if (startUpNameController.text.isEmpty ||
        startUpFieldController.text.isEmpty ||
        startUpLocationController.text.isEmpty ||
        startUpWebsiteController.text.isEmpty ||
        startUpUserNameController.text.isEmpty ||
        startUpCompanyOverviewController.text.isEmpty ||
        startUpChallengesController.text.isEmpty ||
        startUpVisionController.text.isEmpty ||
        startUpLookingController.text.isEmpty ||
        startUpProductStatusController.text.isEmpty ||
        startUpTechnologyController.text.isEmpty ||
        startUpMarketAndCustomersController.text.isEmpty ||
        startUpTargetMarketController.text.isEmpty ||
        startUpCompanySizeController.text.isEmpty ||
        startUpFoundingAndGrowthController.text.isEmpty ||
        startUpFoundingStageController.text.isEmpty ||
        startUpInvestStageController.text.isEmpty ||
        startUpTeamController.text.isEmpty) {
      return false;
    }
    return true;
  }

  // Function to save startup profile data to Firestore
  Future<void> saveStartUpProfile(String userId) async {
    // Validate all fields first
    if (!_validateFields()) {
      showErrorSnackBar('Please fill all the fields before proceeding');
      return;
    }

    isLoading.value = true; // Set loading state to true
    try {
      // Create a new document reference in Firestore
      DocumentReference docRef = _firestore.collection('startUpProfiles').doc();

      // Set the data for the new startup profile
      await docRef.set({
        "profileImage": profileImage.value, // Profile image URL
        "backgroundImage": "", // Initially empty
        'userId': userId, // User ID
        'startUpName': startUpNameController.text, // Startup name
        'startUpField': startUpFieldController.text, // Startup field
        'startUpLocation': startUpLocationController.text, // Location
        'startUpWebsite': startUpWebsiteController.text, // Website URL
        'startUpUserName': startUpUserNameController.text, // Username
        'companyOverview': startUpCompanyOverviewController.text, // Company overview
        'challenges': startUpChallengesController.text, // Challenges faced
        'vision': startUpVisionController.text, // Vision statement
        'lookingFor': startUpLookingController.text, // What the startup is looking for
        'productStatus': startUpProductStatusController.text, // Product status
        'technology': startUpTechnologyController.text, // Technology used
        'marketAndCustomers': startUpMarketAndCustomersController.text, // Market and customers
        'targetMarket': startUpTargetMarketController.text, // Target market
        'companySize': startUpCompanySizeController.text, // Size of the company
        'foundingAndGrowth': startUpFoundingAndGrowthController.text, // Founding and growth information
        'foundingStage': startUpFoundingStageController.text, // Founding stage
        'investStage': startUpInvestStageController.text, // Investment stage
        'team': startUpTeamController.text, // Team information
        'createdAt': FieldValue.serverTimestamp(), // Timestamp to track creation time
      });

      // Store the document ID in PictureController for later use
      pictureController.docId = docRef.id;

      isLoading.value = false; // Set loading state to false
      Get.back(); // Close the current screen

      // Show a success message
      showSuccessSnackBar('Startup profile has been created successfully');

      // Optionally clear the controllers after successful submission
      clearControllers();

    } catch (e) {
      isLoading.value = false; // Set loading state to false in case of error
      showErrorSnackBar('Failed to create startup profile: $e'); // Show error message
    }
  }

  //Clear all text controllers
  void clearControllers() {
    startUpNameController.clear();
    startUpUserNameController.clear();
    startUpCompanyOverviewController.clear();
    startUpChallengesController.clear();
    startUpVisionController.clear();
    startUpLookingController.clear();
    startUpProductStatusController.clear();
    startUpTechnologyController.clear();
    startUpMarketAndCustomersController.clear();
    startUpTargetMarketController.clear();
    startUpCompanySizeController.clear();
    startUpFoundingAndGrowthController.clear();
    startUpFoundingStageController.clear();
    startUpInvestStageController.clear();
    startUpTeamController.clear();
  }


  Stream<List<StartupProfileModel>> fetchUserStartups(String userId) {
    return _firestore
        .collection('startUpProfiles')
        .where('userId', isEqualTo: userId) // Filter by userId
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        String startUpName = doc['startUpName'];
        String challenges = doc['challenges'];
        String companyOverview = doc['companyOverview'];
        String startUpField = doc['startUpField'];
        String companySize = doc['companySize'];
        String foundingAndGrowth = doc['foundingAndGrowth'];
        String foundingStage = doc['foundingStage'];
        String investStage = doc['investStage'];
        String lookingFor = doc['lookingFor'];
        String marketAndCustomers = doc['marketAndCustomers'];
        String productStatus = doc['productStatus'];
        String startUpLocation = doc['startUpLocation'];
        String startUpUserName = doc['startUpUserName'];
        String startUpWebsite = doc['startUpWebsite'];
        String targetMarket = doc['targetMarket'];
        String team = doc['team'];
        String technology = doc['technology'];
        String vision = doc['vision'];
        String backgroundImage = doc.data().containsKey('backgroundImage') ? doc['backgroundImage'] : 'default_image_url';
        String profileImage = doc.data().containsKey('profileImage') ? doc['profileImage'] : 'default_image_url';
        String documentId = doc.id;
// Check for profileImage
        return StartupProfileModel(
            startUpName: startUpName,
            profileImage: profileImage,
            documentId: documentId,
          challenges: challenges,
          companyOverview: companyOverview,
          startUpField: startUpField,
          companySize: companySize,
          foundingAndGrowth: foundingAndGrowth,
          foundingStage: foundingStage,
          investStage: investStage,
          lookingFor: lookingFor,
          marketAndCustomers: marketAndCustomers,
          productStatus: productStatus,
          startUpLocation: startUpLocation,
          startUpUserName: startUpUserName,
          startUpWebsite: startUpWebsite,
          targetMarket: targetMarket,
          team: team,
          technology: technology,
          vision: vision,
          backgroundImage: backgroundImage,
        );
      }).toList();
    });
  }

  void listenForStartups(String userId) {
    fetchUserStartups(userId).listen((startups) {
      startupList.assignAll(startups); // Update the list in real-time
    });
  }
//



}
