import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/utils/app_colors.dart';
import '../../../controllers/utils/text_styles.dart';

class ConnectionRequestScreen extends StatefulWidget {
  const ConnectionRequestScreen({super.key});
  @override
  State<ConnectionRequestScreen> createState() => _ConnectionRequestScreenState();
}

class _ConnectionRequestScreenState extends State<ConnectionRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height:8.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap:(){
                  Get.back();
                },
                    child: const Icon(Icons.arrow_back_ios_new)),
                Text("Connects request",style: AppTextStyles.blackColorN,),
                SizedBox(height: 10.px,width: 10.px,)
              ],
            ),
          ),
          SizedBox(height:2.h),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling inside ListView
            shrinkWrap: true, // Make ListView take up only the necessary space
            itemCount: 5, // Adjust according to your data
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Added horizontal padding
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/pngs/pngprofile.png"),
                          radius: 24, // Reduced radius for smaller avatars
                        ),
                        const SizedBox(width: 16.0), // Replaced SizedBox(width: 2.w) with a fixed value
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Jone Smith", style: AppTextStyles.textBlackColor),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Interests',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.green,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' 8 hour ago',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                        SizedBox(width:3.w),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Handle revise action
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.greyColor),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text('Deny', style: AppTextStyles.blackColorN),
                              ),
                            ),
                            const SizedBox(width: 8.0), // Replaced getHorizontalSpace(1.h) with a fixed value
                            GestureDetector(
                              onTap: () {
                                // Handle go live action
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),border: Border.all(color: AppColors.greenColor3,)
                                ),
                                child: Text(
                                  'Accept',
                                  style: AppTextStyles.blackColorN,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: AppColors.greyColor,)
                  ],
                ),
              );
            },
          ),

        ],),
      ),
    );
  }
}