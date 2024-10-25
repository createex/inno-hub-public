import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/user_profile_section/profile_screen.dart';
import 'package:in_hub/views/screens/setting_section/setting_screen.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'empty_startup_profile.dart';

class ProfileTabBar extends StatefulWidget {
  const ProfileTabBar({super.key});

  @override
  State<ProfileTabBar> createState() => _ProfileTabBarState();
}

class _ProfileTabBarState extends State<ProfileTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: AppTextStyles.boldTextStyle
              .copyWith(color: AppColors.headingColor, fontSize: 18.px),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: GestureDetector(
                onTap: () {
                  Get.to(() => SettingScreen());
                },
                child: SvgPicture.asset("assets/svgs/setting.svg")),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 8.h), // Adjust spacing as needed// Space before the TabBar
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
                        padding: EdgeInsets.symmetric(horizontal: 2.5.h),
                        indicatorPadding: EdgeInsets.symmetric(horizontal: 4.h),
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
                          Tab(text: "My Profile"),
                          Tab(text: "Startup Profile"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Content for Tab 1
                        ProfileScreen(),
                        // RentedScreen(),
                        // Content for Tab 2
                        const EmptyStartupProfile()
                        // RentedHistoryScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
