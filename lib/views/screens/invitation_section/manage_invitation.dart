import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManageInvitation extends StatelessWidget {
  const ManageInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: () {
          Get.back();
        },
            child: Icon(Icons.arrow_back_ios_new,size: 2.4.h, color: AppColors.headingColor,)),
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Manage Invitations',
          style: AppTextStyles.buttonTextStyle.copyWith(
              fontSize: 20.px,
              fontWeight: FontWeight.w600,
              color: AppColors.headingColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: const Offset(0, 4)
                  )
                ]
              ),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 1.4.h,horizontal: 2.h),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Referral ',
                    style: AppTextStyles.buttonTextStyle.copyWith(
                        fontSize: 18.px,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  ),
                  Text(
                    'IN48267',
                    style: AppTextStyles.buttonTextStyle.copyWith(
                        fontSize: 18.px,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: index == 0 ? 1.h : 1.5.h,horizontal: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Example@gmail.com',
                            style: TextStyle(
                                fontSize: 14.px,
                                fontWeight: FontWeight.w400,

                                color: const Color(0xff444545)),
                          ),
                          Text(
                            '10/28/12',
                            style:TextStyle(
                                fontSize: 14.px,
                                fontWeight: FontWeight.w400,

                                color: AppColors.primaryColor
                          ))
                        ],
                      ),
                    ),
                    Divider(color: AppColors.greyColor,)
                  ],
                );
              },
            ),
            SizedBox(height: 40.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 6.w),
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
              ),
                  onPressed: (){}, child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/shareLink.svg",color: Colors.white,),
                  SizedBox(width: 2.w,),
                  Text("Share your invitation link",style: TextStyle(color: Colors.white),),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
