import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/bottom_navigation_bar.dart';
import 'package:in_hub/views/screens/auth_section/reset_password.dart';
import 'package:in_hub/views/screens/auth_section/signup_screen.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final AuthController authController=Get.put(AuthController(context: context));

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
          padding: EdgeInsets.symmetric(horizontal: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 45.h,
              ),
              Text(
                "Login",
                style: AppTextStyles.boldTextStyle,
              ),
              SizedBox(
                height: 4.h,
              ),
              customTextFormField(
                prefix: "assets/svgs/email.svg",
                controller: emailController,
                title: "Email",
              ),
              SizedBox(
                height: 1.6.h,
              ),
              customTextFormField(
                prefix: "assets/svgs/password.svg",
                controller: passwordController,
                title: "Password",
              ),
              SizedBox(
                height: .5.h,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                    onTap: () {
                      Get.to(() => ResetPassword());
                    },
                    child: Text(
                      'Forgot password?',
                      style: AppTextStyles.regularStyle,
                    )),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: customElevatedButton(
                        bgColor: AppColors.primaryColor,
                        onTap: () {
                          // if(emailController.text.isEmpty){
                          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('please enter your email')));
                          // }else if(passwordController.text.isEmpty){
                          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('please enter your password')));
                          //
                          // }
                          // else if(passwordController.text.length<6){
                          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('password should at least 6 character')));
                          //
                          // }
                          // else{
                          //   authController.userLoginWithEmailAndPassword(email: emailController.text,
                          //       password: passwordController.text);
                          //
                          // }
                          Get.to(() => const BottomNavigationScreen());
                        },
                        // title:authController.isLoading.value?buttonLoading:
                        title: Text(

                          'Login',
                          style: AppTextStyles.buttonTextStyle,
                        )),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => SignUpScreen());
                },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Don’t have an account?  ',
                      style: AppTextStyles.regularStyle
                          .copyWith(color: AppColors.secondaryColor)),
                  TextSpan(
                      text: 'Create Account', style: AppTextStyles.regularStyle)
                ])),
              ),



            ],
          ),
        ),
      )),
    );
  }
}
