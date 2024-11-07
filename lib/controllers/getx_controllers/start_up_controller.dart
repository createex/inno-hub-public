import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/start_up_model.dart';

class StartUpController extends GetxController {
  RxList<StartUpModel> startupProfiles = <StartUpModel>[].obs;

  var selectedStartupId = ''.obs; // Observable for the selected startup ID
  var selectedStartupProfileImage = ''.obs; // Existing observable
  var selectedStartupName = ''.obs; // Existing observable
  @override
  void onInit() {
    super.onInit();
    fetchStartUpProfiles();
  }
  // Method to select a startup and set its ID and other properties
  void selectStartup(String documentId, String profileImage, String name) {
    selectedStartupId.value = documentId; // Set selected startup ID
    selectedStartupProfileImage.value = profileImage; // Set profile image
    selectedStartupName.value = name; // Set startup name
  }

  // Example function in HomeController
  Future<String?> fetchStartupDocId(String startupName) async {
    // Replace this with your actual Firestore query
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('startUpProfiles')
        .where('startUpName', isEqualTo: startupName)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.id; // Return the first matched document ID
    }
    return null; // Return null if not found
  }
}
