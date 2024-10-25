import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../controllers/getx_controllers/profile_section_controller.dart';
import '../../../controllers/getx_controllers/user_profile_controller.dart';
import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/calender_controller.dart';
import '../../../controllers/utils/custom_snackbar_error_widget.dart';
import '../../../controllers/utils/image_picker.dart';
import '../../../controllers/utils/text_styles.dart';
import '../../custom_widget/custom_textfield.dart';
import '../dammy_chat/sized_screen.dart';
class UserEducationExperience extends StatefulWidget {
  const UserEducationExperience({super.key});

  @override
  State<UserEducationExperience> createState() => _UserEducationExperienceState();
}

class _UserEducationExperienceState extends State<UserEducationExperience> {
  List<String> data=[
    "UCP",
    "UI/UX Designer",
    "My role is design screen for company's play store apps. Starting from idea to prepare design hand-off for the developers."
  ];
  CalendarController calendarController =Get.put(CalendarController());
  ProfileSectionController profileSectionController =Get.put(ProfileSectionController());

  @override
  void initState() {
  String currentUserId = FirebaseAuth.instance.currentUser!.uid; // Get the current user's ID
  profileSectionController.fetchEducationExperiences(currentUserId);
  super.initState();
  }
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(children: [
          SizedBox(height:8.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap:(){
                  Get.back();
                },
                    child: const Icon(Icons.arrow_back_ios_new)),
                Text("Education",style: AppTextStyles.blackColorN,),
                SizedBox(height: 10.px,width: 10.px,)
              ],
            ),
          ),
          Obx(() {
            if (profileSectionController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }if(profileSectionController.educationExperienceList.isEmpty){
              return Center(
                  child: Text(
                    'No education experience available.', // Message when there are no experiences
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  )
              );
            }
            return Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: profileSectionController.educationExperienceList.length,
                itemBuilder: (context, index) {
                  final eduExperience = profileSectionController.educationExperienceList[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: eduExperience['logo'] != null
                              ? NetworkImage(eduExperience['logo']) // Load logo from URL
                              : AssetImage("assets/pngs/pngprofile.png"),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Text(
                                    eduExperience['universityName'], // Display company name
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SvgPicture.asset("assets/svgs/edit.svg")
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                eduExperience['studyField'], // Display position
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 0.4.h),
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    eduExperience['start_date'].toDate().toString(), // Display start date
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis),
                                  ),
                                  getHorizontalSpace(1.w),
                                  Text("to",style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),),
                                  getHorizontalSpace(1.w),
                                  Expanded(
                                    child: Text(
                                      eduExperience['end_date'].toDate().toString(), // Display start date
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.4.h),
                              Text(
                                eduExperience['degree'], // Display location
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
          ) ,          SizedBox(height: 8.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 6.w),
            child: ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
            ),
                onPressed: (){
                  addEducationExperience(context);
                }, child: Center(child: Text("Add Work experience",style: TextStyle(color: Colors.white),))),
          ),
          SizedBox(height: 20,width: 20,)
        ],),
      ),
    );
  }
  void addEducationExperience(BuildContext context) {
    ProfileSectionController profileSectionController=Get.put(ProfileSectionController());
    ImagePickerController imagePickerController=Get.put(ImagePickerController());
    ImagePickerController1 imagePickerController1=Get.put(ImagePickerController1());
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Transparent background for Material
            child: Container(
              width: 90.w, // Width responsive to screen width
              padding: EdgeInsets.symmetric(
                horizontal: 2.h, // Responsive horizontal padding
                vertical: 2.h, // Responsive vertical padding
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h), // Responsive border radius
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Adjust the height based on content
                children: [
                  Center(
                    child: Text(
                      'Add Education',
                      style: TextStyle(
                        fontSize: 14.px, // Responsive font size
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey.withOpacity(0.2),),
                  SizedBox(height: 1.h,),
                  Obx(()=>   GestureDetector(onTap: () {
                    imagePickerController1.pickProfileImage();
                  },
                    child: CircleAvatar(backgroundImage: imagePickerController1.profileImagePath.value.isNotEmpty?
                    FileImage(File(imagePickerController1.profileImagePath.value))
                        : const AssetImage("assets/pngs/profile.png"),radius: 30,),
                  ),),
                  SizedBox(height: 3.h), // Responsive vertical spacing
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'University / School',
                      style: TextStyle(
                          fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.4.h),
                  CustomTextFormField(
                    controller:profileSectionController.universityNameController ,
                  ),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Study Field',
                      style: TextStyle(
                          fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.4.h),
                  CustomTextFormField(
                    controller:profileSectionController.studyFieldController ,
                  ),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Align(alignment: Alignment.centerLeft,
                    child: Text(
                      'Degree',
                      style: TextStyle(
                          fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 0.4.h),
                  CustomTextFormField(
                    controller:profileSectionController.degreeController ,
                  ),
                  SizedBox(height: 1.h), // Responsive vertical spacing
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "This is my current position now ",
                        style: TextStyle(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'bold',
                            color: const Color(0xff272828)),
                      ),
                      ToggleSwitch(
                        minWidth: 2.5.h,
                        minHeight: 2.5.h,
                        cornerRadius: 3.h,
                        inactiveBgColor:
                        AppColors.greyColor.withOpacity(0.3),
                        inactiveFgColor: Colors.grey,
                        activeBgColor: [AppColors.primaryColor,AppColors.greyColor],
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        radiusStyle: true,
                        onToggle: (index) {
                          profileSectionController.isActive.value=index==1;
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("Start Date"),
                      Text("Finish Date"),
                      SizedBox(height: 10.px,width: 10.px,)
                    ],
                  ),
                  SizedBox(height: .7.h),
                  Obx(() => Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(onTap: () {
                        calendarController.selectStartDate(context);
                      },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                "assets/svgs/calender.svg",
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                DateFormat('yyyy-MM-dd').format(calendarController.selectedStartDate.value),

                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w,),
                      Text("To",),
                      SizedBox(width: 2.w,),

                      Obx(() => GestureDetector(onTap: () {
                        calendarController.selectEndDate(context);
                      },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                              border:  Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 2.w),

                              SvgPicture.asset(
                                "assets/svgs/calender.svg",
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                DateFormat('yyyy-MM-dd').format(calendarController.selectedEndDate.value),

                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  )),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.px),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:Color(0xff7C7C7C),
                              borderRadius: BorderRadius.circular(1.1.h),
                            ),
                            child: Text('Deny', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(width: 2.h,),                      // Replaced custom method with SizedBox for simplicity
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            // Validate the input fields
                            if (profileSectionController.universityNameController.text.isEmpty ||
                                profileSectionController.studyFieldController.text.isEmpty ||
                                profileSectionController.degreeController.text.isEmpty) {
                              showErrorSnackBar("Please fill all the fields.");
                              return;
                            }

                            try {
                              profileSectionController.isLoading.value = true; // Set loading to true

                              // Convert the string path to a File object
                              File? logoFile;
                              if (imagePickerController1.profileImagePath.value.isNotEmpty) {
                                logoFile = File(imagePickerController1.profileImagePath.value); // Convert to File
                              }
                              String userId = FirebaseAuth.instance.currentUser!.uid;
                              await profileSectionController.addEducationExperience(
                                userId: userId,
                                logoFileEducation: logoFile, // Pass the File object, or null if no image is selected
                                universityName: profileSectionController.universityNameController.text.trim(),
                                studyField: profileSectionController.studyFieldController.text.trim(),
                                degree: profileSectionController.degreeController.text.trim(),
                                active: profileSectionController.isActive.value,
                                startDate: calendarController.selectedStartDate.value,
                                endDate: profileSectionController.isActive.value ? null : calendarController.selectedEndDate.value,
                              );

                              Get.back(); // Close the dialog after saving
                            } catch (e) {
                              showErrorSnackBar("Failed to save data.");
                            } finally {
                              profileSectionController.isLoading.value = false; // Stop loading
                            }
                          },
                          child: Obx(() => Container(
                            padding: EdgeInsets.symmetric(vertical: 8.px),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(1.1.h)),
                            child: profileSectionController.isLoading.value
                                ? LoadingAnimationWidget.waveDots(color: Colors.white, size: 30.px)
                                : Text('Add', style: TextStyle(color: Colors.white)),
                          )),
                        ),
                      )
                    ],
                  ),

                  // Responsive vertical spacing
                  SizedBox(height: 3.2.h), // Responsive vertical spacing

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
void editWorkExperience(BuildContext context) {
  CalendarController calendarController =Get.put(CalendarController());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Material(
          color: Colors.transparent, // Transparent background for Material
          child: Container(
            width: 90.w, // Width responsive to screen width
            padding: EdgeInsets.symmetric(
              horizontal: 2.h, // Responsive horizontal padding
              vertical: 2.h, // Responsive vertical padding
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.h), // Responsive border radius
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, // Adjust the height based on content
              children: [
                Center(
                  child: Text(
                    'Edit Education',
                    style: TextStyle(
                      fontSize: 14.px, // Responsive font size
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Divider(color: Colors.grey.withOpacity(0.2),),
                 SizedBox(height: 1.h,),
                 const CircleAvatar(backgroundImage: AssetImage("assets/pngs/profile.png"),radius: 30,),
                SizedBox(height: 3.h), // Responsive vertical spacing
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    'University / School',
                    style: TextStyle(
                        fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.4.h),
                CustomTextFormField(),
                SizedBox(height: 1.h), // Responsive vertical spacing
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    'Study Field',
                    style: TextStyle(
                        fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.4.h),
                CustomTextFormField(),
                SizedBox(height: 1.h), // Responsive vertical spacing
                Align(alignment: Alignment.centerLeft,
                  child: Text(
                    'Degree',
                    style: TextStyle(
                        fontSize: 12.px, fontWeight: FontWeight.w400// Responsive font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.4.h),
                CustomTextFormField(),

                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text("Start Date"),
                    Text("Finish Date"),
                    SizedBox(height: 10.px,width: 10.px,)
                  ],
                ),
                SizedBox(height: .7.h),
                Obx(() => Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(onTap: () {
                      calendarController.selectStartDate(context);
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/calender.svg",
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              DateFormat('yyyy-MM-dd').format(calendarController.selectedStartDate.value),

                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w,),
                    Text("To",),
                    SizedBox(width: 2.w,),

                    Obx(() => GestureDetector(onTap: () {
                      calendarController.selectEndDate(context);
                    },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                            border:  Border.all(color: Colors.grey)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 2.w),

                            SvgPicture.asset(
                              "assets/svgs/calender.svg",
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              DateFormat('yyyy-MM-dd').format(calendarController.selectedEndDate.value),

                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                )),
                SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.px),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:Color(0xff7C7C7C),
                            borderRadius: BorderRadius.circular(1.1.h),
                          ),
                          child: Text('Deny', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(width: 2.h,),                      // Replaced custom method with SizedBox for simplicity
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.px),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(1.1.h),
                          ),
                          child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Responsive vertical spacing
                SizedBox(height: 3.2.h), // Responsive vertical spacing

              ],
            ),
          ),
        ),
      );
    },
  );
}



