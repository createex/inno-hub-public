import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Add Firebase Authentication package
import 'package:in_hub/views/bottom_navigation_bar.dart';
import 'package:in_hub/views/screens/auth_section/signup_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then(
          (value) {
        _checkLoginStatus(); // Check login status after splash screen delay
      },
    );
  }

  void _checkLoginStatus() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Get.off(() => const BottomNavigationScreen());
    } else {
      Get.off(() => SignUpScreen());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/pngs/splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
