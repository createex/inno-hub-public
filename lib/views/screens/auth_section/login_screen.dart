import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:in_hub/views/screens/auth_section/reset_password.dart';
import 'package:in_hub/views/screens/auth_section/signup_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/getx_controllers/auth_controllers.dart';
import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/text_styles.dart';
import '../../bottom_navigation_bar.dart';
import '../custom_widgets/custom_widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/pngs/bg.png"), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 45.h),
                Text("Login", style: AppTextStyles.boldTextStyle),
                SizedBox(height: 4.h),
                customTextFormField(
                  prefix: "assets/svgs/email.svg",
                  controller: authController.emailLoginController,
                  title: "Email",
                ),
                SizedBox(height: 1.6.h),
                customTextFormField(
                  prefix: "assets/svgs/password.svg",
                  controller: authController.passwordLoginController,
                  title: "Password",
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => ResetPassword()),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.4.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24)),
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(fontSize: 14.px, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: Obx(() => customElevatedButton(
                        height: 60.px,
                        bgColor: AppColors.primaryColor,
                        onTap: () async {
                          await authController.loginMethod();
                        },
                        title: authController.isLoading.value
                            ? LoadingAnimationWidget.waveDots(color: Colors.white, size: 30.px)
                            : Text('Login', style: AppTextStyles.buttonTextStyle),
                      )),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                GestureDetector(
                  onTap: () => Get.to(() => SignUpScreen()),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Don’t have an account?  ',
                            style: AppTextStyles.regularStyle
                                .copyWith(color: AppColors.secondaryColor)),
                        TextSpan(text: 'Create Account', style: AppTextStyles.regularStyle),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
