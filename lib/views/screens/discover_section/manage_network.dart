import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/discover_section/connects_screen.dart';
import 'package:in_hub/views/screens/discover_section/follow_screen.dart';
import 'package:in_hub/views/screens/discover_section/people_followed_you_screen.dart';
import 'package:in_hub/views/screens/discover_section/start_up_follow_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManageNetworkScreen extends StatelessWidget {
  const ManageNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        leading: GestureDetector(onTap: () {
          Get.back();
        },
            child: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Manage network',
          style: AppTextStyles.blackColorN,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        height: mediaQuerySize.height,
        width: mediaQuerySize.width,
        color: AppColors.greyColor2,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                children: [
                  GestureDetector(onTap:(){
                    Get.to(() => const FollowScreen());

                  },
                    child: Text(
                      "People you follow",
                      style: AppTextStyles.textNameBlack7,
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              Get.to(() => const FollowScreen());
                            },
                            icon: const Icon(Icons.arrow_forward))),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                children: [
                  GestureDetector(onTap:(){
                    Get.to(() => PeopleFollowedYouScreen());

                  },
                    child: Text(
                      "People followed you",
                      style: AppTextStyles.textNameBlack7,
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              Get.to(() => PeopleFollowedYouScreen());
                            },
                            icon: const Icon(Icons.arrow_forward))),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                children: [
                  GestureDetector(onTap:(){
                    Get.to(() => const StartUpFollowScreen());

                  },
                    child: Text(
                      "Start Ups you follow",
                      style: AppTextStyles.textNameBlack7,
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              Get.to(() => const StartUpFollowScreen());
                            },
                            icon: const Icon(Icons.arrow_forward))),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(
                children: [
                  GestureDetector(onTap:(){
                    Get.to(() =>  ConnectScreen());

                  },
                    child: Text(
                      "My Connects",
                      style: AppTextStyles.textNameBlack7,
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              Get.to(() =>  ConnectScreen());
                            },
                            icon: const Icon(Icons.arrow_forward))),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
