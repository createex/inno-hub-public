import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/auth_section/login_screen.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:in_hub/views/screens/profile_section/profile_info_screen_2.dart';
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
                  image: AssetImage("assets/pngs/background_image.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 8.h,
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
                    height: 1.h,
                  ),
                  Text(
                    "Profile Information",
                    style: AppTextStyles.boldTextStyle,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/pngs/user_icon.png'))),
                  ),
                  SizedBox(
                    height: 2.h,
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
                    height: 2.h,
                  ),
                  customTextFormField(
                    title: "Username",
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  customTextFormField(
                    title: "Phone number",
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  customTextFormField(
                    title: "Country",
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  customTextFormField(
                    title: "City",
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
                              Get.to(() => ProfessionalInformation2());
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
                            title: Text(
                              'Next',
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
