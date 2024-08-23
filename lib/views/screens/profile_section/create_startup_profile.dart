import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'startup_profile.dart';

class CreateStartupProfile extends StatelessWidget {
  const CreateStartupProfile({super.key});

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
          'Create Startup Profile',
          style: AppTextStyles.buttonTextStyle.copyWith(
              fontSize: 20.px,
              fontWeight: FontWeight.w600,
              color: AppColors.headingColor),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 4.4.h,
                ),
                CircleAvatar(
                  backgroundColor: AppColors.whiteColor,
                  radius: 6.h,
                  child: Icon(
                    Icons.person,
                    size: 5.h,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                TextField(
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.h),
                      ),
                      hintText: 'Email',
                      hintStyle: AppTextStyles.hintTextStyle,
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      isCollapsed: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.4.h),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.4.h),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 2.h,
                        vertical: 1.3.h,
                      ),
                    )),
                SizedBox(
                  height: 1.5.h,
                ),
                TextField(
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.h),
                      ),
                      hintText: 'Industry',
                      hintStyle: AppTextStyles.hintTextStyle,
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      isCollapsed: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.4.h),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.4.h),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 2.h,
                        vertical: 1.3.h,
                      ),
                    )),
                SizedBox(
                  height: 1.5.h,
                ),
                TextField(
                    maxLines: 4,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    cursorColor: AppColors.primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.h),
                      ),
                      hintText: 'Description',
                      hintStyle: AppTextStyles.hintTextStyle,
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      isCollapsed: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.4.h),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1.4.h),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 2.h,
                        vertical: 2.h,
                      ),
                    )),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: customElevatedButton(
                          onTap: () {
                            Get.to(()=>StartUpProfile());
                          },
                            title: Text("Create Profile",
                                style: AppTextStyles.buttonTextStyle)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
