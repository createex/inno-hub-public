import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/models/feed_model.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:in_hub/views/screens/profile_section/create_startup_profile.dart';
import 'package:in_hub/views/screens/profile_section/profile_post_screen.dart';
import 'package:in_hub/views/screens/profile_section/profile_post_screen_it.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../custom_widgets/app_keys.dart';
import 'detail_screen.dart';
import 'details_screen_it.dart';
import 'edit_startup_profile.dart';

class StartUpOwnProfile extends StatelessWidget {
  StartUpOwnProfile({super.key});
  // Initialize with static data
  final List<FeedsModel> data = [
    FeedsModel(
      profileImage: 'assets/pngs/iqrapro.png',
      name: 'Zeeshan',
      title: 'Hello World',
      time: '2 hours ago',
      desc:
      'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
    FeedsModel(
      profileImage: 'assets/pngs/iqrapro.png',
      name: 'John Doe',
      title: 'Flutter is awesome!',
      time: '3 hours ago',
      desc:
      'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
    FeedsModel(
      profileImage: 'assets/pngs/iqrapro.png',
      name: 'Jane Doe',
      title: 'Beautiful Day',
      time: '5 hours ago',
      desc:
      'Taylor Swift was spotted at Aarowhead Stadium to cheer on boyfrien TraviKelce',
      postImage: 'assets/pngs/post.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h), // Adjust spacing as needed
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Row(
                children: [
                  // GestureDetector(
                  //     onTap: () {
                  //       AppKeys.scaffoldKey.currentState?.openDrawer();
                  //     },
                  //     child: Image.asset('assets/pngs/Ellipse 41.png',)),
                  GestureDetector(onTap: () {
                    AppKeys.scaffoldKey.currentState?.openDrawer();
                  },
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/pngs/iqrapro.png"),
                      radius: 20,
                    ),
                  ),
                  SizedBox(width: 2.5.w,),
                  // getHorizontalSpace(2.w),
                  // Expanded(
                  //   child: SearchCustomTextFormField(
                  //     onTap: () {
                  //       Get.to(() => SearchScreen());
                  //     },
                  //     readOnly: true,
                  //     hintText: 'Search',
                  //     controller: searchController,
                  //     suffixIcon: SvgPicture.asset("assets/svgs/search.svg"),
                  //   ),
                  // ),
                  Spacer(),
                  SvgPicture.asset("assets/svgs/innoHubSearch.svg"),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 1),
                    child: GestureDetector(
                        onTap: () {
                          // Get.to(() => MainChatScreen());
                        },
                        child: Image.asset('assets/pngs/bxs_chat.png',)),
                  )
                ],
              ),
            ),
            SizedBox(height: 1.5.h), // Adjust spacing as needed

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
            Column(
              children: [
                SizedBox(
                  height: .8.h,
                ),
                GestureDetector(onTap: () {
                  Get.to(()=>const EditStartUpScreen());
                },
                  child: Center(
                    child: Text(
                      "Createex",
                      style: AppTextStyles.boldTextStyle.copyWith(
                        color: const Color(0xff424348),
                        fontSize: 14.px,
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Text("Username",style: AppTextStyles.boldTextStyle.copyWith(
                  color: AppColors.primaryColor,
                    fontSize: 14.px,
                  ),),
                ),
                SizedBox(
                  height: .8.h,
                ),
                Center(
                  child: Text(
                    "220k Followers",
                    style: AppTextStyles.boldTextStyle.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 14.px,
                    ),
                  ),
                ),
              ],
            ),
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
                          DetailScreenIt(),
                          // Content for Tab 2
                          ProfilePostScreenIt(),
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
