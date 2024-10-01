import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateStartupProfile extends StatelessWidget {
  const CreateStartupProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
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
            color: AppColors.headingColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              Text("Name", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 1.h),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Username", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Company Overview", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Challenges", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Vision", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Looking for", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Product status", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Technology", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Market and Customers", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Target Market", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Company size", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Founding and Growth", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Founding Stage", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Investor Stage", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 1.5.h),

              Text("Team", style: TextStyle(fontWeight: FontWeight.w500)),
              customTextFormFieldProfile(title: ""),
              SizedBox(height: 4.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: customElevatedButton(
                        onTap: () {
                          // Add your functionality here
                        },
                        title: Text(
                          "Create Profile",
                          style: AppTextStyles.buttonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
