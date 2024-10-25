import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/dammy_chat/sized_screen.dart';
import 'package:in_hub/views/screens/user_profile_section/user_post_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/getx_controllers/auth_controllers.dart';
import '../../../controllers/getx_controllers/user_profile_controller.dart';
import '../../../controllers/utils/image_picker.dart';
import '../../../models/static_model.dart';
import 'user_detail_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // Initialize with static data
  final List<StaticModel> data = [
    StaticModel(
      profileImage: 'assets/pngs/profile.png',
      name: 'Zeeshan',
      title: 'Hello World',
      time: '2 hours ago',
      desc: 'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
    StaticModel(
      profileImage: 'assets/pngs/profile.png',
      name: 'John Doe',
      title: 'Flutter is awesome!',
      time: '3 hours ago',
      desc: 'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
    StaticModel(
      profileImage: 'assets/pngs/profile.png',
      name: 'Jane Doe',
      title: 'Beautiful Day',
      time: '5 hours ago',
      desc: 'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
  ];
  RxBool isFirstButtonActive = true.obs;
  ImagePickerController1 imagePickerController =Get.put(ImagePickerController1());
  AuthController authController =Get.put(AuthController());
  UserProfileController userProfileController =Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    userProfileController.fetchUserData();
    authController.fetchUserDataImages();
    imagePickerController.loadBackgroundImagePath(); // Load image path on startup

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_new)),
            Text(
              "Profile",
              style: AppTextStyles.boldTextStyle.copyWith(color: AppColors.headingColor, fontSize: 18.px),
            ),
            SizedBox(height: 10.px,width: 10.px,)
          ],
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              child: Stack(
                children: [
                  // Background Image with GestureDetector
                  GestureDetector(
                    onTap: () async {
                      // Pick background image from gallery
                      await imagePickerController.pickBackgroundImage();

                      // Check if an image was selected and update in Firebase
                      if (imagePickerController.backgroundImagePath.isNotEmpty) {
                        await authController.updateBackgroundImage(imagePickerController.backgroundImagePath.value);
                      }
                    },
                    child: Obx(
                          () => Container(
                        alignment: Alignment.topRight,
                        height: MediaQuery.of(context).size.height * 0.186,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imagePickerController.backgroundImagePath.isNotEmpty
                                ? FileImage(File(imagePickerController.backgroundImagePath.value))
                                : const AssetImage("assets/pngs/image.png") as ImageProvider, // Default background image
                            fit: BoxFit.cover, // Updated fit to cover
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4), // Semi-transparent background for better visibility
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SvgPicture.asset(
                                "assets/svgs/edit.svg",
                                color: Colors.white, // Ensure icon visibility
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: MediaQuery.of(context).size.width * 0.38, // Adjust for centering
                    right: MediaQuery.of(context).size.width * 0.38, // Adjust for centering
                    child: GestureDetector(
                      onTap: () async {
                        await imagePickerController.pickProfileImage();
                        // Check if an image was picked
                        if (imagePickerController.profileImagePath.isNotEmpty) {
                          // Update the profile image in Firebase
                          await authController.updateProfileImage(imagePickerController.profileImagePath.value);
                        }
                      },
                      child: Obx(() => Stack(
                        children: [
                          // Main Profile Image (User's selected image or default)
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300), // Subtle animation
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3), // Border around image
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(0, 5), // Shadow for depth
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 4.5.h, // Adjusted radius
                              backgroundColor: Colors.transparent,
                              backgroundImage: authController.profileImage.value.isNotEmpty
                                  ? NetworkImage(authController.profileImage.value)
                                  : const AssetImage("assets/pngs/profile.png") as ImageProvider, // Default profile image
                            ),
                          ),

                          // Camera Icon Positioned at bottom-right
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white, // Background for camera icon
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: Offset(0, 2), // Light shadow for icon
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(4), // Padding around camera icon
                              child: SvgPicture.asset(
                                "assets/svgs/camera.svg",
                                width: 2.h,
                                height: 2.h,
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),

                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
            authController.firstName.value.isNotEmpty && authController.lastName.value.isNotEmpty
            ? '${authController.firstName.value} ${authController.lastName.value}' // Concatenate first and last names
                : "Mohsin Ali Raza",
                  style: AppTextStyles.boldTextStyle.copyWith(
                    color: const Color(0xff424348),
                    fontSize: 14.px,
                  ),
                ),
                SizedBox(width: .4.h,),
                Text(
authController.userName.value.isNotEmpty?
    authController.userName.value
    :                  "Username",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14.px,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: .4.h,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Text(
                    userProfileController.company.isNotEmpty
                        ? userProfileController.company.toString()
                        : "Createex: ",
                    style: AppTextStyles.boldTextStyle.copyWith(
                      color: const Color(0xff424348),
                      fontSize: 14.px,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
getHorizontalSpace(.8.w),
                  Text(
                    authController.profession.value.isNotEmpty?
                        authController.profession.value:
                    "UI/UX Designer",
                    style: TextStyle(
                      color: const Color(0xff424348),
                      fontSize: 13.px,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: .4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/svgs/location1.svg"),
                SizedBox(
                  width: .4.h,
                ),
                Text(
                  authController.location.value.isNotEmpty?
                  authController.location.value:
                  "Lahore, Pakistan",
                  style: AppTextStyles.boldTextStyle.copyWith(color: const Color(0xff424348), fontSize: 14.px, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("32", style: AppTextStyles.blackColorInno),
                        Text("Connects", style: AppTextStyles.greyColorFollower),
                      ],
                    ),
                    Column(
                      children: [
                        Text("1.1M", style: AppTextStyles.blackColorInno),
                        Text("Followers", style: AppTextStyles.greyColorFollower),
                      ],
                    ),
                    Column(
                      children: [
                        Text("200", style: AppTextStyles.blackColorInno),
                        Text("Following", style: AppTextStyles.greyColorFollower),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 36.px,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 3.h),
                      foregroundColor: isFirstButtonActive.value ? Colors.white : AppColors.orangeColor,
                      backgroundColor: isFirstButtonActive.value ? AppColors.greenColor : Colors.white,
                      side: const BorderSide(color: AppColors.greenColor, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => const EditProfileScreen());
                      isFirstButtonActive.value = true;
                    },
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: isFirstButtonActive.value ? Colors.white : AppColors.greenColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                SizedBox(
                  height: 36.px,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 3.h),
                      foregroundColor: !isFirstButtonActive.value ? Colors.white : AppColors.orangeColor,
                      backgroundColor: !isFirstButtonActive.value ? AppColors.greenColor : Colors.white,
                      side: const BorderSide(color: AppColors.greenColor, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {
                      // Get.off(()=>const EditProfileScreen());
                      isFirstButtonActive.value = false;
                    },
                    child: Text(
                      "Share",
                      style: TextStyle(
                        color: !isFirstButtonActive.value ? Colors.white : AppColors.greenColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h), // Space before the TabBar
            Expanded(
              child: DefaultTabController(
                length: 2, // Number of tabs
                child: Column(
                  children: [
                    // Tab bar
                    Container(
                      width: double.infinity,
                      color: AppColors.greyColor3,
                      child: Align(
                        alignment: Alignment.center,
                        child: TabBar(
                          dividerColor: Colors.transparent,
                          // padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                          // indicatorPadding: EdgeInsets.symmetric(horizontal: 4.h),
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 2.0,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: AppTextStyles.textPrimaryColor,
                          unselectedLabelColor: AppColors.greyColor1,
                          tabs: const [
                            Tab(text: "Details"),
                            Tab(text: "Post"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h), // Space between TabBar and TabBarView
                    const Expanded(
                      child: TabBarView(
                        children: [
                          // Content for Tab 1
                          UserDetailScreen(),
                          // Content for Tab 2
                          UserPostScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     padding: EdgeInsets.zero,
            //     itemCount: data.length,
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) {
            //       // Get the current feed
            //       final feed = data[index];
            //
            //       return Padding(
            //         padding: EdgeInsets.symmetric(vertical: 2.h,),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Padding(
            //               padding:  EdgeInsets.only(left: 2.w),
            //               child: Row( crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 children: [
            //                   CircleAvatar(
            //                     backgroundImage:
            //                     AssetImage(feed.profileImage),
            //                     radius: 2.8.h,
            //                   ),
            //                   SizedBox(width: 3.w),
            //                   Expanded(
            //                     child: Column(
            //                       crossAxisAlignment:
            //                       CrossAxisAlignment.start,
            //                       children: [
            //                         Text(feed.name,
            //                             style: TextStyle(
            //                                 fontSize: 18.px,
            //                                 fontWeight: FontWeight.bold)),
            //                         RichText(
            //                             text: TextSpan(children: [
            //                               TextSpan(
            //                                   text: "Interests ",
            //                                   style: AppTextStyles.boldTextStyle
            //                                       .copyWith(
            //                                       fontSize: 12.px,
            //                                       color: AppColors
            //                                           .primaryColor)),
            //                               TextSpan(
            //                                   text: "8 hour ago",
            //                                   style: AppTextStyles.regularStyle
            //                                       .copyWith(
            //                                       fontSize: 12.px,
            //                                       color: const Color(
            //                                           0xff363636))),
            //                             ])),
            //                         SizedBox(height: 1.h),
            //                         Text(feed.desc,
            //                             style: TextStyle(fontSize: 14.sp)),
            //                         SizedBox(height: 1.h),
            //                         ClipRRect(borderRadius: BorderRadius.circular(12),
            //                             child: Image.asset(feed.postImage,)),
            //                         SizedBox(height: 2.h),
            //                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             SvgPicture.asset(
            //                                 "assets/svgs/heart.svg"), // Replace with your actual SVG asset
            //                             Text("102.5K", style: TextStyle(fontSize: 14.sp)),
            //                             SvgPicture.asset(
            //                                 "assets/svgs/comments.svg"), // Replace with your actual SVG asset
            //                             Text("102.5K", style: TextStyle(fontSize: 14.sp)),
            //                             SvgPicture.asset(
            //                                 "assets/svgs/rePost.svg"), // Replace with your actual SVG asset
            //                             Text("102K", style: TextStyle(fontSize: 14.sp)),
            //                             SvgPicture.asset(
            //                                 "assets/svgs/share.svg"), // Replace with your actual SVG asset
            //                             Text("102.5K", style: TextStyle(fontSize: 14.sp)),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   PopupMenuButton<String>(
            //                     onSelected: (value) {
            //                       if (value == 'edit') {
            //                         // Handle edit action here
            //                       }
            //                     },
            //                     itemBuilder: (BuildContext context) {
            //                       return [
            //                         PopupMenuItem<String>(
            //                           value: 'edit',
            //                           child: Text('Edit'),
            //                         ),
            //                       ];
            //                     },
            //                     icon: Icon(Icons.more_vert), // The three-dot icon
            //                   )
            //
            //                   // PopupMenuButton(
            //                   //   iconSize: 3.h,
            //                   //   padding: EdgeInsets.zero,
            //                   //   onSelected: (value) {
            //                   //     // your logic
            //                   //   },
            //                   //   itemBuilder: (BuildContext bc) {
            //                   //     return [
            //                   //       PopupMenuItem(
            //                   //         value: 'Edit',
            //                   //         child: Text(
            //                   //           "Edit",
            //                   //           style: TextStyle(fontSize: 12.px),
            //                   //         ),
            //                   //       )
            //                   //     ];
            //                   //   },
            //                   // )
            //                 ],
            //               ),
            //             ),
            //
            //             Divider(thickness: 1, color: Colors.grey.shade300),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

