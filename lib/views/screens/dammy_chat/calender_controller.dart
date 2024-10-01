import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_color.dart';
class CalendarController extends GetxController {
  var selectedStartDate = DateTime.now().obs;
  var selectedEndDate = DateTime.now().obs;

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedStartDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: CustomColor.orangeColor1,
            colorScheme: const ColorScheme.light(primary: CustomColor.orangeColor1),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      selectedStartDate.value = pickedDate;
    }
  }

  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedEndDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: CustomColor.orangeColor1,
            colorScheme: ColorScheme.light(primary: CustomColor.orangeColor1),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      selectedEndDate.value = pickedDate;
    }
  }
}
