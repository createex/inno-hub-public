import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimePickerController extends GetxController {
  // Store the selected time
  Rx<TimeOfDay> selectedEndTime = TimeOfDay.now().obs;

  // Function to pick time
  Future<void> selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedEndTime.value,
    );
    if (pickedTime != null && pickedTime != selectedEndTime.value) {
      selectedEndTime.value = pickedTime;
    }
  }
}
