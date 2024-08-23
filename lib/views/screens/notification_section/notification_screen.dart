import 'package:flutter/material.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotiFicationScreen extends StatelessWidget {
  const NotiFicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Notification ',
          style: AppTextStyles.buttonTextStyle.copyWith(
              fontSize: 20.px,
              fontWeight: FontWeight.w600,
              color: AppColors.headingColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.4.h),
        child: Column(
          children: [
            SizedBox(height: 4.6.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Today',
                  style: AppTextStyles.buttonTextStyle
                      .copyWith(color: AppColors.primaryColor),
                ),
                SizedBox(width: .5.h),
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                ))
              ],
            ),
            SizedBox(height: 1.2.h),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: index == 0 ? 0.h : 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'System',
                            style: TextStyle(
                                fontSize: 18.px,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'bold',
                                color: const Color(0xff15141F)),
                          ),
                          Text(
                            '4:00am',
                            style: AppTextStyles.buttonTextStyle
                                .copyWith(color: AppColors.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(height: .8.h),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                        style: TextStyle(
                            fontSize: 12.px,
                            color: const Color(0xff454544),
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 1.4.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Yesterday',
                  style: AppTextStyles.buttonTextStyle
                      .copyWith(color: AppColors.primaryColor),
                ),
                SizedBox(width: .5.h),
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                ))
              ],
            ),
            SizedBox(height: 1.2.h),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: index == 0 ? 0.h : 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'System',
                            style: TextStyle(
                                fontSize: 18.px,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'bold',
                                color: const Color(0xff15141F)),
                          ),
                          Text(
                            '4:00am',
                            style: AppTextStyles.buttonTextStyle
                                .copyWith(color: AppColors.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(height: .8.h),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                        style: TextStyle(
                            fontSize: 12.px,
                            color: const Color(0xff454544),
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 1.4.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '30/06/24',
                  style: AppTextStyles.buttonTextStyle
                      .copyWith(color: AppColors.primaryColor),
                ),
                SizedBox(width: .5.h),
                const Expanded(
                    child: Divider(
                  color: Colors.grey,
                ))
              ],
            ),
            SizedBox(height: 1.2.h),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: index == 0 ? 0.h : 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'System',
                            style: TextStyle(
                                fontSize: 18.px,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'bold',
                                color: const Color(0xff15141F)),
                          ),
                          Text(
                            '4:00am',
                            style: AppTextStyles.buttonTextStyle
                                .copyWith(color: AppColors.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(height: .8.h),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                        style: TextStyle(
                            fontSize: 12.px,
                            color: const Color(0xff454544),
                            fontFamily: 'regular',
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
