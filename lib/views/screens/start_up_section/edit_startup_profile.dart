import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/getx_controllers/edit_start_up_profile_controller.dart';

class EditStartUpScreen extends StatelessWidget {
  final String documentId;

  const EditStartUpScreen({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    final EditStartUpProfileController editStartUpProfileController = Get.put(EditStartUpProfileController());
    editStartUpProfileController.fetchStartupProfile(documentId); // Ensure this is called once

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: AppColors.shadowColor,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.headingColor,
            size: 2.4.h,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          'Edit Startup Profile',
          style: AppTextStyles.buttonTextStyle.copyWith(
            fontSize: 20.px,
            fontWeight: FontWeight.w600,
            color: AppColors.headingColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.4.h),
              Center(
                child: GestureDetector(
                  onTap: () => editStartUpProfileController.pickImage(), // Call the method to pick an image
                  child: Obx(() {
                    // Using Obx to reactively update the CircleAvatar when profileImageUrl changes
                    return CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      radius: 6.h,
                      backgroundImage: editStartUpProfileController.profileImageUrl.isNotEmpty
                          ? NetworkImage(editStartUpProfileController.profileImageUrl.value) // Access the value of the observable
                          : null, // Display the image if URL is not empty
                      child: editStartUpProfileController.profileImageUrl.isEmpty // Check if there's no profile image
                          ? Icon(
                        Icons.person,
                        size: 5.h,
                        color: AppColors.greyColor,
                      )
                          : null, // No icon if an image is present
                    );
                  }),
                ),
              ),
              SizedBox(height: 3.h),
              Text("Name", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 1.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpNameController,
                title: "Name",
              ),
              SizedBox(height: 1.5.h),
              Text("Username", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpUserNameController,
                title: "Username",
              ),
              SizedBox(height: 1.5.h),
              Text("Bio", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpCompanyOverviewController,
                title: "Bio",
              ),
              SizedBox(height: 1.5.h),
              Text("Looking for", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpLookingController,
                title: "Looking for",
              ),
              SizedBox(height: 1.5.h),
              Text("Industry", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpFieldController,
                title: "Industry",
              ),
              SizedBox(height: 1.5.h),
              Text("Size", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpCompanySizeController,
                title: "Size",
              ),
              SizedBox(height: 1.5.h),
              Text("Challenges", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpChallengesController,
                title: "Challenges",
              ),
              SizedBox(height: 1.5.h),
              Text("Technology", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpTechnologyController,
                title: "Technology",
              ),
              SizedBox(height: 1.5.h),
              Text("Founding Stage", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpFoundingStageController,
                title: "Founding Stage",
              ),
              SizedBox(height: 1.5.h),
              Text("Founding Growth", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpFoundingAndGrowthController,
                title: "Founding Growth",
              ),
              SizedBox(height: 1.5.h),
              Text("Customers", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpMarketAndCustomersController,
                title: "Customers",
              ),
              SizedBox(height: 1.5.h),
              Text("Location", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpLocationController,
                title: "Location",
              ),
              SizedBox(height: 1.5.h),
              Text("Website", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpWebsiteController,
                title: "Website",
              ),
              SizedBox(height: 1.5.h),
              Text("Product Status", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpProductStatusController,
                title: "Product Status",
              ),
              SizedBox(height: 1.5.h),
              Text("Target Marke", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpTargetMarketController,
                title: "Target Market",
              ),
              SizedBox(height: 1.5.h),
              Text("Investor Stag", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpInvestStageController,
                title: "Investor Stage",
              ),
              SizedBox(height: 1.5.h),
              Text("Vision", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpVisionController,
                title: "Vision",
              ),
              SizedBox(height: 1.5.h),
              Text("Team", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 0.5.h),
              customTextFormFieldProfile(
                controller: editStartUpProfileController.startUpTeamController,
                title: "Team",
              ),
              SizedBox(height: 4.h),
              Obx(() => Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: customElevatedButton(
                        onTap: () async {
                          print("Save button pressed");
                          // Ensure the documentId is valid
                          if (documentId.isNotEmpty) {
                            await editStartUpProfileController.updateStartUpProfile(documentId);
                          } else {
                            Get.snackbar('Error', 'Document ID is empty!');
                          }
                        },
                        title: editStartUpProfileController.isLoading.value
                            ? LoadingAnimationWidget.waveDots(color: Colors.white, size: 30.px)
                            : Text("Save", style: AppTextStyles.buttonTextStyle),
                      ),
                    ),
                  ],
                ),
              )),
              const SizedBox(height: 16, width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
