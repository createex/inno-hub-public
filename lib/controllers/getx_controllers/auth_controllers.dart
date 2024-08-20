// import 'dart:async';
// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:in_hub/controllers/utils/preference_keys.dart';
// import 'package:in_hub/views/screens/auth_section/login_screen.dart';
// import 'package:in_hub/views/screens/chat_section/main_chat.dart';
// import 'package:in_hub/views/screens/profile_section/profileinformation.dart';
// import '../my_sharedpreference.dart';
// import 'user_profile_controller.dart';
//
// class AuthController extends GetxController {
//   final BuildContext context;
//   AuthController({required this.context});
//
//   // Firebase Authentication
//   FirebaseAuth auth = FirebaseAuth.instance;
//   RxBool isLoading = false.obs;
//   Timer? _verificationTimer;
//   final UserProfileController userProfileController =
//       Get.put(UserProfileController());
//   Future<void> signUpUserWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       isLoading.value = true;
//
//       UserCredential credential = await auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       User? user = credential.user;
//       // var uid = FirebaseAuth.instance.currentUser!.uid;
//       // userProfileController.storeUserData(
//       //     name: name,
//       //     email: email,
//       //     password: password,
//       //     uid: uid,
//       //     profileImage: '',
//       //     module: []
//       // );
//       if (user != null) {
//         await user.sendEmailVerification();
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'User created successfully. Please check your email for verification.',
//               ),
//             ),
//           );
//           // Start checking email verification status
//           _startEmailVerificationCheck();
//         }
//       }
//       isLoading.value = false;
//     } on FirebaseAuthException catch (e) {
//       isLoading.value = false;
//       if (e.code == 'weak-password') {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('The password provided is too weak.')),
//           );
//         }
//       } else if (e.code == 'email-already-in-use') {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('The account already exists for that email.')),
//           );
//         }
//       } else {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('An unknown error occurred.')),
//           );
//         }
//       }
//     } catch (e) {
//       isLoading.value = false;
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('An unknown error occurred.')),
//         );
//       }
//     }
//   }
//
// //User Login with email and Password
//   Future<void> userLoginWithEmailAndPassword(
//       {required email, required password}) async {
//     try {
//       isLoading.value = true;
//       UserCredential credential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       isLoading.value = false;
//       User? user = credential.user;
//       if (user != null) {
//         if (context.mounted) {
//           log('userid :${user.uid}');
//           MySharedPreferences.setString('token', user.uid);
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'User Login successfully',
//               ),
//             ),
//           );
//         }
//         Get.to(() => const InboxMainChatScreen());
//         MySharedPreferences.setBool(isLoggedInKey, true);
//         final bool isLogin = MySharedPreferences.getBool(isLoggedInKey);
//         log("isLogin or not :$isLogin");
//         isLoading.value = false;
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "invalid-email") {
//         if (context.mounted) {
//
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'invalid-email ! Please enter valid email',
//               ),
//             ),
//           );
//         }
//         isLoading.value = false;
//       } else if (e.code == "wrong-password") {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'wrong-password ! Please enter valid Password',
//               ),
//             ),
//           );
//         }
//         isLoading.value = false;
//       } else {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'user-not-found ! Please create new Account',
//               ),
//             ),
//           );
//         }
//         isLoading.value = false;
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text(
//               'unexpected error Occurred! Please try again',
//             ),
//           ),
//         );
//       }
//     }
//   }
//
//   //Reset Password
//   //User Login with email and Password
//   Future<void> resetPasswordByEmailLink({
//     required email,
//   }) async {
//     try {
//       isLoading.value = true;
//       await auth.sendPasswordResetEmail(
//         email: email,
//       );
//       isLoading.value = false;
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text(
//               'Password reset email sent',
//             ),
//           ),
//         );
//       }
//       Get.to(() => LoginScreen());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "invalid-email") {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'invalid-email ! Please enter valid email',
//               ),
//             ),
//           );
//         }
//         isLoading.value = false;
//       } else {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text(
//                 'user-not-found ! Please create new Account',
//               ),
//             ),
//           );
//         }
//         isLoading.value = false;
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text(
//               'unexpected error Occurred! Please try again',
//             ),
//           ),
//         );
//       }
//     }
//   }
//
//   // Email Verification
//   Future<bool> checkEmailVerification() async {
//     User? user = auth.currentUser;
//     if (user != null) {
//       await user.reload();
//       user = auth.currentUser;
//       return user!.emailVerified;
//     }
//     return false;
//   }
//
//   // Start checking email verification status periodically
//   void _startEmailVerificationCheck() {
//     _verificationTimer =
//         Timer.periodic(const Duration(seconds: 5), (timer) async {
//       bool isEmailVerified = await checkEmailVerification();
//       if (isEmailVerified) {
//         _verificationTimer?.cancel();
//         Get.offAll(() => ProfessionalInformation());
//       }
//     });
//   }
//
//   // Cancel the timer when the controller is disposed
//   @override
//   void onClose() {
//     _verificationTimer?.cancel();
//     super.onClose();
//   }
// }
