import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/custom_snackbar_error_widget.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/getx_controllers/user_profile_controller.dart';
import '../start_up_section/startup_own_profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final userProfileController = Get.put(UserProfileController());

  // Define TextEditingControllers for each text field
  final TextEditingController firstController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController currentPositionController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  // Controller for skill and looking-for input fields
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController lookingForController = TextEditingController();
  final TextEditingController rolesController = TextEditingController();
  final TextEditingController industryInterestController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();

  // Reactive lists to store skills and looking-for items
  final RxList<String> skills = <String>[].obs;
  final RxList<String> chooseLooking = <String>[].obs;
  final RxList<String> rolesCommunity = <String>[].obs;
  final RxList<String> industryInterestList = <String>[].obs;
  final RxList<String> languageCommunity = <String>[].obs;


  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    firstController.dispose();
    lastController.dispose();
    userNameController.dispose();
    aboutController.dispose();
    currentPositionController.dispose();
    companyController.dispose();
    locationController.dispose();
    skillsController.dispose();
    lookingForController.dispose();
    super.dispose();
  }

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
    return Scaffold(
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
          'Edit Profile',
          style: AppTextStyles.buttonTextStyle.copyWith(fontSize: 20.px, fontWeight: FontWeight.w600, color: AppColors.headingColor),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                SizedBox(height: 2.h),
                // Other form fields here...
                customTextFormFieldProfile(controller: userNameController, title: "Username"),
                SizedBox(height: 1.5.h),
                customTextFormFieldProfile(controller: aboutController, title: "About"),
                SizedBox(height: 1.5.h),
                customTextFormFieldProfile(controller: currentPositionController, title: "Current Position"),
                SizedBox(height: 1.5.h),
                customTextFormFieldProfile(controller: companyController, title: "Current Position Company"),
                SizedBox(height: 1.5.h),
                customTextFormFieldProfile(controller: locationController, title: "Location"),
                SizedBox(height: 1.5.h),

                // Skills input
                customTextFormFieldProfile2(
                  controller: skillsController,
                  title: "Enter Skill",
                  horizentalPadding: 1.5.h,
                  verticalPadding: 1.2.h,
                  onChanged: (value) {
                    if (value.endsWith(',')) {
                      addItem(value.replaceAll(',', ''), skills, skillsController); // Add skill when comma is pressed
                    }
                  },
                ),
                SizedBox(height: 1.5.h),
                itemsWrap(skills, removeItem),
                SizedBox(height: 1.5.h),

                // Looking For input
                customTextFormFieldProfile2(
                  controller: lookingForController,
                  title: "Looking For",
                  horizentalPadding: 1.5.h,
                  verticalPadding: 1.2.h,
                  onChanged: (value) {
                    if (value.endsWith(',')) {
                      addItem(value.replaceAll(',', ''), chooseLooking, lookingForController); // Add looking-for item when comma is pressed
                    }
                  },
                ),
                SizedBox(height: 1.5.h),
                itemsWrap(chooseLooking, removeItem),
                SizedBox(height: 1.5.h),

                // Roles I can fulfill
                customTextFormFieldProfile2(
                  controller: rolesController,
                  title: "Roles I can fulfill",
                  horizentalPadding: 1.5.h,
                  verticalPadding: 1.2.h,
                  onChanged: (value) {
                    if (value.endsWith(',')) {
                      addItem(value.replaceAll(',', ''), rolesCommunity, rolesController); // Add looking-for item when comma is pressed
                    }
                  },
                ),
                SizedBox(height: 1.5.h),
                itemsWrap(rolesCommunity, removeItem),
                SizedBox(height: 1.5.h),

                // Industry Interests
                customTextFormFieldProfile2(
                  controller: industryInterestController,
                  title: "Industry Interests",
                  horizentalPadding: 1.5.h,
                  verticalPadding: 1.2.h,
                  onChanged: (value) {
                    if (value.endsWith(',')) {
                      addItem(
                          value.replaceAll(',', ''), industryInterestList, industryInterestController); // Add looking-for item when comma is pressed
                    }
                  },
                ),
                SizedBox(height: 1.5.h),
                itemsWrap(industryInterestList, removeItem),
                SizedBox(height: 1.5.h),

                // Languages
                customTextFormFieldProfile2(
                  controller: languagesController,
                  title: "Languages",
                  horizentalPadding: 1.5.h,
                  verticalPadding: 1.2.h,
                  onChanged: (value) {
                    if (value.endsWith(',')) {
                      addItem(value.replaceAll(',', ''), languageCommunity, languagesController); // Add looking-for item when comma is pressed
                    }
                  },
                ),
                SizedBox(height: 1.5.h),
                itemsWrap(languageCommunity, removeItem),
                SizedBox(height: 1.5.h),

                SizedBox(height: 2.h),
                Align(
                  alignment: Alignment.center,
                  child: customElevatedButton(
                    width: 7.w,
                    onTap: () async {
                      String uid = FirebaseAuth.instance.currentUser?.uid.toString() ?? "";
                      print("UID $uid");
                      await userProfileController.updateUserProfile(
                        uid: uid,
                        username: userNameController.text.trim(),
                        about: aboutController.text.trim(),
                        currentPosition: currentPositionController.text.trim(),
                        company: companyController.text.trim(),
                        location: locationController.text.trim(),
                        skills: skills.toList(),
                        chooseLooking: chooseLooking.toList(),
                        rolesCommunity: rolesCommunity.toList(),
                        industryInterests: industryInterestList.toList(),
                        languageCommunity: languageCommunity.toList(),
                      );

                      // Navigate to the StartUpOwnProfile screen after updating
                      // Get.to(() => StartUpOwnProfile());
                      showSuccessSnackBar("User Data Updated Successfully");
                    },
                    title: Text("Create Profile", style: AppTextStyles.buttonTextStyle),
                  ),
                ),
                const SizedBox(height: 10, width: 10),
              ],
            ),
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
