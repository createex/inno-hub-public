import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/auth_section/login_screen.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:in_hub/views/screens/auth_section/profileinformation.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/getx_controllers/auth_controllers.dart';
import '../../../controllers/utils/custom_snackbar_error_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController=Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/pngs/innoHubBackground.png"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h),
            child: SingleChildScrollView(scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15.h,),
                  Image.asset("assets/pngs/innoHubSignUp.png"),

                  Text(
                    "Sign up",
                    style: AppTextStyles.boldTextStyle,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  customTextFormField(
                    prefix: "assets/svgs/email.svg",
                    controller:authController.emailController,
                    title: "Email",
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  customTextFormField(
                    prefix: "assets/svgs/password.svg",
                    controller:authController. passwordController,
                    title: "Password",
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  customTextFormField(
                    prefix: "assets/svgs/password.svg",
                    controller:authController.confirmPasswordController,
                    title: "Confirm Password",
                  ),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30.w),
                    child: customTextFormField(
                      prefix: "assets/svgs/invitation.svg",
                      controller:authController.referralController,
                      title: "Referral code",
                      suffix: "assets/svgs/referalIcon.svg",
                      tooltipMessage:
                          "Enter your referral code here to unlock exclusive benefits. Share your code with friends to earn rewards!", // Tooltip text
                    ),
                  ),
                  SizedBox(height: 2.4.h,),

           Obx(()=>  Padding(
             padding:  EdgeInsets.symmetric(horizontal: 18.w),
             child: Row(
               children: [
                 Expanded(
                   child: customElevatedButton(
                       bgColor: AppColors.primaryColor,
                       onTap: () async {
                         if(authController.emailController.text.isEmpty){
                           showErrorSnackBar("Email cannot be empty");
                           return;
                         }else if(authController.passwordController.text.isEmpty){
                           showErrorSnackBar("Password cannot be empty");
                           return;
                         }else if (!isValidEmail.hasMatch(authController.emailController.text)) {
                           showErrorSnackBar("Invalid email format");
                           return;}
                         else if (!isValidPassword.hasMatch(authController.passwordController.text)) {
                           showErrorSnackBar("Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character.");
                           return;
                         }
                         else if(authController.confirmPasswordController.text.isEmpty){
                           showErrorSnackBar("ConfirmPassword cannot be empty");
                           return;
                         }else if(authController.passwordController.text !=authController.confirmPasswordController.text){
                           showErrorSnackBar("Password must be match");
                           return;
                         }
                         else if(authController.referralController.text.isEmpty){
                           showErrorSnackBar("Referral Code cannot be empty");
                           return;
                         }
                         // Check if the email already exists
                         bool emailExists = await authController.checkEmail();
                         if (emailExists) {
                           showErrorSnackBar("This email is already in use.");
                           return; // Stop navigation if the email exists
                         }

                         // Navigate only if the email does not exist
                         Get.to(() => ProfessionalInformation());
                       },
                       title: authController.isLoading.value?
                       LoadingAnimationWidget.waveDots(color: Colors.white, size: 30.px):Text(
                         'Sign up',
                         style: AppTextStyles.buttonTextStyle,
                       )),
                 ),
               ],
             ),
           ),),

                  SizedBox(height: 2.h),
                  GestureDetector(
                    onTap: () {
                     Get.to(()=>LoginScreen());
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
                ],
              ),
            ),
          )),
    );
  }
}
