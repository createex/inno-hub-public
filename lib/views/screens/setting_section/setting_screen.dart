import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/invitation_section/manage_invitation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final RxList<String> titles = <String>[
    "Change password",
    "In-App Notifications",
    "Email Notifications",
    "Delete Account"
  ].obs;
  final RxList<String> images = <String>[
    "assets/svgs/password.svg",
    "assets/svgs/inappnotification.svg",
    "assets/svgs/emailnotification.svg",
    "assets/svgs/profileIcon.svg"
  ].obs;
  void navigate(int index) {
    switch (index) {
      case 0:
      // Get.to(() => const ManageInvitation()); // Replace with actual screen
        break;
      case 1:
        Get.to(() => const ManageInvitation()); // Replace with actual screen

        break;
      case 2:
        Get.to(() => SettingScreen()); // Replace with actual screen
        break;
    // Add more cases for additional screens
      default:
      // Get.to(() => DefaultScreen()); // A fallback screen if needed
        break;
    }
  }

  final RxList<bool> isSelected = <bool>[true, false].obs;

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
          'Setting',
          style: AppTextStyles.buttonTextStyle.copyWith(
              fontSize: 20.px,
              fontWeight: FontWeight.w600,
              color: AppColors.headingColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.4.h),
        child: Column(
          children: [
            SizedBox(height: 3.h),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: index == 0 ? 0.h : 1.h),
                  child: GestureDetector(
                    onTap: (){
                      // Get.to(()=>const ManageInvitation());
                      showAlertDialog(context);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(images[index]),
                                SizedBox(
                                  width: 1.h,
                                ),
                                Text(
                                  titles[index],
                                  style: TextStyle(
                                      fontSize: 12.px,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'bold',
                                      color: const Color(0xff272828)),
                                ),
                              ],
                            ),
                            index == 1||index==2
                                ? ToggleSwitch(
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
                                    onToggle: (index) {},
                                  )
                                : Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 2.4.h,
                                    color: const Color(0xff272828),
                                  )
                          ],
                        ),
                        SizedBox(height: 1.8.h),
                          index == 3?const SizedBox.shrink(): const Divider(
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.5.h)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.5.h)),
            padding: EdgeInsets.all(25.px,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(alignment: Alignment.centerRight,
                    child: GestureDetector(onTap: () {
                      Navigator.pop(context);
                    },
                        child: const Icon(Icons.cancel_rounded,color: AppColors.redColor3,))),
                SizedBox(height:1.h),
                Text('Do you really want to Delete the account?',
                    style: AppTextStyles.textRed1),
                SizedBox(height:3.h),
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
                            color: AppColors.redColor3,
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Text('Yes', style: AppTextStyles.textCancel),
                        ),
                      ),
                    ),

                    SizedBox(width:1.h),
                    // Replaced custom method with SizedBox for simplicity
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.px),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Text(
                            'Continue',
                            style: AppTextStyles.textCancel,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
