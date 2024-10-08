import 'dart:developer';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileController extends GetxController {
//  Store User data when user signUp
  Future<void> storeUserData({
    required String uid,
    required String name,
    required String email,
    required String password,
    required String profileImage,
    required List<String> module,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection('users').doc(uid).set({
        "userId": uid,
        "userName": name,
        "userEmail": email,
        "userPassword": password,
        "profileImage": profileImage,
        "module": FieldValue.arrayUnion(module),
      });
    } catch (e) {
      log('unexpected error occurred :${e.toString()}');
    }
  }

  // var userData =
  // Rx<UserProfileModel?>(null); // Rx variable for a single user's data
  //
  // Future<void> fetchUserData({required String uid}) async {
  //   try {
  //     var snapshot =
  //     await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //     if (snapshot.exists) {
  //       userData.value = UserProfileModel.fromMap(snapshot.data()!);
  //     } else {
  //       throw Exception("User document does not exist.");
  //     }
  //   } catch (e) {
  //     log('Error fetching user data: ${e.toString()}');
  //   }
  // }
  // final RxBool isLoading=false.obs;
  // //Update user Profile
  // Future<void> updateUserProfile({
  //   required BuildContext context,
  //   required String uid,
  //   required String name,
  //   required String email,
  //   required String country,
  //   required String profileImage,
  //   required List<String> module,
  // }) async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   try {
  //     isLoading.value=true;
  //     await firestore.collection('users').doc(uid).update({
  //       "userName": name,
  //       "userEmail": email,
  //       "country": country,
  //       "profileImage": profileImage,
  //       "module": FieldValue.arrayUnion(module),
  //     }).then((value) {
  //       isLoading.value=false;
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile Update Successfully')));
  //     });
  //
  //   } catch (e) {
  //     isLoading.value=false;
  //
  //     log('unexpected error occurred :${e.toString()}');
  //   }
  // }

  //Image Picked From Gallery
  // var image = Rx<File?>(null);
  // final ImagePicker picker = ImagePicker();
  // Future<void> pickedImageFromGallery({required BuildContext context}) async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     image.value = File(pickedFile.path);
  //   } else {
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text('No image selected')));
  //     }
  //   }
  // }

// Add this method to your UserProfileController
  Future<void> updateUserProfile({
    required String uid,
    required String username,
    required String about,
    required String currentPosition,
    required String company,
    required String location,
    required List<String> skills,
    required List<String> lookingForItems,
    required List<String> rolesList,
    required List<String> industryInterests,
    required List<String> languages,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection('users').doc(uid).update({
        "userName": username,
        "about": about,
        "currentPosition": currentPosition,
        "company": company,
        "location": location,
        "skills": FieldValue.arrayUnion(skills),
        "lookingFor": FieldValue.arrayUnion(lookingForItems),
        "roles": FieldValue.arrayUnion(rolesList),
        "industryInterests": FieldValue.arrayUnion(industryInterests),
        "languages": FieldValue.arrayUnion(languages),
      });
      log('User profile updated successfully for uid: $uid');
    } catch (e) {
      log('Error updating user profile: ${e.toString()}');
    }
  }
}
