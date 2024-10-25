import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/getx_controllers/create_startup_profile_controller.dart';

class CreateStartupProfile extends StatefulWidget {
  const CreateStartupProfile({super.key});
  @override
  State<CreateStartupProfile> createState() => _CreateStartupProfileState();
}

class _CreateStartupProfileState extends State<CreateStartupProfile> {
  final TextEditingController lookingStartUpController = TextEditingController();

  final RxList<String> chooseLooking = <String>[].obs;
  CreateStartUpProfileController createStartUpProfileController =Get.put(CreateStartUpProfileController());

  void addItem(String itemText, RxList<String> itemList, TextEditingController controller) {
    if (itemText.trim().isNotEmpty) {
      itemList.add(itemText.trim());
      controller.clear();
    }
  }
  void removeItem(int index, RxList<String> itemList) {
    itemList.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        shadowColor: AppColors.shadowColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.headingColor,
            size: 2.4.h,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Create Startup Profile',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              Obx(() {
                return Center(
                  child: GestureDetector(
                    onTap: createStartUpProfileController.pickImage, // Trigger image picking
                    child: CircleAvatar(
                      backgroundColor: AppColors.greyColor.withOpacity(0.2),
                      radius: 60, // Adjust size as needed
                      backgroundImage: createStartUpProfileController.profileImage.value.isNotEmpty
                          ? NetworkImage(createStartUpProfileController.profileImage.value) // Show selected image
                          : null, // No image yet
                      child: createStartUpProfileController.profileImage.value.isEmpty
                          ? Icon(
                        Icons.person,
                        size: 40,
                        color: AppColors.greyColor,
                      )
                          : null, // No icon if an image is selected
                    ),
                  ),
                );
              }),

              Text("Name", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 1.h),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpNameController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Username", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpUserNameController,
                  title: ""),
              SizedBox(height: 1.5.h),
              Text("Startup Filed ", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 1.h),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpFieldController,
                  title: ""),
              SizedBox(height: 1.5.h),
              Text("Startup Location ", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 1.h),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpLocationController,
                  title: ""),
              SizedBox(height: 1.5.h),
              Text("Startup Website ", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 1.h),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpWebsiteController,
                  title: ""),
              SizedBox(height: 1.5.h),
              Text("Company Overview", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(
                  controller: createStartUpProfileController.startUpCompanyOverviewController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Challenges", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile( controller: createStartUpProfileController.startUpChallengesController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Vision", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile( controller: createStartUpProfileController.startUpVisionController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Looking for", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile2(
                controller: createStartUpProfileController.startUpLookingController,
                title: "",
                horizentalPadding: 1.5.h,
                verticalPadding: 1.2.h,
                onChanged: (value) {
                  if (value.endsWith(',')) {
                    addItem(value.replaceAll(',', ''), chooseLooking, lookingStartUpController); // Add looking-for item when comma is pressed
                  }
                },
              ),
              SizedBox(height: 1.5.h),
              itemsWrap(chooseLooking, removeItem),
              SizedBox(height: 1.5.h),

              Text("Product status", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(  controller: createStartUpProfileController.startUpProductStatusController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Technology", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile( controller: createStartUpProfileController.startUpTechnologyController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Market and Customers", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpMarketAndCustomersController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Target Market", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpTargetMarketController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Company size", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpCompanySizeController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Founding and Growth", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpFoundingAndGrowthController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Founding Stage", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpFoundingStageController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Investor Stage", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpInvestStageController,
                  title: ""),
              SizedBox(height: 1.5.h),

              Text("Team", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(controller: createStartUpProfileController.startUpTeamController,
                  title: ""),
              SizedBox(height: 4.h),
              Obx(()=>Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: customElevatedButton(
                        onTap: () {
                          String userId=FirebaseAuth.instance.currentUser!.uid;
                          createStartUpProfileController.saveStartUpProfile(userId);
                        },
                        title: createStartUpProfileController.isLoading.value
                            ? LoadingAnimationWidget.waveDots(color: Colors.white, size: 30.px): Text(
                          "Create Profile",
                          style: AppTextStyles.buttonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),),
               SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );

  }
  Widget itemsWrap(RxList<String> items, Function(int, RxList<String>) removeItem) {
    return Obx(() => items.isNotEmpty
        ? Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(items.length, (index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.primaryColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min, // Ensures the container fits the content
            children: [
              Flexible(child: Text(items[index], style: AppTextStyles.textName1)),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () => removeItem(index, items),
                child: const Icon(Icons.close, size: 16, color: Colors.red),
              ),
            ],
          ),
        );
      }),
    )
        : Container());
  }
}
