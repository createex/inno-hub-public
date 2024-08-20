import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'login_screen.dart';

class EmailConfirmation extends StatefulWidget {
  const EmailConfirmation({super.key});

  @override
  State<EmailConfirmation> createState() => _EmailConfirmationState();
}

class _EmailConfirmationState extends State<EmailConfirmation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        return Get.to(() => LoginScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.7.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 24.h,
                  width: 24.h,
                  child: SvgPicture.asset('assets/svgs/verification.svg')),
              SizedBox(height: 2.1.h),
              Text(
                'Email Confirmation',
                style: AppTextStyles.boldTextStyle
                    .copyWith(color: AppColors.secondaryColor)
                    .copyWith(fontFamily: 'regular', fontSize: 24.px),
              ),
              SizedBox(height: .6.h),
              Text(
                'Please check your email to verify \nyour registration.',
                textAlign: TextAlign.center,
                style: AppTextStyles.boldTextStyle
                    .copyWith(color: AppColors.secondaryColor)
                    .copyWith(fontFamily: 'regular', fontSize: 13.px),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
