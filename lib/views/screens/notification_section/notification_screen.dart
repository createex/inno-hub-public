import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:in_hub/controllers/utils/app_colors.dart';
import 'package:in_hub/controllers/utils/text_styles.dart';
import 'package:in_hub/views/screens/chat_section/main_chat.dart';
import 'package:in_hub/views/screens/custom_widgets/custom_textformfield.dart';
import 'package:in_hub/views/screens/search_section/search_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotiFicationScreen extends StatelessWidget {
  NotiFicationScreen({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8.h), // Adjust spacing as needed

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Row(
              children: [
                Image.asset('assets/pngs/Ellipse 41.png'),
                SizedBox(
                  width: 2.5.w,
                ),
                // getHorizontalSpace(2.w),
                Expanded(
                  child: SearchCustomTextFormField(
                    controller: searchController,
                    onTap: () {
                      Get.to(() => SearchScreen());
                    },
                    readOnly: true,
                    hintText: 'Search',
                    suffixIcon: SvgPicture.asset("assets/svgs/search.svg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 1),
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => const MainChatScreen());
                      },
                      child: Image.asset('assets/pngs/bxs_chat.png')),
                )
              ],
            ),
          ),
          SizedBox(height: 3.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.6.h),
            child: Column(
              children: [
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
                      padding: EdgeInsets.symmetric(
                          vertical: index == 0 ? 0.h : 3.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('New Message'),
                              Text(
                                '4:00am',
                                style: AppTextStyles.buttonTextStyle
                                    .copyWith(color: AppColors.primaryColor),
                              )
                            ],
                          ),
                          Container(
                            height: mediaQuerySize.height * 0.05,
                            width: mediaQuerySize.width * 0.4,
                            decoration: const BoxDecoration(
                                color: AppColors.greyColor9,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(10),
                                )),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/pngs/pngprofile.png"),
                                  radius:
                                      20, // Reduced radius for smaller avatars
                                ),
                                SizedBox(
                                  width: mediaQuerySize.width * 0.02,
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  'Zeeshan Rana',
                                  style: TextStyle(
                                      fontSize: 12.px,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'bold',
                                      color: const Color(0xff15141F)),
                                ),
                              ],
                            ),
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
                      padding: EdgeInsets.symmetric(
                          vertical: index == 0 ? 0.h : 3.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add Comment',
                                style: TextStyle(
                                    fontSize: 14.px,
                                    color: const Color(0xff15141F)),
                              ),
                              Text(
                                '4:00am',
                                style: AppTextStyles.buttonTextStyle
                                    .copyWith(color: AppColors.primaryColor),
                              )
                            ],
                          ),
                          Container(
                            height: mediaQuerySize.height * 0.05,
                            width: mediaQuerySize.width * 0.4,
                            decoration: const BoxDecoration(
                                color: AppColors.greyColor9,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(10),
                                )),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/pngs/pngprofile.png"),
                                  radius:
                                      20, // Reduced radius for smaller avatars
                                ),
                                SizedBox(
                                  width: mediaQuerySize.width * 0.02,
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  'Zeeshan Rana',
                                  style: TextStyle(
                                      fontSize: 12.px,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'bold',
                                      color: const Color(0xff15141F)),
                                ),
                              ],
                            ),
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
                      padding: EdgeInsets.symmetric(
                          vertical: index == 0 ? 0.h : 3.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reply',
                                style: TextStyle(
                                    fontSize: 14.px,
                                    color: const Color(0xff15141F)),
                              ),
                              Text(
                                '4:00am',
                                style: AppTextStyles.buttonTextStyle
                                    .copyWith(color: AppColors.primaryColor),
                              )
                            ],
                          ),
                          Container(
                            height: mediaQuerySize.height * 0.05,
                            width: mediaQuerySize.width * 0.4,
                            decoration: const BoxDecoration(
                                color: AppColors.greyColor9,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(10),
                                )),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/pngs/pngprofile.png"),
                                  radius:
                                      20, // Reduced radius for smaller avatars
                                ),
                                SizedBox(
                                  width: mediaQuerySize.width * 0.02,
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  'Zeeshan Rana',
                                  style: TextStyle(
                                      fontSize: 12.px,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'bold',
                                      color: const Color(0xff15141F)),
                                ),
                              ],
                            ),
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
        ],
      ),
    );
  }
}
