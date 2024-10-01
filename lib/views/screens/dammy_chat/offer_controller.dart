import 'package:get/get.dart';

class OfferController extends GetxController {
  // Define reactive variables
  var isOfferCreated = false.obs;
  var isVisitedProposal = false.obs;

  // Method to handle the 'Send' button action
  void sendOffer() {
    isOfferCreated.value = true;
    // Add any additional logic for sending the offer here
  }
  void visitProposal() {
    isVisitedProposal.value = true;
    // Add any additional logic for sending the offer here
  }
}
