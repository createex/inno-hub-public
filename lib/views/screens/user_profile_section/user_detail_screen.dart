import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:in_hub/views/screens/dammy_chat/sized_screen.dart';
import 'package:in_hub/views/screens/user_profile_section/user_work_experience.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/getx_controllers/create_startUp_profile_controller.dart';
import '../../../controllers/getx_controllers/profile_section_controller.dart';
import '../../../controllers/getx_controllers/user_profile_controller.dart';
import 'user_education_experience.dart';
class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});
  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}
class _UserDetailScreenState extends State<UserDetailScreen> {
  final TextEditingController emailController=TextEditingController();
  UserProfileController userProfileController =Get.put(UserProfileController());
  ProfileSectionController profileSectionController =Get.put(ProfileSectionController());
  final List<String> skill = [
    "Challenge 1",
    "Challenge 2",
    "Challenge 3",
    "Challenge 4",
    "Challenge 5",
    // Add more challenges as needed
  ];
  List<String> data=[
    "Createex",
    "UI/UX Designer",
    "01.01.2023 to 01.01.2024",
    "Lahore,Pakistan"
  ];
  List<String> data1=[
    "UCP",
    "UI/UX Designer",
    "01.01.2023 to 01.01.2024",
    "My role is design screen for company's play store apps. Starting from idea to prepare design hand-off for the developers."
  ];
  @override
  void initState() {
    userProfileController.fetchUserData();
    String currentUserId = FirebaseAuth.instance.currentUser!.uid; // Get the current user's ID
    profileSectionController. fetchWorkExperiences(currentUserId);
    profileSectionController.fetchEducationExperiences(currentUserId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 2.h,),
                   Text(
               "About",style: TextStyle(fontWeight: FontWeight.w500),),


              Divider(color: Colors.grey,),
              Obx(()=>Text(userProfileController.about.value.isNotEmpty?
              userProfileController.about.value:
              "Description....",),),
              Divider(color: Colors.grey.withOpacity(0.2),),
              SizedBox(height: 1.h,),
              GestureDetector(onTap: () {
                Get.to(()=>const UserWorkExperience());
              },
                child:  Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(  onTap: () {
                      Get.to(()=>const UserWorkExperience());

                    },
                        child: Text("Work experience",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),
                    GestureDetector(onTap: () {
                      Get.to(()=>const UserWorkExperience());

                    },
                        child: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
              SizedBox(height: 1.h,),
              Divider(color: Colors.grey.withOpacity(0.2),),
               SizedBox(height: 1.h,),
    Obx(() {
      if (profileSectionController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }if(profileSectionController.workExperienceList.isEmpty){
        return Center(
            child: Text(
              'No work experience available.', // Message when there are no experiences
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
        );
      }
      return SizedBox(
        height: 300,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: profileSectionController.workExperienceList.length,
          itemBuilder: (context, index) {
            final workExp = profileSectionController.workExperienceList[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: workExp['logo'] != null
                        ? NetworkImage(workExp['logo']) // Load logo from URL
                        : AssetImage("assets/pngs/pngprofile.png"),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workExp['companyName'], // Display company name
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          workExp['position'], // Display position
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 0.4.h),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              workExp['start_date'].toDate().toString(), // Display start date
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
                                workExp['end_date'].toDate().toString(), // Display start date
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 0.4.h),
                        Text(
                          workExp['location'], // Display location
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
    ) ,
               SizedBox(height: 1.h,),
               Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(onTap: () {
                    Get.to(()=>UserEducationExperience());
                  },
                      child: Text("Education",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)),
                  GestureDetector(onTap:() {
                    Get.to(()=>UserEducationExperience());

                  } ,
                      child: Icon(Icons.arrow_forward_ios))
                ],
              ),
              Divider(color: Colors.grey.withOpacity(0.2),),
              SizedBox(height: 1.h,),
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
                return SizedBox(
                  height: 300,
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
                                  Text(
                                    eduExperience['universityName'], // Display company name
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
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
              ) ,
              SizedBox(height: 1.h,),
              Text("Looking For",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              SizedBox(
                height: 35,
                child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userProfileController.chooseLooking.length, // Use the skills community list
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center( // Centering the text
                          child: Text(
                            userProfileController.chooseLooking[index], // Get the skill from the list
                            style: TextStyle(fontSize: 16.sp), // Responsive font size
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ),
              SizedBox(height: 1.h,),
              Text("Skills",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              SizedBox(
                height: 35,
                child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userProfileController.skillsCommunity.length, // Use the skills community list
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center( // Centering the text
                          child: Text(
                            userProfileController.skillsCommunity[index], // Get the skill from the list
                            style: TextStyle(fontSize: 16.sp), // Responsive font size
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ),
              SizedBox(height: 1.h,),
              Text("Roles I Can Fulfill",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              SizedBox(
                height: 30,
                child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userProfileController.rolesCommunity.length, // Use the skills community list
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 1.w),
                      child: Text(
                        userProfileController.rolesCommunity[index], // Get the skill from the list
                          style: TextStyle(fontWeight: FontWeight.w400), // Responsive font size
                      ),
                    );
                  },
                )),
              ),
              SizedBox(height: 1.h,),
              Text("Industry Interests",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              SizedBox(
                height: 30,
                child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userProfileController.industryInterests.length, // Use the skills community list
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 1.w),
                      child: Text(
                        userProfileController.industryInterests[index], // Get the skill from the list
                        style: TextStyle(fontWeight: FontWeight.w400), // Responsive font size
                      ),
                    );
                  },
                )),
              ),
              SizedBox(height: 1.h,),
              Text("Languages",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              SizedBox(
                height: 30,
                child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userProfileController.languageCommunity.length, // Use the skills community list
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 1.w),
                      child: Text(
                        userProfileController.languageCommunity[index], // Get the skill from the list
                        style: TextStyle(fontWeight: FontWeight.w400), // Responsive font size
                      ),
                    );
                  },
                )),
              ),
              SizedBox(height: 1.h,),
              Text("Start-ups Associated With",style: TextStyle(fontWeight: FontWeight.w500),),
              Divider(color: Colors.grey,),
              SizedBox(height: 0.6.h,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",style: TextStyle(fontWeight: FontWeight.w400),),
const SizedBox(height: 10,  width: 10,),

            ],),
        ),
      ),
    );
  }
}
