import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/utils/app_colors.dart';

class SimilarInterest extends StatefulWidget {
  const SimilarInterest({super.key});

  @override
  State<SimilarInterest> createState() => _SimilarInterestState();
}

class _SimilarInterestState extends State<SimilarInterest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios_new)),
                Text(
                  "People with similar interests",
                  style: AppTextStyles.buttonTextStyle
                      .copyWith(color: AppColors.secondaryColor),
                ),
                SizedBox(
                  height: 10.px,
                  width: 10.px,
                )
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 2.w, // Spacing between columns
                  mainAxisSpacing: 1.h, // Spacing between rows
                  childAspectRatio: 0.75, // Aspect ratio for each item
                ),
                itemCount: 10, // Number of items
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => const SimilarInterest());
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.px),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.px),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                const AssetImage("assets/pngs/pngprofile.png"),
                            radius: 40.px,
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            "Zeeshan",
                            style: TextStyle(
                              fontSize: 18.px,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          Text(
                            "Interest",
                            style: TextStyle(
                              fontSize: 14.px,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.px),
                                side: const BorderSide(
                                  color: AppColors.greenColor3,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Text(
                              "Connect",
                              style: TextStyle(
                                fontSize: 16.px,
                                color: AppColors.greenColor3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
