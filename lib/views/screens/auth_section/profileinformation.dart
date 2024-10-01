import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:in_hub/views/screens/auth_section/profile_info_screen_2.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/getx_controllers/auth_controllers.dart';
import '../../../controllers/utils/custom_snackbar_error_widget.dart';
import '../../../controllers/utils/image_picker.dart';
import '../../custom_widget/custom_textfield_new.dart';

class ProfessionalInformation extends StatelessWidget {
  ProfessionalInformation({super.key});
  final RxBool isOpen = false.obs;
  final RxInt isSelected = 0.obs;
  final RxBool isSelectLocation = false.obs;
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    ImagePickerController imagePickerController=Get.put(ImagePickerController());

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/pngs/background_image.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/pngs/app_logo.png"),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Profile Information",
                    style: AppTextStyles.boldTextStyle,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      imagePickerController.getImage(); // Trigger image picker
                    },
                    child: Obx(() => imagePickerController.imagePath.isNotEmpty
                        ? Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(File(imagePickerController.imagePath.toString())),
                          fit: BoxFit.cover, // To cover the circular container
                        ),
                      ),
                    )
                        : Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/pngs/innoHubProfile.png'),
                          fit: BoxFit.cover, // To cover the circular container
                        ),
                      ),
                    )),
                  ),

                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: customTextFormField(
                          prefix: "assets/svgs/nameicon.svg",
                          controller:authController.firstController,
                          title: "First name",
                        ),
                      ),
                      SizedBox(
                        width: 1.5.h,
                      ),
                      Expanded(
                        child: customTextFormField(
                          prefix: "assets/svgs/nameicon.svg",
                          controller:authController.lastController,
                          title: "last name",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                   CustomTextFormField1(controller: authController.userNameController,
                    hintText: "UserName",),

                  // SizedBox(
                  //   height: 1.6.h,
                  // ),
                  // customTextFormField(
                  //   title: "Phone number",
                  // ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                   CustomTextFormField1(controller: authController.professionController,
                    hintText: "Profession",),

                  SizedBox(
                    height: 1.6.h,
                  ),
                   CustomTextFormField1(controller:authController.locationController,
                    hintText: "Location",),
                  SizedBox(height: 3.h,),
                  Obx(()=>                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 18.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: customElevatedButton(
                              bgColor: AppColors.primaryColor,
                              onTap: () async {
                                // Validate fields before proceeding
                                if (authController.firstController.text.isEmpty) {
                                  showErrorSnackBar("First Name cannot be empty");
                                  return;
                                } else if (authController.lastController.text.isEmpty) {
                                  showErrorSnackBar("Last Name cannot be empty");
                                  return;
                                } else if (authController.userNameController.text.isEmpty) {
                                  showErrorSnackBar("User Name cannot be empty");
                                  return;
                                } else if (authController.professionController.text.isEmpty) {
                                  showErrorSnackBar("Profession cannot be empty");
                                  return;
                                } else if (authController.locationController.text.isEmpty) {
                                  showErrorSnackBar("Location cannot be empty");
                                  return;
                                } else if (imagePickerController.imagePath.value.isEmpty) {
                                  showErrorSnackBar("Profile Image cannot be empty");
                                  return;
                                }

                                // Call the signUpMethod and wait for its completion
                                // await authController.signUpMethod();

                                // Check if the signup was successful by checking if loading is false
                                if (!authController.isLoading.value) {
                                  Get.to(() => ProfessionalInformation2()); // Navigate only after success
                                }
                              },
                              title:authController.isLoading.value?
                              LoadingAnimationWidget.waveDots(color: Colors.white, size: 30.px) : Text(
                                'Next',
                                style: AppTextStyles.buttonTextStyle,
                              )),
                        ),
                      ],
                    ),
                  ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          )),
    );
  }
}
