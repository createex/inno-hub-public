import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/auth_section/login_screen.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfessionalInformation2 extends StatelessWidget {
  ProfessionalInformation2({super.key});
  final TextEditingController firstController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final RxBool isOpenWhyHere = false.obs;
  final RxBool isOpenCurrentPosition = false.obs;
  final RxBool isOpenSkills = false.obs;
  final RxBool isOpenSelect = false.obs;

  final RxInt isSelected = 0.obs;
  @override
  Widget build(BuildContext context) {
    // final AuthController authController =
    //     Get.put(AuthController(context: context));

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/pngs/background_image.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/pngs/app_logo.png"),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  Text(
                    "Profile Information",
                    style: AppTextStyles.boldTextStyle,
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      isOpenWhyHere.value = !isOpenWhyHere.value;
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
                                  color: AppColors.primaryColor, width: .2.h)),
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
                              isOpenWhyHere.value
                                  ? SizedBox(
                                      height: 2.h,
                                    )
                                  : const SizedBox.shrink(),
                              isOpenWhyHere.value
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
                                                  "Interest ${index + 1}",
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
                    height: 1.6.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      isOpenCurrentPosition.value =
                          !isOpenCurrentPosition.value;
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
                                  color: AppColors.primaryColor, width: .2.h)),
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
                              isOpenCurrentPosition.value
                                  ? SizedBox(
                                      height: 2.h,
                                    )
                                  : const SizedBox.shrink(),
                              isOpenCurrentPosition.value
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
                                                  "Interest ${index + 1}",
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
                    height: 1.6.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      isOpenSkills.value = !isOpenSkills.value;
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
                                  color: AppColors.primaryColor, width: .2.h)),
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
                              isOpenSkills.value
                                  ? SizedBox(
                                      height: 2.h,
                                    )
                                  : const SizedBox.shrink(),
                              isOpenSkills.value
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
                                                  "Interest ${index + 1}",
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
                    height: 1.6.h,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: .4.h),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.shadowColor, width: .2.h))),
                      child: Text(
                        "Select Interests",
                        style: AppTextStyles.boldTextStyle.copyWith(
                            color: AppColors.headingColor, fontSize: 18.px),
                      )),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      isOpenSelect.value = !isOpenSelect.value;
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
                                  color: AppColors.primaryColor, width: .2.h)),
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
                              isOpenSelect.value
                                  ? SizedBox(
                                      height: 2.h,
                                    )
                                  : const SizedBox.shrink(),
                              isOpenSelect.value
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
                                                  "Interest ${index + 1}",
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
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: customElevatedButton(
                            bgColor: AppColors.primaryColor,
                            onTap: () {
                              Get.to(() => LoginScreen());
                            },
                            title: Text(
                              'Create Profile',
                              style: AppTextStyles.buttonTextStyle,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          )),
    );
  }
}
