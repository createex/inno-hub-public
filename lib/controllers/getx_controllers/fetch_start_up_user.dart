import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FetchStartProfileController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  var challenges = "".obs;
  var companyOverview = "".obs;
  var companySize = "".obs;
  var foundingAndGrowth = "".obs;
  var foundingStage = "".obs;
  var investStage = "".obs;
  var lookingFor = "".obs;
  var marketAndCustomers = "".obs;
  var productStatus = "".obs;
  var startUpField = "".obs;
  var startUpLocation = "".obs;
  var startUpName = "".obs;
  var startUpUserName = "".obs;
  var startUpWebsite = "".obs;
  var targetMarket = "".obs;
  var team = "".obs;
  var technology = "".obs;
  var vision = "".obs;
  var profileImage = "".obs;

  void fetchUserDataStartUpProfiles(String documentId) {
    try {
      FirebaseFirestore.instance
          .collection('startUpProfiles')
          .doc(documentId)
          .snapshots()
          .listen((DocumentSnapshot userDoc) {
        if (userDoc.exists) {
          challenges.value = userDoc['challenges'] ?? '';
          companyOverview.value = userDoc['companyOverview'] ?? '';
          companySize.value = userDoc['companySize'] ?? '';
          foundingAndGrowth.value = userDoc['foundingAndGrowth'] ?? '';
          foundingStage.value = userDoc['foundingStage'] ?? '';
          investStage.value = userDoc['investStage'] ?? '';
          lookingFor.value = userDoc['lookingFor'] ?? '';
          marketAndCustomers.value = userDoc['marketAndCustomers'] ?? '';
          productStatus.value = userDoc['productStatus'] ?? '';
          profileImage.value = userDoc['profileImage'] ?? '';
          startUpField.value = userDoc['startUpField'] ?? '';
          startUpLocation.value = userDoc['startUpLocation'] ?? '';
          startUpName.value = userDoc['startUpName'] ?? '';
          startUpUserName.value = userDoc['startUpUserName'] ?? '';
          startUpWebsite.value = userDoc['startUpWebsite'] ?? '';
          targetMarket.value = userDoc['targetMarket'] ?? '';
          team.value = userDoc['team'] ?? '';
          technology.value = userDoc['technology'] ?? '';
          vision.value = userDoc['vision'] ?? '';
        } else {
          Get.snackbar('Error', 'User not found');
        }
      });
    } catch (e) {
      log("Error fetching user data: $e");
      Get.snackbar('Error', 'Failed to fetch user data');
    }
  }
}
