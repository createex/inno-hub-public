import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'startup_own_profile.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RxBool isPosition = false.obs;
    final RxBool isYou = false.obs;
    final RxBool isSkills = false.obs;
    final RxBool isSelect = false.obs;
    final RxInt isSelected = 0.obs;

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
          'Edit Profile',
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
                // SizedBox(
                //   height: 4.4.h,
                // ),
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.12,
                //   width: MediaQuery.of(context).size.width * 0.4,
                //   decoration: const BoxDecoration(
                //       color: Colors.white,
                //       shape: BoxShape.circle,
                //       image: DecorationImage(
                //           image: AssetImage('assets/pngs/innoHubProfile.png'))),
                // ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: customTextFormField(
                        prefix: "assets/svgs/nameicon.svg",
                        title: "First name",
                      ),
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    Expanded(
                      child: customTextFormField(
                        prefix: "assets/svgs/nameicon.svg",
                        title: "last name",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Username"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "Country"),
                SizedBox(height: 1.5.h,),
                customTextFormFieldProfile(title: "City"),
                SizedBox(height: 1.5.h,),
                GestureDetector(
                  onTap: () {
                    isPosition.value = !isPosition.value;
                  },
                  child: Obx(
                        () => Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 1.6.h, horizontal: 1.6.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.3.h),
                            color: AppColors.whiteColor,
                            border: Border.all(
                                color: AppColors.greyColor.withOpacity(0.2), width: .2.h)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Current Position",
                                  style: AppTextStyles.hintTextStyle,
                                ),
                                SvgPicture.asset("assets/svgs/arrowdown.svg")
                              ],
                            ),
                            isPosition.value
                                ? SizedBox(
                              height: 2.h,
                            )
                                : const SizedBox.shrink(),
                            isPosition.value
                                ? ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      isSelected.value = index;
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "position ${index + 1}",
                                          style: AppTextStyles
                                              .hintTextStyle,
                                        ),
                                        Obx(
                                              () => Container(
                                            height: 2.5.h,
                                            width: 2.5.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(.4.h),
                                                border: Border.all(
                                                    color: AppColors
                                                        .greyColor)),
                                            child: isSelected.value ==
                                                index
                                                ? SvgPicture.asset(
                                                "assets/svgs/tick.svg")
                                                : const SizedBox
                                                .shrink(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                                : const SizedBox.shrink()
                          ],
                        )),
                  ),
                ),
                SizedBox(height: 1.5.h,),
                GestureDetector(
                  onTap: () {
                    isYou.value = !isYou.value;
                  },
                  child: Obx(
                        () => Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 1.6.h, horizontal: 1.6.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.3.h),
                            color: AppColors.whiteColor,
                            border: Border.all(
                                color: AppColors.greyColor.withOpacity(0.2), width: .2.h)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Why are you here",
                                  style: AppTextStyles.hintTextStyle,
                                ),
                                SvgPicture.asset("assets/svgs/arrowdown.svg")
                              ],
                            ),
                            isYou.value
                                ? SizedBox(
                              height: 2.h,
                            )
                                : const SizedBox.shrink(),
                            isYou.value
                                ? ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      isSelected.value = index;
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "position ${index + 1}",
                                          style: AppTextStyles
                                              .hintTextStyle,
                                        ),
                                        Obx(
                                              () => Container(
                                            height: 2.5.h,
                                            width: 2.5.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(.4.h),
                                                border: Border.all(
                                                    color: AppColors
                                                        .greyColor)),
                                            child: isSelected.value ==
                                                index
                                                ? SvgPicture.asset(
                                                "assets/svgs/tick.svg")
                                                : const SizedBox
                                                .shrink(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                                : const SizedBox.shrink()
                          ],
                        )),
                  ),
                ),
                SizedBox(height: 1.5.h,),
                GestureDetector(
                  onTap: () {
                    isSkills.value = !isSkills.value;
                  },
                  child: Obx(
                        () => Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 1.6.h, horizontal: 1.6.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.3.h),
                            color: AppColors.whiteColor,
                            border: Border.all(
                                color: AppColors.greyColor.withOpacity(0.2), width: .2.h)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Skills",
                                  style: AppTextStyles.hintTextStyle,
                                ),
                                SvgPicture.asset("assets/svgs/arrowdown.svg")
                              ],
                            ),
                            isSkills.value
                                ? SizedBox(
                              height: 2.h,
                            )
                                : const SizedBox.shrink(),
                            isSkills.value
                                ? ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      isSelected.value = index;
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "position ${index + 1}",
                                          style: AppTextStyles
                                              .hintTextStyle,
                                        ),
                                        Obx(
                                              () => Container(
                                            height: 2.5.h,
                                            width: 2.5.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(.4.h),
                                                border: Border.all(
                                                    color: AppColors
                                                        .greyColor)),
                                            child: isSelected.value ==
                                                index
                                                ? SvgPicture.asset(
                                                "assets/svgs/tick.svg")
                                                : const SizedBox
                                                .shrink(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                                : const SizedBox.shrink()
                          ],
                        )),
                  ),
                ),
                SizedBox(height: 1.5.h,),
           Align(alignment: Alignment.centerLeft,
             child: Text("Select Interests",style: TextStyle(fontSize: 14.px,color: Color(0xff181919),
                 fontWeight: FontWeight.w700),),
           ),
                SizedBox(height: 1.5.h,),
                GestureDetector(
                  onTap: () {
                    isSelect.value = !isSelect.value;
                  },
                  child: Obx(
                        () => Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            vertical: 1.6.h, horizontal: 1.6.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.3.h),
                            color: AppColors.whiteColor,
                            border: Border.all(
                                color: AppColors.greyColor.withOpacity(0.2), width: .2.h)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select",
                                  style: AppTextStyles.hintTextStyle,
                                ),
                                SvgPicture.asset("assets/svgs/arrowdown.svg")
                              ],
                            ),
                            isSelect.value
                                ? SizedBox(
                              height: 2.h,
                            )
                                : const SizedBox.shrink(),
                            isSelect.value
                                ? ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      isSelected.value = index;
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(
                                          "position ${index + 1}",
                                          style: AppTextStyles
                                              .hintTextStyle,
                                        ),
                                        Obx(
                                              () => Container(
                                            height: 2.5.h,
                                            width: 2.5.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(.4.h),
                                                border: Border.all(
                                                    color: AppColors
                                                        .greyColor)),
                                            child: isSelected.value ==
                                                index
                                                ? SvgPicture.asset(
                                                "assets/svgs/tick.svg")
                                                : const SizedBox
                                                .shrink(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                                : const SizedBox.shrink()
                          ],
                        )),
                  ),
                ),
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
                              Get.to(()=>StartUpOwnProfile());
                            },
                            title: Text("Save",
                                style: AppTextStyles.buttonTextStyle)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,width: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
