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
    "Manage Invitations"
  ].obs;
  final RxList<String> images = <String>[
    "assets/svgs/password.svg",
    "assets/svgs/inappnotification.svg",
    "assets/svgs/emailnotification.svg",
    "assets/svgs/invitation.svg"
  ].obs;
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
                      Get.to(()=>const ManageInvitation());
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
                            index == 1 || index == 2
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
}
