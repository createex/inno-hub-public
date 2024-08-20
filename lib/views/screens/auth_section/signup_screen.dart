import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:in_hub/views/screens/profile_section/profileinformation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final AuthController authController=Get.put(AuthController(context: context));

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
                    "Sign up",
                    style: AppTextStyles.boldTextStyle,
                  ),
                  SizedBox(
                    height: 11.h,
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
                    height: 1.6.h,
                  ),
                  customTextFormField(
                    prefix: "assets/svgs/password.svg",
                    controller: confirmPasswordController,
                    title: "Confirm Password",
                  ),
                  SizedBox(
                    height: 2.4.h,
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
                              // }else if(confirmPasswordController.text.isEmpty){
                              //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('please enter your confirmPasswordController')));
                              //
                              // }
                              // else if(passwordController.text.length<6){
                              //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('password should at least 6 character')));
                              //
                              // }
                              // else if(passwordController.text!=confirmPasswordController.text){
                              //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('password and confirmPassword should not match')));
                              //
                              //
                              // }else{
                              //   authController.signUpUserWithEmailAndPassword(email: emailController.text,
                              //       password: passwordController.text);
                              //
                              // }
                              Get.to(() => ProfessionalInformation());
                            },
                            title: Text(
                              'Sign up',
                              style: AppTextStyles.buttonTextStyle,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Already have an Account?  ',
                          style: AppTextStyles.regularStyle
                              .copyWith(color: AppColors.secondaryColor)),
                      TextSpan(text: 'Login', style: AppTextStyles.regularStyle)
                    ])),
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svgs/google.svg"),
                      SizedBox(
                        width: 1.6.h,
                      ),
                      SvgPicture.asset("assets/svgs/apple.svg"),
                      SizedBox(
                        width: 1.6.h,
                      ),
                      SvgPicture.asset("assets/svgs/linkdin.svg"),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
