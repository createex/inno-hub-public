import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final isVisible = true.obs;

  @override
  Widget build(BuildContext context) {
    // final AuthController authController =
    //     Get.put(AuthController(context: context));

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image:   DecorationImage(
                  image: AssetImage("assets/pngs/bg.png"), fit: BoxFit.cover)
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 45.h),
                Text(
                  'Reset Your Password',
                  style: AppTextStyles.boldTextStyle.copyWith(fontSize: 24.px),
                ),
                SizedBox(height: .8.h),
                Text(
                  "Enter your email and we'll send you a link\n to reset your password.",
                  style: AppTextStyles.boldTextStyle.copyWith(fontSize: 14.px,),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextFormField(
                        controller: emailController,
                        title: "Email",
                      ),
                      SizedBox(height: 5.h,),
                      // Obx(
                      //   () => Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       SizedBox(height: 3.h),
                      //       Expanded(
                      //         child: customElevatedButton(
                      //           // title: authController.isLoading.value
                      //           //     ? buttonLoading
                      //           //     :
                      //           title:  Text(
                      //                   'Reset Password',
                      //                   style: AppTextStyles.buttonTextStyle,
                      //                 ),
                      //           onTap: () {
                      //             Get.to(()=>LoginScreen());
                      //             // if (emailController.text.isEmpty) {
                      //             //   ScaffoldMessenger.of(context).showSnackBar(
                      //             //       const SnackBar(
                      //             //           content:
                      //             //               Text('Please enter your email')));
                      //             // } else {
                      //             //   authController.resetPasswordByEmailLink(
                      //             //     email: emailController.text.trim(),
                      //             //   );
                      //             // }
                      //           },
                      //           bgColor: AppColors.primaryColor,
                      //         ),
                      //       ),
                      //       SizedBox(height: 3.h),
                      //     ],
                      //   ),
                      // )
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 3.h),
                          Expanded(
                            child: customElevatedButton(
                              // title: authController.isLoading.value
                              //     ? buttonLoading
                              //     :
                              title:  Text(
                                'Reset Password',
                                style: AppTextStyles.buttonTextStyle,
                              ),
                              onTap: () {
                                Get.back();
                                // if (emailController.text.isEmpty) {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //           content:
                                //               Text('Please enter your email')));
                                // } else {
                                //   authController.resetPasswordByEmailLink(
                                //     email: emailController.text.trim(),
                                //   );
                                // }
                              },
                              bgColor: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(height: 3.h),
                        ],
                      ),
                    ],
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
