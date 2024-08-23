import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/auth_section/login_screen.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfessionalInformation extends StatelessWidget {
  ProfessionalInformation({super.key});
  final TextEditingController firstController = TextEditingController();
  final TextEditingController lastController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final RxBool isOpen = false.obs;
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
              image: DecorationImage(
                  image: AssetImage("assets/pngs/bg.png"), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 41.h,
                  ),
                  Text(
                    "Profile Information",
                    style: AppTextStyles.boldTextStyle,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: customTextFormField(
                          prefix: "assets/svgs/nameicon.svg",
                          controller: firstController,
                          title: "First name",
                        ),
                      ),
                      SizedBox(
                        width: 1.5.h,
                      ),
                      Expanded(
                        child: customTextFormField(
                          prefix: "assets/svgs/nameicon.svg",

                          controller: lastController,
                          title: "last name",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  customTextFormField1(

                    prefix: "",
                      controller: jobController,
                      title: "Job title",
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
                    height: 1.4.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      isOpen.value = !isOpen.value;
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
                                  color: AppColors.shadowColor, width: .2.h)),
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
                              isOpen.value
                                  ? SizedBox(
                                      height: 2.h,
                                    )
                                  : const SizedBox.shrink(),
                              isOpen.value
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
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: customElevatedButton(
                            bgColor: AppColors.primaryColor,
                            onTap: () {
                              Get.to(()=>LoginScreen());
                              // if (emailController.text.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //           content:
                              //               Text('please enter your email')));
                              // }
                              // else if (passwordController.text.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //           content: Text(
                              //               'please enter your password')));
                              // }
                              // else if (confirmPasswordController
                              //     .text.isEmpty) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //           content: Text(
                              //               'please enter your confirmPasswordController')));
                              // }
                              // else if (passwordController.text.length < 6) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //           content: Text(
                              //               'password should at least 6 character')));
                              // }
                              // else if (passwordController.text !=
                              //     confirmPasswordController.text) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //       const SnackBar(
                              //           content: Text(
                              //               'password and confirmPassword should not match')));
                              // }
                              // else {
                              //   authController.signUpUserWithEmailAndPassword(
                              //       email: emailController.text,
                              //       password: passwordController.text);
                              // }
                            },
                            // title: authController.isLoading.value
                            //     ? buttonLoading
                            //     : Text(
                            //         'Next',
                            //         style: AppTextStyles.buttonTextStyle,
                            //       )
                            title:Text(
                              'Next',
                              style: AppTextStyles.buttonTextStyle,
                            )  ),
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
