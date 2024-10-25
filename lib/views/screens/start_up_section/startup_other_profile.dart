// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:in_hub/controllers/utils/app_colors.dart';
// import 'package:in_hub/controllers/utils/text_styles.dart';
// import 'package:in_hub/models/post_media_model.dart';
// import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// class StartUpOtherProfile extends StatelessWidget {
//   StartUpOtherProfile({super.key});
//   // Initialize with static data
//   final List<FeedsModel> data = [
//     FeedsModel(
//       profileImage: 'assets/pngs/iqrapro.png',
//       name: 'Zeeshan',
//       title: 'Hello World',
//       time: '2 hours ago',
//       desc:
//       'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
//       postImage: 'assets/pngs/post.png',
//     ),
//     FeedsModel(
//       profileImage: 'assets/pngs/iqrapro.png',
//       name: 'John Doe',
//       title: 'Flutter is awesome!',
//       time: '3 hours ago',
//       desc:
//       'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
//       postImage: 'assets/pngs/post.png',
//     ),
//     FeedsModel(
//       profileImage: 'assets/pngs/iqrapro.png',
//       name: 'Jane Doe',
//       title: 'Beautiful Day',
//       time: '5 hours ago',
//       desc:
//       'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
//       postImage: 'assets/pngs/post.png',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading:  GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: Icon(Icons.arrow_back_ios,
//             color: AppColors.headingColor,
//             size: 2.4.h,),
//         ),
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         title: Text(
//           "Createex",
//           style: AppTextStyles.boldTextStyle
//               .copyWith(color: AppColors.headingColor, fontSize: 18.px),
//         ),
//       ),
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.22,
//               child: Stack(
//                 children: [
//                   Container(
//                     alignment: Alignment.topRight,
//                     height: MediaQuery.of(context).size.height * 0.186,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("assets/pngs/startupbg.png"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     left: 18.h,
//                     right: 2,
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Stack(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                     color: AppColors.whiteColor, width: 2)),
//                             child: CircleAvatar(
//                               radius: 4.5.h,
//                               backgroundColor: Colors.transparent,
//                               backgroundImage: const AssetImage(
//                                 "assets/pngs/startupbg.png",
//                               ),
//                             ),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 3.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: .8.h,
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         "Createex",
//                         style: AppTextStyles.boldTextStyle.copyWith(
//                           color: const Color(0xff424348),
//                           fontSize: 14.px,
//                         ),
//                       ),
//                       SizedBox(height: .8.h,),
//                       Text(
//                         "I.T",
//                         style: AppTextStyles.boldTextStyle.copyWith(
//                           color: AppColors.primaryColor,
//                           fontSize: 14.px,
//                         ),
//                       ),
//                       SizedBox(height: .8.h,),
//                       ElevatedButton(style: ElevatedButton.styleFrom(
//                         fixedSize: Size(50.w, 35.px),
//                         backgroundColor:AppColors.primaryColor,),
//                         onPressed: () {
//                       },
//                           child: Text(
//                           'Follow',
//                           style: AppTextStyles.buttonTextStyle,),),
//                     ],
//                   ),
//                   SizedBox(height: 2.h,),
//                   Align(alignment: Alignment.centerLeft,
//                     child: Text(
//                       "About",
//                       style: TextStyle(
//                           fontSize: 14.px,
//                           color: const Color(0xff181919),
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                   Align(alignment: Alignment.centerLeft,
//                     child: Text(
//                       """I am a visual designer from Lahore, Pakistan." I love understanding how people interact, and I enjoy creating designs that are user-friendly. I have a strong passion for all things related to interaction, particularly with a keen focus on human-centered design thinking. """,
//                       style: TextStyle(
//                           fontSize: 12.px,
//                           color: const Color(0xff181919),
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   SizedBox(height: 2.h,),
//                   Align(alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Posts",
//                       style: TextStyle(
//                           fontSize: 14.px,
//                           color: const Color(0xff181919),
//                           fontWeight: FontWeight.w700),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 itemCount: data.length,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   // Get the current feed
//                   final feed = data[index];
//
//                   return Padding(
//                     padding: EdgeInsets.symmetric(
//                       vertical: 2.h,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 1.h),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   CircleAvatar(
//                                     backgroundImage:
//                                     AssetImage(feed.profileImage),
//                                     radius: 2.8.h,
//                                   ),
//                                   SizedBox(width: 3.w),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(feed.name,
//                                                 style: TextStyle(
//                                                     fontSize: 18.px,
//                                                     fontWeight: FontWeight.bold)),
//                                             const Icon(Icons.more_vert)
//                                           ],
//                                         ),
//                                         RichText(
//                                             text: TextSpan(children: [
//                                               TextSpan(
//                                                   text: "Interests ",
//                                                   style: AppTextStyles.boldTextStyle
//                                                       .copyWith(
//                                                       fontSize: 12.px,
//                                                       color: AppColors
//                                                           .primaryColor)),
//                                               TextSpan(
//                                                   text: "8 hour ago",
//                                                   style: AppTextStyles.regularStyle
//                                                       .copyWith(
//                                                       fontSize: 12.px,
//                                                       color: const Color(
//                                                           0xff363636))),
//                                             ])),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 1.h),
//                               Text(feed.desc,
//                                   style: TextStyle(fontSize: 14.sp)),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 1.h),
//                         Image.asset(feed.postImage),
//                         SizedBox(height: 2.h),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 1.h),
//                           child: Row(
//                             children: [
//                               SvgPicture.asset(
//                                   "assets/svgs/heart.svg"), // Replace with your actual SVG asset
//                               SizedBox(width: 2.w),
//                               Text("102.5K", style: TextStyle(fontSize: 14.sp)),
//                               SizedBox(width: 2.w),
//                               SvgPicture.asset(
//                                   "assets/svgs/comments.svg"), // Replace with your actual SVG asset
//                               Text("102.5K", style: TextStyle(fontSize: 14.sp)),
//                               const Spacer(),
//                               SvgPicture.asset(
//                                   "assets/svgs/share.svg"), // Replace with your actual SVG asset
//                               SizedBox(width: 2.w),
//                               Text("102.5K", style: TextStyle(fontSize: 14.sp)),
//                             ],
//                           ),
//                         ),
//                         Divider(thickness: 1, color: Colors.grey.shade300),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/models/post_media_model.dart';
import 'package:in_hub/views/screens/user_profile_section/user_post_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../models/static_model.dart';
import '../user_profile_section/user_detail_screen.dart';
import '../user_profile_section/edit_profile_screen.dart';
import '../profile_section/message_details_screen.dart';

class StartUpOtherProfile extends StatelessWidget {
  StartUpOtherProfile({super.key});
  // Initialize with static data
  final List<StaticModel> data = [
    StaticModel(
      profileImage: 'assets/pngs/profile.png',
      name: 'Zeeshan',
      title: 'Hello World',
      time: '2 hours ago',
      desc:
      'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
    StaticModel(
      profileImage: 'assets/pngs/profile.png',
      name: 'John Doe',
      title: 'Flutter is awesome!',
      time: '3 hours ago',
      desc:
      'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
    StaticModel(
      profileImage: 'assets/pngs/profile.png',
      name: 'Jane Doe',
      title: 'Beautiful Day',
      time: '5 hours ago',
      desc:
      'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
  ];
  RxBool isFirstButtonActive = true.obs;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
            [
              GestureDetector(onTap:() {
                Get.back();
              } ,
                  child: Icon(Icons.arrow_back_ios_new)),
              Text(
                "Profile",
                style: AppTextStyles.boldTextStyle
                    .copyWith(color: AppColors.headingColor, fontSize: 18.px),
              ),
              SizedBox(height: 10.px,width: 10.px,)
            ],
          ),
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.only(right: 2.h),
          //     child: GestureDetector(onTap: () {
          //       Get.to(()=> SettingScreen());
          //     },
          //         child: SvgPicture.asset("assets/svgs/setting.svg")),
          //   )
          // ],
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
                    Container(
                      alignment: Alignment.topRight,
                      height: MediaQuery.of(context).size.height * 0.186,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/pngs/image.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: 1.h, top: 1.h),
                        child: SvgPicture.asset("assets/svgs/edit.svg"),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: MediaQuery.of(context).size.width*0.38,
                      right: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.whiteColor, width: 3)),
                              child: CircleAvatar(
                                radius: 4.5.h,
                                backgroundColor: Colors.transparent,
                                backgroundImage: const AssetImage(
                                  "assets/pngs/profile.png",
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 1.5.h,
                              child: SvgPicture.asset(
                                "assets/svgs/camera.svg",
                                width: 2.h, // Adjust this value as needed
                                height: 2.h, // Adjust this value as needed
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Mohsin Ali Raza -",
                    style: AppTextStyles.boldTextStyle.copyWith(
                      color: const Color(0xff424348),
                      fontSize: 14.px,
                    ),
                  ),
                  SizedBox(
                    width: .4.h,
                  ),
                  Text("Username",style: AppTextStyles.boldTextStyle.copyWith(
                    fontSize: 14.px,
                    color: AppColors.primaryColor,
                  )),
                ],
              ),
              SizedBox(height: .4.h,),
              Text(
                "Software engineering",
                style: AppTextStyles.boldTextStyle.copyWith(
                    color: const Color(0xff424348),
                    fontSize: 14.px,fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: .4.h,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/location1.svg"),
                  SizedBox(
                    width: .4.h,
                  ),
                  Text(
                    "Lahore,Pakistan",
                    style: AppTextStyles.boldTextStyle.copyWith(
                        color: const Color(0xff424348),
                        fontSize: 14.px,fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(width: 2.w,),
                  SvgPicture.asset("assets/svgs/streamline.svg"),
                  SizedBox(
                    width: .4.h,
                  ),
                  Text(
                    "WWW.STARTUP.COM",
                    style: AppTextStyles.boldTextStyle.copyWith(
                        color: const Color(0xff424348),
                        fontSize: 14.px,fontWeight: FontWeight.w500
                    ),
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
              SizedBox(height: 1.5.h,),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 36.px,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width*0.4, 3.h),
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
                        "Follow",
                        style: TextStyle(
                          color: isFirstButtonActive.value ? Colors.white : AppColors.greenColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w,),
                  SizedBox(height: 36.px,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width*0.4, 3.h),
                        foregroundColor: !isFirstButtonActive.value ? Colors.white : AppColors.orangeColor,
                        backgroundColor: !isFirstButtonActive.value ?AppColors.greenColor : Colors.white,
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
                        "Message",
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
                            MessageDetailsScreen(),
                            // Content for Tab 2
                            UserPostScreen(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      );
  }
}



