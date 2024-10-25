import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/getx_controllers/user_profile_controller.dart';
import '../../views/bottom_navigation_bar.dart';
import '../../views/screens/auth_section/login_screen.dart';
import '../../views/screens/auth_section/profile_info_screen_2.dart';
import '../utils/custom_snackbar_error_widget.dart';
import '../utils/image_picker.dart';

class AuthController extends GetxController {
  // Text Editing Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();
  final TextEditingController firstController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
  final TextEditingController recoverEmailForgotController = TextEditingController();

  // Firebase Instances
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  // Other Controllers
  ImagePickerController imagePickerController = Get.put(ImagePickerController());
  ImagePickerController1 imagePickerController1 = Get.put(ImagePickerController1());
  ProfessionalInformation2 professionalInformation2 = Get.put(ProfessionalInformation2());
  UserProfileController userProfileController =Get.put(UserProfileController());

  // Reactive Variables
  RxBool isLoading = false.obs;
  var firstName = ''.obs;
  var userName = ''.obs;
  var profession = ''.obs;
  var location = ''.obs;
  var lastName = ''.obs;
  var profileImage = ''.obs;
  var backgroundImage = ''.obs;
  RxString chooseLooking = ''.obs;
  final List<String> looking = ["looking 1", "looking 2", "looking 3", "looking 4"];
  RxString skillsCommunity = ''.obs;
  final List<String> skills = ["skills 1", "skills 2", "skills 3", "skills 4"];
  RxString rolesCommunity = ''.obs;
  final List<String> roles = ["roles 1", "roles 2", "roles 3", "roles 4"];
  RxString alreadyCommunity = ''.obs;
  final List<String> already = ["already 1", "already 2", "already 3", "already 4"];
  RxString preferCommunity = ''.obs;
  final List<String> prefer = ["prefer 1", "prefer 2", "prefer 3", "prefer 4"];
  RxString locationCommunity = ''.obs;
  final List<String> location1 = ["location 1", "location 2", "location 3", "location 4"];
  RxString availableCommunity = ''.obs;
  final List<String> available = ["available 1", "available 2", "available 3", "available 4"];
  RxString languageCommunity = ''.obs;
  final List<String> language = ["language 1", "language 2", "language 3", "language 4"];
  // Method to upload background image to Firebase Storage
  Future<String> uploadBackgroundImageToStorage(String imagePath) async {
    try {
      File file = File(imagePath);
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
  // Method to upload profile image to Firebase Storage
  Future<String> uploadImageToStorage(String imagePath) async {
    try {
      File file = File(imagePath);
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
// Call this method when the user updates their background image
  Future<String> updateBackgroundImage(String imagePath) async {
    String downloadUrl = await userProfileController.uploadBackgroundImageToStorage(imagePath);

    // Update Firestore with the new background image URL
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'backgroundImage': downloadUrl,
    });

    return downloadUrl; // Return the URL for immediate use
  }
  // Call this method when the user updates their profile image
  Future<String> updateProfileImage(String imagePath) async {
    log("Starting profile image update");

    String downloadUrl = await userProfileController.uploadImageToStorage(imagePath);

    // Update Firestore with the new profile image URL
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'profileImage': downloadUrl,
    });

    profileImage.value = downloadUrl; // Update the profile image observable
    return downloadUrl;
  }

  Future<void> signUpMethod() async {
    // Ensure all required community fields are selected
    if (chooseLooking.value.isEmpty || skillsCommunity.value.isEmpty ||
        rolesCommunity.value.isEmpty || alreadyCommunity.value.isEmpty ||
        preferCommunity.value.isEmpty || locationCommunity.value.isEmpty ||
        availableCommunity.value.isEmpty || languageCommunity.value.isEmpty) {
      showErrorSnackBar("Please select all required community fields before signing up.");
      return; // Exit the method if validation fails
    }

    try {
      isLoading.value = true;

      // Create user with email and password
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      String uid = userCredential.user!.uid;

      // Upload profile image and get URL
      String imageUrl = await uploadImageToStorage(imagePickerController.imagePath.value);

      // Check if background image is selected
      String backgroundImageUrl = "";
      if (imagePickerController1.backgroundImagePath.value.isNotEmpty) {
        backgroundImageUrl = await uploadImageToStorage(imagePickerController1.backgroundImagePath.value);
      }

      // Store user data in Firestore
      await firestore.collection("users").doc(uid).set({
        "emailName": emailController.text.trim(),
        "referralCode": referralController.text.trim(),
        "firstName": firstController.text.trim(),
        "lastName": lastController.text.trim(),
        "userName": userNameController.text.trim(),
        "profession": professionController.text.trim(),
        "location": locationController.text.trim(),
        "profileImage": imageUrl,
        "backgroundImage": backgroundImageUrl, // Use the background image URL
        "chooseLooking": chooseLooking.value,
        "skillsCommunity": skillsCommunity.value,
        "rolesCommunity": rolesCommunity.value,
        "alreadyCommunity": alreadyCommunity.value,
        "preferCommunity": preferCommunity.value,
        "locationCommunity": locationCommunity.value,
        "availableCommunity": availableCommunity.value,
        "languageCommunity": languageCommunity.value,
        "createdAt": FieldValue.serverTimestamp(),
      });
      showSuccessSnackBar("Sign Up Data Added Successfully!");
      Get.to(() => LoginScreen());
    } catch (e) {
      log("Error during sign-up: $e");
      showErrorSnackBar("Error: ${e.toString()}");
    } finally {
      isLoading.value = false; // Ensure loading is stopped
    }
  }

  //Login Method
  Future<void> loginMethod() async {
    var userEmail = emailLoginController.text.trim();
    var userPassword = passwordLoginController.text.trim();

    // Basic validation
    if (userEmail.isEmpty || userPassword.isEmpty) {
      showErrorSnackBar("Email and password are required");
      return;
    } else if (!isValidEmail.hasMatch(userEmail)) {
      showErrorSnackBar("Invalid email format");
      return;
    } else if (!isValidPassword.hasMatch(userPassword)) {
      showErrorSnackBar("Invalid password format");
      return;
    }

    try {
      isLoading.value = true;

      // Authenticate with Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      log("User signed in successfully");
      Get.to(() => const BottomNavigationScreen());
      // Fetch user document from Firestore using the uid from FirebaseAuth
      String uid = userCredential.user!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (!userDoc.exists) {
        // Handle case if user does not exist in Firestore
        showErrorSnackBar("No user found with this email");
        isLoading.value = false;
        return;
      }

      // User exists in Firestore, login successful
      log("User found in Firestore: ${userDoc.data()}");

    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      log("FirebaseAuthException: $e");

      if (e.code == 'user-not-found') {
        showErrorSnackBar("No user found with this email.");
      } else if (e.code == 'wrong-password') {
        showErrorSnackBar("Incorrect password.");
      } else {
        showErrorSnackBar("Error signing in: ${e.message}");
      }
    } catch (e) {
      isLoading.value = false;
      log("Error: $e");
      showErrorSnackBar("An error occurred. Please try again.");
    } finally {
      isLoading.value = false; // Ensure loading stops
    }
  }
  Future<Map<String, dynamic>> fetchUserDataImages() async {
    try {
      isLoading.value = true;
      String uid = auth.currentUser!.uid;
      DocumentSnapshot userDoc = await firestore.collection("users").doc(uid).get();
      if (userDoc.exists) {
        final userData = userDoc.data() as Map<String, dynamic>;

        profileImage.value = userData['profileImage'] ?? '';
        backgroundImage.value = userData['backgroundImage'] ?? '';

        return userData;
      }
      // Handle else case
    } catch (e) {
      log("Error fetching user data: $e");
      showErrorSnackBar("Error fetching user data: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
    return {};
  }
// Fetch user data from Firestore based on UID
  Future<void> fetchUserData(String uid) async {
    try {
      DocumentSnapshot userDoc = await firestore.collection('users').doc(uid).get();
      if (userDoc.exists) {
        firstName.value = userDoc['firstName'] ?? '';
        lastName.value = userDoc['lastName'] ?? '';
        userName.value = userDoc['userName'] ?? '';
        profession.value = userDoc['profession'] ?? '';
        location.value = userDoc['location'] ?? '';
        profileImage.value = userDoc['profileImage'] ?? '';
        backgroundImage.value = userDoc['backgroundImage'] ?? '';
      } else {
        Get.snackbar('Error', 'User not found');
      }
    } catch (e) {
      log("Error fetching user data: $e");
      Get.snackbar('Error', 'Failed to fetch user data');
    }
  }
  // Method to check if email exists
  Future<bool> checkEmail() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection("users")
          .where("emailName", isEqualTo: emailController.text.trim())
          .get();
      return querySnapshot.docs.isNotEmpty; // Returns true if email exists
    } catch (e) {
      log("Error checking email: $e");
      return false; // Return false in case of an error
    }
  }
  // Forgot Password
  Future<void> forgotPasswordMethod() async {
    if (recoverEmailForgotController.text.trim().isEmpty) {
      showErrorSnackBar("Please enter your email address.");
      return;
    }
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.sendPasswordResetEmail(email: recoverEmailForgotController.text.trim());
      showSuccessSnackBar("We have sent you an email to recover your password.");
      recoverEmailForgotController.clear();
      Get.to(LoginScreen());
    } catch (error) {
      showErrorSnackBar(error.toString());
    } finally {
      isLoading.value = false;
    }
  }

// Logout method
  Future<void> logoutMethod() async {
    try {
      // Start loading state
      isLoading.value = true;

      // Sign out the current user
      await auth.signOut();

      // Navigate to the login screen
      Get.offAll(() => LoginScreen());

      log("User logged out successfully.");
      showSuccessSnackBar("User logged out successfully.");

    } catch (e) {
      log("Error during logout: $e");
      showErrorSnackBar("Error logging out. Please try again.");
    } finally {
      // Stop loading state
      isLoading.value = false;
    }
  }

}


RegExp isValidEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

RegExp isValidPassword = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');