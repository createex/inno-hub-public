import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'startup_own_profile.dart';

class EditStartUpScreen extends StatelessWidget {
  const EditStartUpScreen({super.key});

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
          'Edit Startup Profile',
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
                customTextFormFieldProfile(title: "Name"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Username"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Bio"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Looking for"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Industry"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Size"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Product status"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Target market"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Investor stage"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Vison"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Team"),

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
                             },
                            title: Text("Save",
                                style: AppTextStyles.buttonTextStyle)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16,width: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
